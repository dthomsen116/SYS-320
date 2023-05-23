import os, sys

#file to traverse given directory/sub-directories and retrieve files.

#get info from command line
    #print(sys.argv)

#directory to traverse
rootdir = sys.argv[1]

    #print(rootdir)

#traverse a directory
if not os.path.isdir(rootdir):
    
    print("invalid directory => \n {}").format(rootdir)
    exit()
    
#list to save files
fList = []
    
    
#crawl through dirs
for root, subfolders, filenames in os.walk(rootdir):
    
    for f in filenames:
        
        #print(root + "\\" + f)
        fileList = root + "\\" + f
        #print(fileList)
        fList.append(fileList)
        
print(fList)

def statFile(toStat):
    
    #i is the var used for each metadata element
    i = os.stat(toStat, follow_symlinks=False)
    
    #mode
    mode = i[0]
    #inode
    inode=i[1]
    #uid
    uid = i[4]
    #gid
    gid = i[5]    
    #file size
    fsize = i[6]
    #access time
    atime = i[7]    
    #mod time
    modtime = i[8]
    #creation time
    ctime = i[9]
    crtime = i[9]
    
    print("0|{}|{}|{}|{}|{}|{}|{}|{}|{}".format(toStat, mode, inode, uid, gid, fsize, atime, modtime, ctime, crtime))     
    
        
for eachFile in fList:
    
    statFile(eachFile)

    
 