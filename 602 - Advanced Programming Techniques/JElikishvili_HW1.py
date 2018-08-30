#Joseph Elikishvili  HW1
# Data 602  9/1/2016

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

if __name__ == "__main__":	
    L = [5,3,6,3,13,5,6]

    print sortwithloops(L) # [3, 3, 5, 5, 6, 6, 13]
    print sortwithoutloops(L) # [3, 3, 5, 5, 6, 6, 13]
    print searchwithloops(L, 5) #true
    print searchwithloops(L, 11) #false
    print searchwithoutloops(L, 5) #true
    print searchwithoutloops(L, 11) #false
