
rawdata <- read.table("agaricus-lepiota.data", header=FALSE, sep=",")
subdata <- subset(rawdata, select =c(V1,V9,V11,V17,V18))

edible = function(x)
{
  if (x == 'e')
    return("Edible")
  if (x=='p')
    return("Poisonos")
}

gillsize = function(x)
{
  if (x=='b')
    return('Broad')
  if (x=='n')
    return('Narrow')
}

starkshape = function(x)
{
  if (x=='e')
    return('Enlargin')
  if (x=='t')
    return('Tapering')
}

veiltype = function(x)
{
  if (x=='p')
    return('Partial')
  if (x=='u')
    return('Universal')
}

veilcolor = function(x)
{
  if (x=='n')
    return('Brown')
  if (x=='o')
    return('Orange')
  if (x=='w')
    return('White')
  if (x=='y')
    return('Yellow')
}


col1 = unlist(lapply(subdata[,1], edible))
col2 = unlist(lapply(subdata[,2], gillsize))
col3 = unlist(lapply(subdata[,3], starkshape))
col4 = unlist(lapply(subdata[,4], veiltype))
col5 = unlist(lapply(subdata[,5], veilcolor))

finaldata = cbind(col1, col2, col3, col4, col5)
colnames(finaldata) <-c("Edible/Poisonous", "Gill Size", "Stalk Shape", "Veil Type", "Veil Color")