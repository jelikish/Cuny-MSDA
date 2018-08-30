#Joseph Elikishvili
#602 - HW4

import bs4
import urllib2
import json
from alchemyapi import AlchemyAPI


url="http://www.bbc.com/news/uk-politics-37504966"
page=urllib2.urlopen(url)
soup=bs4.BeautifulSoup(page.read(), "html.parser")
data=soup.find_all("p")

string = " ".join(str(x.text) for x in data)
#print string
alchemyapi = AlchemyAPI()

response = alchemyapi.keywords("text", string)
#print response

print"------------------------------------------------"
print "Printing without json directly from alchemy generated list"
print"------------------------------------------------"
for item in response["keywords"][:10]:
    print '%-30s'%item["text"], '%10s'%item["relevance"]

print"------------------------------------------------"
print "Printing using json"
print"------------------------------------------------"
for item in response["keywords"][:10]:
    print '%-30s'%json.dumps(item["text"]), '%10s'%json.dumps(item["relevance"])