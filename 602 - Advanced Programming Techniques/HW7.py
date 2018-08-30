#Joseph Elikishvili
#602 - HW7 updated from HW5
import timeit


setup = '''
import csv
file = open(r'C:\Users\joseph\Documents\Cuny\\602\\brainandbody.csv', 'r')
l = csv.reader(file)

next(l)             #remove the header
data = list(l)

n = len(data)
xlist = [float(i[2]) for i in data]
ylist = [float(i[1]) for i in data]

def directformula(list1,list2):
    xsum = sum(list1)
    ysum = sum(list2)
    xysum = sum([float(i[1])*float(i[2]) for i in data])
    x2sum = sum([float(i[2])*float(i[2]) for i in data])
    xsum2 = xsum*xsum

    m = (xysum-(xsum*ysum)/n)/(x2sum-xsum2/n)
    b = (ysum - m*xsum)/n
    print "Printing from Least Squares Function: ", "bo = %.3f*br %.3f" %(m,b)

# Adding HW7 content below

import numpy
from scipy.optimize import curve_fit

def func(a, m, b):
    return a*m+b

def scipycalc(list1,list2):
    popt, pcov = curve_fit(func, list1, list2)
    print "Printing from scipy curve_fit function: ","bo = %.3f*br %.3f" %(popt[0],popt[1])

'''
# using x1000 to make time more readable
t = timeit.Timer("directformula(xlist,ylist)", setup=setup)
print t.timeit(1)*1000, "time x1000 Using Least Squares","\n"

t = timeit.Timer("scipycalc(xlist,ylist)", setup=setup)
print t.timeit(1)*1000, "time x1000 Using scipy curve_fit"

