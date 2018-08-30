#1
A=matrix(c(1,2,3,-1,0,4), nrow=2,byrow=T)
X=A%*%t(A)
Y=t(A)%*%A
eX=eigen(X)
eY=eigen(Y)
svdX=svd(X)
svdY=svd(Y)

#Easy to compare and see
#2
myinverse<-function(A,x){
cofacmat=matrix(ncol=x,nrow=x)
for (i in 1:nrow(A)) { #loop over rows
    for (j in 1:ncol(A)){ #and columns
      newmat=as.matrix(A[-i,-j])
      cofacmat[i,j]=((-1)^(i+j))*det(newmat) #cofactors
    }}
ans=t(cofacmat)/det(A)
}
A=matrix(c(1,2,3,2,1,3,1,1,3),nrow=3)
myinv=myinverse(A,nrow(A))
myinv
