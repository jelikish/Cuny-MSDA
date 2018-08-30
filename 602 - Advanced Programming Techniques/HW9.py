#Joseph Elikishvili
# HW9

import pandas as pd
import re
import warnings

#Remove Future warning from the console output.
warnings.simplefilter(action = "ignore", category = FutureWarning)

#open raw file and remove the =" characters which are causing issues.
fin=open('c:/data/epa-http4.txt','r')
fout = open('c:/data/epa-http-out.txt','w')
for line in fin:
    p = re.compile('alt="')
    newline = p.sub('alt ',line)
    fout.write(newline)
fin.close()
fout.close()

#Read the file and store it into a df
df = pd.read_csv('c:/data/epa-http-out.txt', sep='\s+', quoting=1, header = None, names=['host','time','http','status','size'])

#Replace '-' with a 0 for size column.
df['size'] = df['size'].replace('-', value='0', regex=True)

#Find most requested host
most_requests = df['host'].value_counts()[[0]]

print "1. Which hostname or IP address made the most requests?"
print most_requests.ix[0:1].to_string()
print "------------------------------------------"


#convert size column to int so that we can add them up
df['size'] = df['size'].astype(int)

#group by host and get the sum of request size
host_request_size_df = df.groupby(by=['host'])['size'].sum()

#sort the dataframe
host_request_size_df.sort_values(inplace=True)

#view last entry of dataframe
print "2. Which hostname or IP address received the most total bytes from the server?  How many bytes did it receive?"
print host_request_size_df[-1:].to_string(header=False)
print "------------------------------------------"

#df['time'].str.match("\[\d\d:00.*\]").sum()

#cleaning up the column
df['time'] = df['time'].replace('\[', value='', regex=True)
df['time'] = df['time'].replace('\]', value='', regex=True)

#group by hour, count items and then sort.
grouped_by_hour = df['time'].groupby(df['time'].str.extract('\d\d:(\d\d):\d+')).count().sort_values()

print "3. During what hour was the server the busiest in terms of requests?"
print grouped_by_hour.tail(1).to_string(header=False)
print "------------------------------------------"


#Find most requested gif
print "4. Which .gif image was downloaded the most during the day?"
print df['http'].str.extract(".*/(.*gif).*").value_counts()[[0]].to_string(header=False)
print "------------------------------------------"

#Find status codes other then 200
status = df[df['status'] != 200]
group=status.groupby(by=['status'])


print "5. What HTTP reply codes were sent other than 200?"
print group.count()




