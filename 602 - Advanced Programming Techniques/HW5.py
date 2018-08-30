#Joseph Elikishvili
#602 - HW5
import csv

file = open(r'C:\Users\joseph\Documents\Cuny\602\brainandbody.csv', 'r')
l = csv.reader(file)

next(l)             #remove the header
data = list(l)

n = len(data)
xlist = [float(i[2]) for i in data]
ylist = [float(i[1]) for i in data]

xsum = sum(xlist)
ysum = sum(ylist)
xysum = sum([float(i[1])*float(i[2]) for i in data])
x2sum = sum([float(i[2])*float(i[2]) for i in data])
xsum2 = xsum*xsum
#print xsum, ysum, xysum, x2sum, xsum2


m = (xysum-(xsum*ysum)/n)/(x2sum-xsum2/n)
b = (ysum - m*xsum)/n
#m = round(m,3)
#b = round(b,3)

print "bo = %.3f*br %.3f" %(m,b)

# Adding HW7 content below




