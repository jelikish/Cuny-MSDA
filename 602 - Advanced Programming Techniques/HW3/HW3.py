#Joseph Elikishvili
#602 - HW3

import re

file = open(r'C:\Users\joseph\Documents\Cuny\602\HW3\cars.data.csv', 'r')
rawlist = file.readlines()
list=[]
for line in rawlist:
    line = line.strip()
    x = line.split(',')
    list.append(x)

# 2a
def top10safety(L):
    tmp = L
    try:
        for line in tmp:
            if line[5] == "high":
                line.append(3)
            elif line[5] == "med":
                line.append(2)
            elif line[5] == "low":
                line.append(1)

        tmp = sorted(tmp, key=lambda safety: safety[7], reverse=True)
    except IndexError:
        print "\nEncountered Incorrectly formated data, skipping line"
        pass
    print "\nTop 10 lines sorted by descending safety"
    for line in tmp[:10]:
        print line[0:7]

#2b
def bottom15maint(L):
    tmp = L
    try:
        for line in tmp:
            if line[1] == "vhigh":
                line.append(4)
            elif line[1] == "high":
                line.append(3)
            elif line[1] == "med":
                line.append(2)
            elif line[1] == "low":
                line.append(1)

        tmp = sorted(tmp, key=lambda safety: safety[7])
    except IndexError:
        print "\nEncountered Incorrectly formated data, skipping line"
        pass

    print "\nBottom 15 lines sorted by ascending maint"
    for line in tmp[:15]:
        print line[0:7]

#2c
def customre():
    f = open(r'C:\Users\joseph\Documents\Cuny\602\HW3\cars.data.csv', 'r')
    regex = re.compile(r"v?high,v?high,\d(more)?,(more|\d),\w\w\w\w?\w?,high,\w\w\w\w?\w?")
    regexlist = []
    regexlist1 = []

    print "\nREGEX 2c"
    for line in f:
        if re.match(regex, line):
            regexlist.append(line)

    for line in regexlist:
        x = line.split(',')
        regexlist1.append(x)

    regexlist1 = sorted(regexlist1, key=lambda doors: doors[2])
    for line in regexlist1:
        print line[0]+"\t",line[1]+"\t",line[2]+"\t",line[3]+"\t",line[4]+"\t",line[5]+"\t",line[6],
    f.close()

#2d
def savetofile():
    f = open(r'C:\Users\joseph\Documents\Cuny\602\HW3\cars.data.csv', 'r')
    savefile = open(r'C:\Users\joseph\Documents\Cuny\602\HW3\output.txt', 'w')
    regex = re.compile(r"^vhigh,med,4,(4|more),.*")
    print "\nREGEX 2d - Saving to a file..."
    for line in f:
        if re.match(regex, line):
            print >> savefile, line,
    f.close()
    savefile.close()



top10safety(list)
bottom15maint(list)
customre()
savetofile()

