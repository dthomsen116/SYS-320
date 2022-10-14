import os, argparse
import homework3
import importlib
importlib.reload(homework3)

#defining the parser
parser = argparse.ArgumentParser()

#adding arguments 
parser.add_argument("-d","--dir", required="True", help ="Directory that you are trying to traverse.")
parser.add_argument("-s","--search", required="True", help ="Name of yaml doc containing search")

#parse args
args = parser.parse_args()

rootdir = args.directory

service = args.service


#Stolen from my Week 4 Classwork
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
