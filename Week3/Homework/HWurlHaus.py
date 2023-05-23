#Added "import re" as the module was missing
import re
import csv


#changed the 1 to an l in "ur1HausOpen" and added an s to searchTerm[s]
def urlHausOpen(filename,searchTerms):

#Changed while to with 
#removed filename quotes
#changed the == to = to define the variable "contents"\
#indented all the lines to make them line up properly
#Changed csv.review to csv. reader
#Changed  x = re.findall(r+keyword+,eachLine[2]) to x = re.findall(r"\."+keyword+r"\.", eachLine[2])


    with open(filename) as f:
    #opens the file
        contents = csv.reader(f.readlines())
    #changed f to f.readlines
    
    for _ in range(9):
        next(contents)
    #skip the first 9 lines (the header)
    
    for eachLine in contents: 
        for keyword in searchTerms:
    
            x = re.findall(r"" + keyword + "", eachLine[2])
    
    #this loop looks through all the lines and uses the search terms to find whatever the user is looking for            
        for _ in x:
            the_url = eachLine[2].replace("http","hxxp")
            the_src = eachLine[7]
            print("""
            URL:{}
            Info: {}
            {}""".format(the_url, the_src,"~-" * 60))
    #This loop makes sure the printing part of the function prints and shows the info properly on the console. 

# Don't edit this line. It is here to show how it is possible
# to remove the "tt" so programs don't convert the malicious
# domains to links that an be accidentally clicked on.
