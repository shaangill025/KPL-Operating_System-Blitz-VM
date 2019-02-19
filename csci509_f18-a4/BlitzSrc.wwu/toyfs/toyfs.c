/*  
 *  Phil Nelsons toy fs for CSCI 509 using Blitz
 *
 *  Started 4/11/13
 *
 *  Needs to be compiled with -m32 (using gcc)
 *
 */

#include <sys/types.h>
#include <arpa/inet.h>  // gets htonl, htons ...
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>

// Toyfs stored in big endian format for Blitz

#define int32 long
#define int16 short

#define SECSIZE     8192
#define INODESIZE   64
#define INODEPERSEC 128
#define BITMAPSIZE  2044

typedef struct toy_rootsec {
  char         magic[4];            // magic number ... TyFs
  int32        fssize;              // Size in 8k sectors
  int32        numInodes;           // Total number of inodes
  int32        spare;               // Did I forget something?
  unsigned int bitmap[BITMAPSIZE];  // inodes and data bitmaps <size, map>
} toy_rootsec;

#define TYPE_FILE   0x10
#define TYPE_DIR    0x20
#define TYPE_TERM   0x40
#define MODE_READ   0x04
#define MODE_WRITE  0x02
#define MODE_EXE    0x01

typedef struct toy_inode {
  int16    nlinks;      // Number of links in directories
  int16    mode;        // file type, rwx in bottom 3 bits.
  int32    fsize;       // file size in bytes
  int32    balloc;      // blocks allocated (including indirect blocks)
  int32    dpSize;
  int32    direct[10];  // direct block sector pointers
  int32    indir1;      // first indirect block
  int32    indir2;      // second level indirect (not implemented here)
} toy_inode;

// These need to start on a 4 byte boundary
typedef struct toy_dirEnt {
  int32    inodeNum;
  int32    nameLen;  // 1 to 255 -- int32 for KPL ease of use
  char     name[256];     //  Not zero terminated
} toy_dirEnt;

// Global variables used by command line arguments
char *DiskName = "DISK";
int  Debug = 0;
int  SetX  = 0;  // Set execute bit on creation

//  ******* Some Utility Routines *********

// For convience?
int ent_inodeNum ( toy_dirEnt *ent) {
  return (short) htonl(ent->inodeNum);
}

//  Global Data for utility routines ...
toy_rootsec RootSec;
int numInodes;
int numInodeSectors;
int inodeBitmapSize;
int numDataSectors;
int dataBitmapSize;
int toyFsSize;
int diskFd;

void openDisk (int newDisk)
{
  diskFd = open (DiskName, O_RDWR | (newDisk ? O_CREAT | O_EXCL : 0), 0666);
  if (diskFd < 0) {
    fprintf (stderr, "Disk file \"%s\": %s\n", DiskName,
	     strerror(errno));
    exit(1);
  }

  if (newDisk)
    return;

  char diskID[5];

  int sz = read (diskFd, diskID, 4);
  if (sz != 4) {
    fprintf (stderr, "Could not read disk file \"%s\": %s\n", DiskName,
	     strerror(errno));
    exit(1);
  }
  diskID[4] = 0;
  if (strcmp (diskID, "BLZd") != 0) {
    fprintf (stderr, "Disk file \"%s\" is not a BLITZ disk: %s\n", DiskName,
	     strerror(errno));
    exit(1);
  }

  sz = read (diskFd, &RootSec, sizeof(RootSec));
  if (sz < 0) {
    fprintf (stderr, "Could not read disk file \"%s\": %s\n", DiskName,
	     strerror(errno));
    exit(1);
  }

  // Check validity of disk ... e.g. magic number
  if (strncmp (RootSec.magic, "TyFs ", 4) != 0) {
    fprintf (stderr, "Disk file \"%s\" is not a Toy FS disk: %s\n", DiskName,
	     strerror(errno));
    exit(1);
  }

  numInodes = ntohl(RootSec.numInodes);
  numInodeSectors = numInodes / INODEPERSEC;
  numDataSectors = ntohl(RootSec.fssize) - numInodeSectors - 1;
  toyFsSize = ntohl(RootSec.fssize);
  inodeBitmapSize = numInodes / 32 + 1;
  dataBitmapSize = numDataSectors / 32 + 1;

  if (Debug)
    fprintf (stderr, "Opened Disk File %s, %d inodes sec, %d data sec\n",
	     DiskName, numInodeSectors, numDataSectors);
}

void report_stats()
{
  printf ("ToyFs Disk: %d inodes, %d dataSectors\n", numInodes, numDataSectors);
 
  int ix, jx;
  int inCount = -1;  // Will always count bit 0 which is not used
  int bkCount = -1;
  int t;

  for (ix = 1; ix <= inodeBitmapSize; ix++) {
    t = RootSec.bitmap[ix];
    for (jx = 0 ; jx < 32; jx ++ ) {
      inCount += t&1;
      t = t >> 1;
    }
  }
  for (ix = 1; ix <= dataBitmapSize; ix++) {
    t = RootSec.bitmap[inodeBitmapSize+1+ix];
    for (jx = 0 ; jx < 32; jx ++ ) {
      bkCount += t&1;
      t = t >> 1;
    }
  }
  printf ("    Used inodes: %d,  Used data Blocks: %d\n", inCount, bkCount);
  
}

// Number num is 0 based here!

int get_sector (int num, void *data)
{
  ssize_t ret;

  if (num < 0 || num >= toyFsSize)
    return -1;

 if (lseek (diskFd, 4+num*SECSIZE, SEEK_SET) != 4+num*SECSIZE) {
    fprintf (stderr, "get_sector lseek problem.\n");
    return -1;
  }

  if ((ret = read (diskFd, data, SECSIZE)) != SECSIZE) {
    fprintf (stderr, "get_sector read sector problem.\n");
    return -1;
  }
  return 0;
}

// Number num is 0 based here!

int put_sector (int num, void *data)
{
  ssize_t ret;

  if (num < 0 || num >= toyFsSize)
    return -1;

 if (lseek (diskFd, 4+num*SECSIZE, SEEK_SET) != 4+num*SECSIZE) {
    fprintf (stderr, "put_sector lseek problem.\n");
    return -1;
  }

  if ((ret = write (diskFd, data, SECSIZE)) != SECSIZE) {
    fprintf (stderr, "put_sector read sector problem.\n");
    return -1;
  }
  return 0;
}

// num here is 1 based!

int get_inode (int num, toy_inode *inode)
{
  char data[SECSIZE];
  int sec = (num-1) / INODEPERSEC;
  int offset = (num-1) % 128 * INODESIZE;
  int ix;

  if (num < 1 || num > numInodeSectors*INODEPERSEC)
    return -1;


  if (get_sector (sec+1, data) < 0)
    return -1;

  *inode = *((toy_inode *)&data[offset]);
  inode->nlinks = ntohs(inode->nlinks);
  inode->mode = ntohs(inode->mode);
  inode->fsize = ntohl(inode->fsize);
  inode->balloc = ntohl(inode->balloc);
  inode->indir1 = ntohl(inode->indir1);
  inode->indir2 = ntohl(inode->indir1);
  for (ix = 0; ix < 10; ix++)
    inode->direct[ix] = ntohl(inode->direct[ix]);
  return num;
}

// inode number is 1 based here

int put_inode (int num, toy_inode *inodep)
{
  char data[SECSIZE];
  int sec = (num-1) / INODEPERSEC;
  int offset = (num-1) % 128 * INODESIZE;
  int ix;
  toy_inode inode = *inodep;

  if (num < 1 || num > numInodeSectors*INODEPERSEC)
    return -1;

  if (get_sector (sec+1, data) < 0)
    return -1;

  inode.nlinks = ntohs(inode.nlinks);
  inode.mode = ntohs(inode.mode);
  inode.fsize = ntohl(inode.fsize);
  inode.balloc = ntohl(inode.balloc);
  inode.indir1 = ntohl(inode.indir1);
  inode.indir2 = ntohl(inode.indir1);
  inode.dpSize = 10;  // Size of the array
  for (ix = 0; ix < 10; ix++)
    inode.direct[ix] = ntohl(inode.direct[ix]);

  *((toy_inode *)&data[offset]) = inode;

  if (put_sector (sec+1, data) < 0)
    return -1;

  return num;  
}

int get_free_inode()
{
  int ix;
  int bx;

  // printf ("GetFreeInode\n");

  for (ix = 1; ix <= inodeBitmapSize; ix++) 
    if (RootSec.bitmap[ix] != (char)0xffffffff)
      break;

  if (ix > inodeBitmapSize)
    return -1;

  for (bx = 0; bx < 32; bx++)
    if (((ntohl(RootSec.bitmap[ix]) >> bx) & 0x1) == 0)
      break;

  // Update it on "disk"
  RootSec.bitmap[ix] |= htonl(1 << bx);

  if (put_sector(0, &RootSec) < 0)
    return -1;

  return (ix-1) * 32 + bx;  
}

int free_inode(int inodenum)
{
  int ix = (inodenum-1) / 32 + 1;
  int bx = (inodenum-1) % 32;

  RootSec.bitmap[ix] ^= htonl(1 << bx);

  if (put_sector(0, &RootSec) < 0)
    return -1;

  return 0;
}

int create_new_inode (int kind, toy_inode *inode, int mode)
{
  int inum = get_free_inode();
  if (inum < 0) return -1;
  inode->nlinks = 0;
  inode->mode = kind | mode;
  inode->fsize = 0;
  inode->balloc = 0;
  inode->dpSize = 10;
  int ix;
  for (ix = 0; ix < 10; ix++) 
    inode->direct[ix] = 0;
  inode->indir1 = 0;
  inode->indir2 = 0;
  if (put_inode(inum, inode) < 0)
    return -1;
  return inum;
}

int get_free_sector ()
{
  int ix;
  int bx;

  int offset = inodeBitmapSize + 1; 

  for (ix = 1; ix <= dataBitmapSize; ix++) 
    if (RootSec.bitmap[offset+ix] != (char)0xffffffff)
      break;

  if (ix > dataBitmapSize)
    return -1;

  for (bx = 0; bx < 32; bx++)
    if (((ntohl(RootSec.bitmap[offset+ix]) >> bx) & 0x1) == 0)
      break;

  // Update it on "disk"
  RootSec.bitmap[offset+ix] |= htonl(1 << bx);

  if (put_sector(0, &RootSec) < 0)
    return -1;

  return (ix-1) * 32 + bx;  
}

int free_sector(int secnum)
{
  int ix = (secnum-1) / 32 + inodeBitmapSize + 2; 
  int bx = (secnum-1) % 32;

  RootSec.bitmap[ix] ^= htonl(1 << bx);

  if (put_sector(0, &RootSec) < 0)
    return -1;

  return 0;
}

int init_dir_data (int dataSecNum, int dotInum, int dotdotInum) 
{
  unsigned char sector[SECSIZE] = {0};

  // Write the root directory
  toy_dirEnt *dirEnt;

  dirEnt = (toy_dirEnt *)&sector[0];
  dirEnt->inodeNum = htonl(dotInum);
  dirEnt->nameLen = htonl(1);
  strcpy(dirEnt->name, ".");

  dirEnt = (toy_dirEnt *)&sector[12];
  dirEnt->inodeNum = htonl(dotdotInum);
  dirEnt->nameLen = htonl(2);
  strcpy(dirEnt->name, "..");

  dirEnt = (toy_dirEnt *)&sector[24];
  dirEnt->inodeNum = htonl(-1);

  if (Debug) {
    fprintf (stderr, "putting sector %d with an initial dir image.\n",
	     numInodeSectors + dataSecNum);
  }
  if (put_sector (numInodeSectors + dataSecNum, sector) < 0) {
    fprintf (stderr, "Error creating Toy FS disk directory, aborting.\n");
    return -1;
  }
  return 0;
}

int entSize (int numChars)
{
  if (numChars % 4 == 0)
    return 8+numChars;
  else
    return 8+numChars+4-numChars%4;
}

int name_to_inode (char *name)
{
  toy_inode dir;	// Directory inode we are using
  int dir_num;		// number of the inode
  toy_inode next;	// Inode of the entry we found
  int next_num;         // inode number of the entry
  char local[256];      // Local copy
  char *curr;		// pointer to the current element
  char *save = NULL;		// pointer to the remainder of the name.

  // Start processing the name
  strcpy(local, name);
  curr = local;
  while (*curr == '/') curr++;

  // Simple case ... Root!
  if (*curr == 0) return 1;

  // Have to look things up .... root inode is always "cwd"  
  if (get_inode (1, &dir) < 0) {
    fprintf (stderr, "name_to_inode, can't get root directory.\n");
    return -1;
  }

  // Loop over the name
  while (curr != NULL && *curr && (dir.mode & TYPE_DIR) == TYPE_DIR) {
    save = curr;

    // Find the end of the current element, / or EOS
    while (*save != '/' && *save != 0) save++;
    if (*save == '/') {
      *save = 0;
      save++;
      while (*save == '/') save++;  // Skip over multiple slashes
    } else {
      save = NULL;
    }
    // Verify current name is not null
    if (*curr == 0) {
      fprintf (stderr, "Bad Element in name '%s'\n", name);
      return -1;
    }

    // Now look up the element name pointed to by curr
    int len = strlen(curr);
    char sec[SECSIZE];
    int dirix;
    int maxix = (dir.fsize+SECSIZE) / SECSIZE;
    int ix;
    toy_dirEnt *ent;

    // Search a sector of the directory
    for (dirix = 0; dirix < maxix; dirix++) {
      if (get_sector(dir.direct[dirix] + numInodeSectors, sec) < 0) {
	fprintf (stderr, "File System inconsistency.  Bad direct block.\n");
	exit(1);
      }
      // Scan the sector
      ix = 0;
      ent = (toy_dirEnt *)sec;
      while (ntohl (ent->inodeNum) > 0) {
	if (ntohl(ent->nameLen) == len) {
	  if (strncmp (ent->name, curr, len) == 0)
	    break;
	}
	ix += entSize(ntohl(ent->nameLen));
	ent = (toy_dirEnt *)&sec[ix];
      }
      
      // Did we find it?
      if (ntohl (ent->inodeNum) > 0)
	break;
    }

    if (dirix == maxix) {
      return -2;  // File not found
    }

    // Read the next entry
    if (get_inode (ntohl(ent->inodeNum), &next) < 0) {
      fprintf (stderr, "name_to_inode, can't get inode in path.\n");
      return -1;
    }
    next_num = ntohl(ent->inodeNum);

    // Make next current ...
    curr = save;
    dir = next;
    dir_num = next_num;

  }

  if (curr != NULL) {
    fprintf (stderr, "%s: not a valid path\n", name);
    return -1;
  }

  return dir_num;
  
}

// Data for start_dirread and get_next_dir_ent()
unsigned char dir_sec[SECSIZE];
int dir_db_ix, dir_sec_ix;
toy_inode dir_inode;

void start_dirread (toy_inode *dir)
{
  dir_db_ix = 0;
  dir_sec_ix = -1;
  dir_inode = *dir;
}

toy_dirEnt *get_next_dir_ent (int *db_ix, int *sec_ix)
{
  // Read next sector if needed
  if (dir_sec_ix < 0) {
    if (get_sector(numInodeSectors+dir_inode.direct[dir_db_ix], dir_sec) < 0) {
      if (db_ix) *db_ix = -1;
      return NULL;
    }
    
    dir_sec_ix = 0;
  }

  // Return the current location
  if (db_ix) *db_ix = dir_db_ix;
  if (sec_ix) *sec_ix = dir_sec_ix;

  // Get current entry
  toy_dirEnt *retval = (toy_dirEnt *) & dir_sec[dir_sec_ix];

  // Are we at the end?
  if ((short)ntohl(retval->inodeNum) == -1) 
    return NULL;

  // Update for next one
  dir_sec_ix +=  entSize(ntohl(retval->nameLen));
  if (((toy_dirEnt *)&dir_sec[dir_sec_ix])->inodeNum == 0) {
    dir_db_ix++;
    dir_db_ix = -1;
  }

  return retval;
}

toy_dirEnt * toy_lookup ( char *name, toy_inode *dir_inode, int *loc)
{
  int db_ix, sec_ix;
  int sv_ix = -1, sv_sec = -1 ;
  toy_dirEnt *ent;
  int nlen = strlen(name);
  start_dirread(dir_inode);
  while ((ent = get_next_dir_ent(&db_ix, &sec_ix)) != NULL) {
    if (ntohl(ent->nameLen) == nlen && strcmp (ent->name, name) == 0) {
      if (loc) *loc = db_ix * SECSIZE + sec_ix;
      return ent;
    }
    if (sv_ix != db_ix && sv_sec == -1) {
      if (sv_ix != -1 && (SECSIZE - sec_ix - 5 > nlen))
	sv_sec = sec_ix;
      sv_ix = db_ix;
    }
  }
  if (loc) {
    if (sv_sec == -1)
      *loc = db_ix * SECSIZE + sec_ix;
    else
      *loc = sv_ix * SECSIZE + sv_sec;
  }
  return NULL;
}

// Do the correct thing for both cases .... 
//   Regular file -> don't add link counts ...
//   Directory file -> add link counts, build "." and ".."

int add_dir_entry ( char * name,
		    int dir_inode_num, toy_inode *dir_inode, 
		    int new_inode_num, toy_inode *new_inode)
{
  

  // find the place to add the name in the file
  // save the inodes.
  char sec[SECSIZE];
  int dx_ix;	// index in the direct entries
  int sec_ix;	// index into the sector for the entries.
  toy_dirEnt *ent;
  int nameLen = strlen(name);

  int f_adr; // Address in the file of the place to add the next item

  // Check and see if the name exists
  ent = toy_lookup (name, dir_inode, &f_adr);
  if (ent != NULL) {
    fprintf (stderr, "%s: entry already exists, can't add a duplicate.\n",
	     name);
    return -2;
  }

  dx_ix = f_adr / SECSIZE;
  sec_ix = f_adr % SECSIZE;
  if (dir_inode->direct[dx_ix]) {
    // Data exists
    if (get_sector (dir_inode->direct[dx_ix]+numInodeSectors, sec) < 0 ) {
      fprintf (stderr, "BUG! add_dir_entry!\n");
      exit(1);
    }
  } else {
    fprintf (stderr, "BUG! lookup returned bad data!\n");
    exit(1);
  }

  // Look at the location where we will insert
  ent = (toy_dirEnt *) &sec[sec_ix];
  int val = ent_inodeNum(ent);
  if (Debug) {
    fprintf (stderr, "insert entry inode val = %d\n", val);
  }

  // Special case ... not enough space left in current sec
  //     and  at the end of the directory, start a new sector
  //     unless we are out!
  if (val == -1 && (SECSIZE - sec_ix - 5 - nameLen) < 5) {
    // Need to start a new sector ...
    if (dx_ix == 9) 
      return -1;
    // Start a new one!
    ent->inodeNum = 0;
    if (put_sector (dir_inode->direct[dx_ix]+numInodeSectors, sec) < 0 ) {
      fprintf (stderr, "BUG! add_dir_entry!\n");
      exit(1);
    }
    dx_ix++;
    int newsec = get_free_sector();
    if (newsec < 0) {
      fprintf (stderr, "Out of space on FS!\n");
      return -2;
    }
    dir_inode->direct[dx_ix] = newsec;
    dir_inode->balloc++;
    memset(sec, 0, SECSIZE);
    sec_ix = 0;
    ent = (toy_dirEnt *) &sec[sec_ix];
  }

  // We can add the entry here
  ent->inodeNum = htonl(new_inode_num);
  ent->nameLen = htonl(nameLen);
  strcpy(ent->name, name);
  sec_ix += entSize(nameLen);
  ent = (toy_dirEnt *)&sec[sec_ix];
  ent->inodeNum = htonl(val);
  // Write out the entry and if modified, the 
  if (put_sector (dir_inode->direct[dx_ix]+numInodeSectors, sec) < 0) {
    fprintf (stderr, "BUG! add_dir_entry!\n");
    exit(1);
  }

  // if new is a directory, build the entries "." and ".."
  // save the new inode and dir contents
  if (new_inode->mode & TYPE_DIR) {
    int dataSec = get_free_sector();
    new_inode->direct[0] = dataSec;
    if (init_dir_data (dataSec, new_inode_num, dir_inode_num) < 0) {
      fprintf (stderr, "BUG! Could not init directory.\n");
      exit(1);
    }
    new_inode->fsize = 28;
    new_inode->nlinks = 1;
    new_inode->mode |= MODE_READ | MODE_WRITE;
    dir_inode->nlinks++;
  }

  if (val == -1) {
    dir_inode->fsize = dx_ix * SECSIZE + sec_ix + 4;
  }
  if (val == -1 || new_inode->mode & TYPE_DIR) {
    if (put_inode (dir_inode_num, dir_inode) < 0) {
      fprintf (stderr, "BUG! add_dir_entry!\n");
      exit(1);
    }
  }

  // Update link count in the new inode.
  new_inode->nlinks++;
  if (put_inode (new_inode_num, new_inode) < 0) {
    fprintf (stderr, "BUG! add_dir_entry!\n");
    exit(1);
  }
  
  return 0;
}


//  *************************************************
//  ****** Make a new directory in the FS  **********
//  *************************************************

void toy_mkdir(char *name)
{
  char *entName;  // Last component
  char *dirName;

    entName = strrchr(name, '/');
  if (!entName) {
    entName = name;
    dirName = "/";
  } else {
    *entName = 0;
    entName++;
    dirName = name;
  }

  int dirInum = name_to_inode (dirName);
  if (dirInum < 0) {
     fprintf (stderr, "%s: can't find parent directory.\n", name);
    return;
  }

  toy_inode inode;
  if (get_inode (dirInum, &inode) < 0) {
    fprintf (stderr, "%s: can't read inode. (BUG!)\n", name);
    return;
  }

  if (!(inode.mode & TYPE_DIR)) {
    fprintf (stderr, "%s: parent must be a directory\n", name);
    return;
   }

  toy_inode newDir;
  int newInum;
  newInum = create_new_inode (TYPE_DIR, &newDir, MODE_READ|MODE_WRITE);
  if (newInum < 0) {
    fprintf (stderr, "%s: can not create new directory.\n", name);
    return;
   }

  if (add_dir_entry (entName, dirInum, &inode, newInum, &newDir) < 0) {
    fprintf (stderr, "%s: can not link to new dir.\n", name);
    return;
  }
}

//  *************************************************
//  ****** Change the mode on an inode **************
//  *************************************************

void toy_chmod(int mode, char *name)
{
  int inum = name_to_inode (name);

  if (inum < 0) {
    fprintf (stderr, "%s: no such file or directory\n", name);
    return;
  }

  toy_inode inode;
  if (get_inode (inum, &inode) < 0) {
    fprintf (stderr, "%s: can't read inode. (BUG!)\n", name);
    return;
  }

  inode.mode = (inode.mode & (TYPE_FILE | TYPE_DIR)) | mode;

  if (put_inode (inum, &inode) < 0) {
    fprintf (stderr, "%s: can't write inode. (BUG!)\n", name);
    return;
  }
}

//  *************************************************
//  *********** List files in the FS  ***************
//  *************************************************

void print_inode ( int inode_num, toy_inode *inode, char *name, int nameLen, int indent)
{
 // Print the inode information
  printf ("%*d ", indent, inode_num);
  if (inode->mode & TYPE_DIR)
    printf ("d");
  else
    printf ("-");
  if (inode->mode & MODE_READ)
    printf ("r");
  else
    printf ("-");
  if (inode->mode & MODE_WRITE)
    printf ("w");
  else
    printf ("-");
  if (inode->mode & MODE_EXE)
    printf ("x");
  else
    printf ("-");
  printf ("  %2d %8ld  %.*s\n", inode->nlinks, inode->fsize, nameLen, name);  
}

void toy_list(char *name)
{
  toy_inode finode;
  int inum;

  inum = name_to_inode (name);

  if (Debug) fprintf (stderr, "toy_list: %s (%d)\n", name, inum);

  if (inum < 0) {
    if (inum == -2)
      fprintf (stderr, "%s: file not found\n", name);
    return;
  }

  if (get_inode (inum, &finode) < 0) {
    fprintf (stderr, "%s: error getting inode\n", name);
    return ;
  }

  print_inode (inum, &finode, name, strlen(name), 4);

  // Now, if it is a directory, print all elements in it.
  if (finode.mode & TYPE_DIR) {
    toy_dirEnt *ent;
    toy_inode ent_node;
    start_dirread (&finode);
    while ((ent = get_next_dir_ent (NULL, NULL)) != NULL) {
      int ent_inum = (short)ntohl(ent->inodeNum);
      if (get_inode (ent_inum, &ent_node) < 0) {
	fprintf (stderr, "%s: error getting inode\n", ent->name);
	return;
      }
      print_inode (ent_inum, &ent_node, ent->name, ntohl(ent->nameLen), 8);
    }
  }

}

//  *************************************************
//  *********** copy files from host to FS  *********
//  *************************************************

void toy_copy (int argc, char **argv)
{
  int inum;
  int err;
  toy_inode dir;
  char dname[256];
  char *fname;

  // Try to get an inode for the name
  inum = name_to_inode (argv[argc-1]);

  if (inum > 0) { 
    err = get_inode (inum, &dir);
    if (err < 0) {
      fprintf (stderr, "%s: error getting inode\n", argv[argc-1]);
      return;
    }
  } else if (inum == -2 && argc > 2) {
      fprintf (stderr, "%s: must be a directory\n", argv[argc-1]);
      return;
  }

  if (inum > 0) {
    if (!(dir.mode & TYPE_DIR)) { 
      fprintf (stderr, "%s: must be a directory\n", argv[argc-1]);
      return;
    }
    fname = NULL;
  } else {
    // final element is not found, use as file name
    if (argc > 2) {
      fprintf (stderr, "%s: must be a directory\n", argv[argc-1]);
      return;
    }
    // Find the directory name.
    strncpy(dname, argv[argc-1], 255);
    fname = strrchr(dname,'/');
    if (fname == NULL) {
      // No / in path, root is directory
      inum = 1;
      fname = dname;
    } else {
      // Isolate directory name (dname) from final file name
      *fname = 0;
      fname++;
      inum = name_to_inode (dname);
      if (inum < 0) {
	fprintf (stderr, "%s: must be a directory\n", dname);
	return;
      }
    }
    // inum is the directory we need to get.
    err = get_inode (inum, &dir);
    if ( err < 0) {
      fprintf (stderr, "%s: error getting inode\n", dname);
      return;
    }
  }

  if (Debug)
    fprintf (stderr, "Add to directory %s (%d)\n", dname, inum);

  // dir is the directory into which we need to copy the files
  int fd;
  int ix;
  int new_inum;
  toy_inode file_node;
  for (ix = 0; ix < argc-1; ix++) {
    fd = open (argv[ix], O_RDONLY,0);
    if (fd < 0) {
      perror (argv[ix]);
      continue;
    }

    if (Debug)
      fprintf (stderr, "Adding file %s\n", argv[ix]);
    // Create the file in the FS
    new_inum = create_new_inode (TYPE_FILE, &file_node, 
				 MODE_READ|MODE_WRITE | (MODE_EXE * SetX));
    if (new_inum < 0) {
      fprintf (stderr, "%s: error copying file.", argv[ix]);
      continue;
    }
    if (Debug)
      fprintf (stderr, "toy_copy, new inode for %s is %d\n", argv[ix], new_inum);

    // if not set set file name.
    if (fname == NULL) {
      fname = strrchr(argv[ix], '/');
      if (fname == NULL)
	fname = argv[ix];
      else
	fname++;
    }

    if ((err=add_dir_entry (fname, inum, &dir, new_inum, &file_node)) < 0) {
      if (err == -1)
	fprintf (stderr, "%s: directory out of space.\n", argv[ix]);
      free_inode(new_inum);
      continue;
    }
    fname = NULL;  // Reset for next loop

    // Everything is set up to transfer the data
    char sec[SECSIZE] = {0};
    int32 ind_block[SECSIZE/4] = {0};
    int   ind_bkno = 0;
    int  new_sec;
    ssize_t curr;
    int db_ix = 0;

    while ((curr = read (fd, sec, SECSIZE)) > 0) {
      if (db_ix > 2057) {
	fprintf (stderr, 
		 "%s: file too big, 2nd indirect blocks not implemented.\n",
		 argv[ix]);
	break;
      }
      if (db_ix > 9 && file_node.indir1 == 0) {
	// Indirect blocks
	ind_bkno = get_free_sector();
	if (ind_bkno < 1) {
	  // Out of space
	  fprintf (stderr, "%s: out of space in file system.\n", argv[ix]);
	  break;
	}
	file_node.balloc +=1;
	file_node.indir1 = ind_bkno;
      }
      file_node.fsize += (int32)curr;
      new_sec = get_free_sector();
      if (new_sec < 1) {
	// Out of space
        fprintf (stderr, "%s: out of space in file system.\n", argv[ix]);
	break;
      }
      file_node.balloc += 1;
      if (db_ix > 9) {
	// store in indirect block new_sec pointer
	ind_block[db_ix++-10] = htonl(new_sec);
      } else {
	file_node.direct[db_ix++] = new_sec;
      }
      if (put_sector (new_sec+numInodeSectors, sec) < 0) {
	fprintf (stderr, "BUG! put_sector in toy_copy!\n");
	exit(1);
      }
      memset (sec, 0, SECSIZE);
      if (Debug)
	fprintf (stderr, "%s: dir[%d] = %d, (%d bytes)\n",
		 argv[ix], db_ix-1, (int)new_sec, (int)curr);
    }

    // Finish up and close
    close(fd);
    put_inode (new_inum, &file_node);
    if (ind_bkno != 0) {
      if (put_sector (ind_bkno+numInodeSectors, ind_block) < 0) {
	fprintf (stderr, "BUG! put_sectory in toy_copy!\n");
	exit(1);
      }
    }
  }
  // All done
}



//  *************************************************
//  ******* Initialize a new File System  ***********
//  *************************************************

void toy_newfs(int num_inodes, int num_sectors )
{ 
  int ix;	// loop index

  printf ("Creating a new Toy File system named %s:\n"
	  "    %d inodes, %d sectors\n", DiskName, num_inodes, num_sectors);

  // Build one

  // Add the correct stuff to the first of the disk for Blitz
  if (write (diskFd, "BLZd", 4) != 4) {
    fprintf (stderr, "BUG! could not write BLZd on disk\n");
    return;
  }

  toy_rootsec secZero = {"TyFs",0};

  secZero.fssize = htonl (num_sectors);
  secZero.numInodes = htonl (num_inodes);

  // Fill in Globals for utility routines.
  numInodes = num_inodes;
  numInodeSectors = num_inodes / INODEPERSEC;
  numDataSectors = num_sectors - numInodeSectors - 1;
  toyFsSize = num_sectors;

  inodeBitmapSize = num_inodes / 32 + 1;
  dataBitmapSize = numDataSectors / 32 + 1;

  if (inodeBitmapSize + dataBitmapSize + 2 > BITMAPSIZE) {
    fprintf (stderr, "inode and data bitmap too big, use fewer sectors.\n");
    unlink (DiskName);
    close (diskFd);
    exit(1);
  }

  if (Debug)
    fprintf (stderr, "inode bitmap size %d, data bitmap size %d\n",
	     inodeBitmapSize, dataBitmapSize);

  // Set the bitmaps initial value
  secZero.bitmap[0] = htonl(inodeBitmapSize);
  secZero.bitmap[1] = htonl(3);  // Bit zero set and never used
  secZero.bitmap[inodeBitmapSize+1] = htonl(dataBitmapSize);
  secZero.bitmap[inodeBitmapSize+2] = htonl(3);

  if (put_sector(0, &secZero) < 0) {
    fprintf (stderr, "Error creating Toy FS disk root sector, aborting.\n");
    unlink (DiskName);
    close (diskFd);
    exit(1);
  }

  // Data for the remainder

  unsigned char sector[SECSIZE] = {0};
    
  // Write the inodes
  toy_inode *rootInode = (toy_inode *) &sector[0];
  rootInode->nlinks = htons(2);
  rootInode->mode = htons(TYPE_DIR|MODE_READ|MODE_WRITE);
  rootInode->fsize = htonl(26);
  rootInode->balloc = htonl(1);
  rootInode->direct[0] = htonl(1);

  if (put_sector(1,sector) < 0) {
    fprintf (stderr, "Error creating Toy FS disk root inode, aborting.\n");
    unlink (DiskName);
    close (diskFd);
    exit(1);
  }

  memset (sector, 0, SECSIZE);

  for (ix = 1; ix < numInodeSectors; ix++) 
    if (put_sector(ix+1, sector) < 0) {
      fprintf (stderr, "Error creating Toy FS disk inodes, aborting.\n");
      unlink (DiskName);
      close (diskFd);
      exit(1);
    }

  if (init_dir_data (1,1,1) < 0) {
    unlink (DiskName);
    exit(1);
  }

  // Write the remaining Sectors
  memset (sector, 0, SECSIZE);

  for (ix = 1; ix < numDataSectors; ix++) 
    if (put_sector(numInodeSectors + 1 + ix, sector) < 0) {
      fprintf (stderr, "Error creating Toy FS disk data sectors, aborting.\n");
      unlink (DiskName);
      close (diskFd);
      exit(1);
    }
}

void usage (char *prog)
{
  fprintf (stderr,
   "Usage: %s arguments\n"
   "  Specific commands:\n"
   "    -i [-n num_inodes] [-s num sectors]  -- initialize a new file system\n"
   "    -a [-x] host-file fs-file -- add host file to file system\n"
   "    -a [-x] file ... fs-dir -- add several host files to file system\n"
   "    -g fs-file local-file -- get a file from the file system to host\n"
   "    -l [dir ...] -- list the named directory\n"
   "    -m dir -- make a directory\n"
   "    -c mode file_or_dir [...] -- change mode (mode is 0-7)\n"
   "    -p -- print disk statistics\n"
   "  Common options:\n"
   "    -d diskName -- name of the toy FS disk\n"
   "    -D -- turn on debugging\n"
   "    -x -- (add files) adds with execute bit on.\n"
   , prog);
  exit(1);
}

int main (int argc, char **argv)
{

  char *prog = argv[0];

  int numSectors = 10;			// Very small disk!
  int numInodes = INODEPERSEC;		// Minimum number, one sector full
  char operationMode = 'X';
  int  ix;

  // Option processing  
  int ch;
  while ((ch = getopt (argc, argv, "iaglmcxd:n:s:Dp")) != -1) {
    int temp;
    switch (ch) {

    case 'a':  // copy host files to FS
    case 'c':  // change mode bits
    case 'i':  // initialize mode
    case 'l':  // list files
    case 'm':  // make a directory
    case 'g':  // copy (eXtract) FS files to host
    case 'p':  // Print stats
      if ( operationMode != 'X' ) usage (prog);
      operationMode = ch;
      break;

    case 'd':
      DiskName = optarg;
      break;

    case 'n':  
      temp = atoi (optarg);
      if (temp > numInodes)
	numInodes = ((temp+INODEPERSEC-1)/INODEPERSEC)*INODEPERSEC;
      break;

    case 's':
      temp = atoi (optarg);
      if (temp > numSectors)
	numSectors = temp;
      else
	fprintf (stderr, "Ignoring option 's', less than 50.\n");
      break;

    case 'D':
      Debug = 1;
      break;

    case 'x':
      SetX = 1;
      break;

    default:
      usage (prog);
    }
  }

  if (Debug) {
    fprintf (stderr, "Blitz Toy FS -- manipulation program.\n");
    fprintf (stderr, "root sec size is %d\n", (int)sizeof (toy_rootsec));
    fprintf (stderr, "inode size is %d\n", (int)sizeof (toy_inode));
  }

  if (sizeof (toy_rootsec) != SECSIZE ||
      sizeof (toy_inode) != INODESIZE) {
    fprintf (stderr, "Fatal Error: root sector or inode not correct size\n");
    exit(1);
  }

  // Update to leave just the "file lists"
  argc -= optind;
  argv += optind;

  // Open the disk, pass in if this is an init
  openDisk(operationMode == 'i');

  // Select the Job to do
  switch (operationMode) {

  case 'i':  // initialize the file system
    toy_newfs (numInodes, numSectors);
    break;

  case 'a': // add a file to the FS
    if (argc < 2) usage (prog);
    toy_copy (argc, argv);
    break;

  case 'c': // change mode bits
    if (argc < 2) usage (prog);
    int mode = atoi(argv[0]);
    if (mode < 0 || mode > 7) usage (prog);
    for (ix = 1; ix < argc; ix++)
      toy_chmod (mode, argv[ix]);
    break;

  case 'l':  // List a files
    if (argc > 0) 
      for (ix = 0; ix < argc; ix++)
	toy_list (argv[ix]);
    else
      toy_list ("/");
    break;

  case 'm':
    for (ix = 0; ix < argc; ix++)
      toy_mkdir(argv[ix]);
    break;

  case 'g':
    printf ("get file unimplemented.\n");
    break;

  case 'p':
    report_stats();
    break;

  default:
    close(diskFd);
    usage (prog);
  }

  close(diskFd);
  return 0;
}
