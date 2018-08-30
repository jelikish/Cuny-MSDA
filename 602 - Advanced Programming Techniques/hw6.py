#Joseph Elikishvili  HW6 ( Updated HW1 adding numpy functionality )
import timeit

setup = '''
import numpy
import copy
L = [5,3,6,3,13,5,6]

#1. fill in this function
#   it takes a list for input and return a sorted version
#   do this with a loop, don't use the built in list functions
def sortwithloops(x):
    less = []
    plist = []
    more = []
    if len(x) <= 1:
        return x
    else:
        p = x[0]
        for i in x:
            if i < p:
                less.append(i)
            elif i > p:
                more.append(i)
            else:
                plist.append(i)
        return sortwithloops(less) + plist + sortwithloops(more)
	
#2. fill in this function
#   it takes a list for input and return a sorted version
#   do this with the built in list functions, don't us a loop
def sortwithoutloops(x):
    return sorted(x)

#3. fill in this function
#   it takes a list for input and a value to search for
#	it returns true if the value is in the list, otherwise false
#   do this with a loop, don't use the built in list functions
def searchwithloops(x, i):
    cnt = 0
    while cnt < len(x):
        if x[cnt] == i:
            return True
        else:
            cnt = cnt+1
        if cnt == len(x):
            return False

    return #return a value

#4. fill in this function
#   it takes a list for input and a value to search for
#	it returns true if the value is in the list, otherwise false
#   do this with the built in list functions, don't use a loop
def searchwithoutloops(x, i):
    return i in x

def sortnumpy(x):
    return numpy.sort(x)

def searchnumpy(x, i):
    arr = numpy.array(x)
    test = numpy.where(arr == i)
    if len(test[0])>0:
        return True
    else:
        return "False"
'''


if __name__ == "__main__":

    L = [5,3,6,3,13,5,6]
    n = 10000
    t = timeit.Timer("x=copy.copy(L); sortwithloops(x)", setup=setup)
    print "Sort using iteration: 10000 Loops, ", t.timeit(n), "seconds"

    t = timeit.Timer("x=copy.copy(L); sortwithoutloops(x)", setup=setup)
    print "Sort using builtin:   10000 Loops, ", t.timeit(n), "seconds"

    t = timeit.Timer("x=copy.copy(L); sortnumpy(x)", setup=setup)
    print "Sort using numpy:     10000 Loops, ", t.timeit(n), "seconds", '\n'

    t = timeit.Timer("x=copy.copy(L); searchwithloops(x, 5)", setup=setup)
    print "Search 5  using iteration: 10000 Loops, ", t.timeit(n), "seconds"

    t = timeit.Timer("x=copy.copy(L); searchwithoutloops(x, 5)", setup=setup)
    print "Search 5  using builtin:   10000 Loops, ", t.timeit(n), "seconds"

    t = timeit.Timer("x=copy.copy(L); searchnumpy(x, 5)", setup=setup)
    print "Search 5  using numpy:     10000 Loops, ", t.timeit(n), "seconds", '\n'

    t = timeit.Timer("x=copy.copy(L); searchwithloops(x, 5)", setup=setup)
    print "Search 11 using iteration: 10000 Loops, ", t.timeit(n), "seconds"

    t = timeit.Timer("x=copy.copy(L); searchwithoutloops(x, 5)", setup=setup)
    print "Search 11 using builtin:   10000 Loops, ", t.timeit(n), "seconds"

    t = timeit.Timer("x=copy.copy(L); searchnumpy(x, 5)", setup=setup)
    print "Search 11 using numpy:     10000 Loops, ", t.timeit(n), "seconds"


