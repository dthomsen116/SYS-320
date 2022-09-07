import syslogCheck
import importlib
importlib.reload(syslogCheck)

#SSH auth failures
def apache_events(filename, service, term):
    #call syslogcheck and return results
    is_found = syslogCheck._syslog(filename, service, term)
    
    # found list
    found = []
    
    # loop through results
    for eachFound in is_found:
        
        #split results
        sp_results = eachFound.split(" ")
        
        # append the split value to the found list
        #GET /cgi-bin/test-cgi HTTP/1.1" 404 435 "-" "-"
        found.append(sp_results[3] + " " + sp_results[0] + " " + sp_results[1])
        
    #print(set(found))
    #remove dupes using set() and changes the list to a dict. 
    
    
    getValues = set(found)
    
    for eachValue in getValues:
        print(eachValue)