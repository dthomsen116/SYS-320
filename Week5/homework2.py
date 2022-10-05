import re, sys, yaml, csv

#need to open the file
def logs_check(filename,service, terms, yaml):
    #(Stolen from my Week 2 Classwork)
    with open('searchterms.yaml', 'r') as yf:
        keywords = yaml.safe_load(yf)
    
    terms = keywords [service][terms]
    listofkeywords = terms.split('|')


    #Opens the files, and stores results, then sorts through the results.
    with open(filename, "r") as f: 
        contents = f.readlines()
    results = []
    
    for line in contents:
        for eachkeyword in listofkeywords:
        
            x = re.findall(r''+eachkeyword+'', line)
            
        for found in x:
            
            results.append(found)
                
        # Checks results
        if len(results) == 0:
            pass

        # Sorts list
        results = sorted(results)
     
        return results  