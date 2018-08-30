#1. Calculate 12!
x=1
i=1
while (i<13)
{
  x=x*i
  i=i+1
}
print(x)

#------------------------------------
#2. vector that contains the sequence from 20 to 50 by 5

a = seq(20,50,5)
print(a)

#------------------------------------
#3. Quadratic Function

q = function(a,b,c)
{
  if (b^2-4*a*c>=0)
  {
    r1=(-b+sqrt(b^2-4*a*c))/(2*a)
    r2=(-b-sqrt(b^2-4*a*c))/(2*a)
    result=c(r1,r2)
    return(result)
  } else
  {
    print("imaginary numbers")
  }
}


#testing roots with positive delta
roots=q(1,-8,1)
print(roots)
#testing roots with negative delta
iroots=q(1,1,1)
print(iroots)

