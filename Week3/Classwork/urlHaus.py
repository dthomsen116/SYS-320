#Added "import re" as the module was missing
import re
import csv

#changed the 1 to an l in "ur1HausOpen" and added an s to searchTerm[s]
def urlHausOpen(filename,searchTerms):

#Changed while to with 
#removed filename quotes
#changed the == to = to define the variable "contents"\
#indented all the lines to make them line up properly
#changed csv.review to csv. reader


    with open(filename) as f:
        contents = csv.reader(f.readlines())
    for _ in range(9):
        next(contents)
    for eachLine in contents: 
        #for keyword in searchTerms:
        x = re.findall(r"" + searchTerms + "", eachLine[2])
                # Changed  x = re.findall(r+keyword+,eachLine[2]) to x = re.findall(r"\."+keyword+r"\.", eachLine[2])
        for _ in x:


# Don't edit this line. It is here to show how it is possible
# to remove the "tt" so programs don't convert the malicious
# domains to links that an be accidentally clicked on.
                    the_url = eachLine[2].replace("http","hxxp")
                    the_src = eachLine[4]
                    print("""
                    URL:{}
                    Info: {}
                    {}""".format(the_url, the_src,"=" * 60))