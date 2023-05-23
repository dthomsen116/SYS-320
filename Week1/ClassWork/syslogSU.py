import syslogCheck
import importlib
importlib.reload(syslogCheck)

#SSH auth failures
def su_open(filename, searchTerms):
    #call syslogcheck and return results
    is_found = syslogCheck._syslog(filename,searchTerms)
    
    # found list
    found = []
    
    # loop through results
    for eachFound in is_found:
        
        #split results
        sp_results = eachFound.split(" ")
        
        # append the split value to the found list
        found.append(sp_results[5])
        
    #print(set(found))
    #remove dupes using set() and changes the list to a dict. 
    returnedValues = set(found)
    
    for eachValue in returnedValues:
        print(eachValue)