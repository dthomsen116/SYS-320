# Create an interface to search through syslog files
import re
import sys

def _syslog(filename,listOfKeywords):
    # Open a file
    with open(filename) as f:
        
        # read in the file and save it to a variable
        contents = f.readlines()
    
    # keywords = ['sshd\(pam_unix\)\[[0-9]{3,8}\]: authentication failure;', 'session opened for user.*', 'exited abnormally']
    
    # lists to store results
    results = []
    
    # Loop through the list returned. Each element is a line form the smallSyslog file
    for line in contents:
        
        #loops through the keywords
        for eachKeyword in listOfKeywords:
        
            # if the line contains keyword then it will print 
            # if eachKeyword in line:
            
            # Searches and returns results using a regular expression
            x = re.findall(r''+eachKeyword+'', line)
            
            for found in x:
                
                # append the returned keywords to results list
                results.append(found)
                
    # check to see if there are results
    if len(results) == 0:
        print("no results")
        sys.exit(1)
    
    # sort the list    
    results = sorted(results)

    return results
    # print(x)