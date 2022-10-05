import os, yaml, re, argparse



#Directory Traversal
def traversal(dir):
    if not os.path.isdir(dir):
    
        print("invalid directory => \n {}").format(dir)
        exit()
    
    #list to save files
    fList = []
    
    
    #crawl through dirs
    for root, subfolders, filenames in os.walk(dir):
    
        for f in filenames:
        
            #print(root + "\\" + f)
            fileList = root + "\\" + f
            #print(fileList)
            fList.append(fileList)
        
    return(fList)

def parseyaml(fyaml):
    #Open the YAML file
    try:

        with open('searchterms.yaml', 'r') as yf:
            keywords = yaml.safe_load(yf)
    except EnvironmentError as e:
        print(e.strerror)
        
def log_scan(filename, searchterms, term):
    
    yamlterms = searchterms[term]
    
    with open(filename) as f:
        contents = f.readlines()
        
    results = []

    # Loop through the list returned. Each element is a line form the smallSyslog file
    for line in contents:
        #loops through the keywords
        for threat in yamlterms:
        
            # if the line contains keyword then it will print 
            # if eachKeyword in line:
            
            # Searches and returns results using a regular expression
            x = re.findall(r''+yamlterms[threat]+'', line)
            
            for found in x:
                
                # append the returned keywords to results list
                results.append(line.strip("\n") + "," + str(threat) )
                
    results = sorted(results)

    return results

def formatresults(string, scan):
    splitString = string.split(",")
    print("""
    Hostname: {}\n
    Program: {}\n
    Path: {}\n
    User: {}\n
    PID: {}\n
    Args: {}\n
    Details:
    {}\n
    {}
    """.format(splitString[2], splitString[3], splitString[4], splitString[6], splitString[5], splitString[1], moreinfo(scan), "*"*60).strip("\n"))

def moreinfo(string):
    powershell = '''
    Adversaries may abuse PowerShell commands and scripts for execution. 
    PowerShell is a powerful interactive command-line interface and scripting environment included in the Windows operating system.
    Adversaries can use PowerShell to perform a number of actions, including discovery of information and execution of code.
    \n
    \n
    To read more about this: https://attack.mitre.org/techniques/T1059/001/
    '''
    
    credentialcollection = '''
    Adversaries may search the Registry on compromised systems for insecurely stored credentials. 
    The Windows Registry stores configuration information that can be used by the system or other programs.
    Adversaries may query the Registry looking for credentials and passwords that have been stored for use by other programs or services.
    \n
    \n
    To read more about this: https://attack.mitre.org/techniques/T1552/002/
    '''
    
    script = '''
    Adversaries may abuse command and script interpreters to execute commands, scripts, or binaries. 
    These interfaces and languages provide ways of interacting with computer systems and are a common feature across many different platforms. 
    Most systems come with some built-in command-line interface and scripting capabilities
    \n
    \n
    To read more about this: https://attack.mitre.org/techniques/T1059/
    '''
    
    if string == "powershell":
        return powershell
    elif string == "script":
        return script
    elif string == "credentialcollection":
        return credentialcollection    
    
    
