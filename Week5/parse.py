import os, argparse
import homework2
import importlib
importlib.reload(homework2)

#defining the parser
parser = argparse.ArgumentParser( 
    description="Traverses a directory and builds a forensic body file",
    epilog="Developed by me, 20200210")

#adding arguments 
parser.add_argument("-d","--dir", required="True", help ="Directory that you are trying to traverse.")
parser.add_argument("-s","--service", required="True", help ="Service that you are trying to use")

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
