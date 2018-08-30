#Create a local data file combining all boros
#BK = read.csv("C:/data/608/BORO_zip_files_csv/BK.csv", header = TRUE)
#BX = read.csv("C:/data/608/BORO_zip_files_csv/BX.csv", header = TRUE)
#MN = read.csv("C:/data/608/BORO_zip_files_csv/MN.csv", header = TRUE)
#QN = read.csv("C:/data/608/BORO_zip_files_csv/QN.csv", header = TRUE)
#SI = read.csv("C:/data/608/BORO_zip_files_csv/SI.csv", header = TRUE)

#merge
#data = rbind(BK,BX,MN,QN,SI)

#Lets see if this worked.
#nrow(BK)+nrow(BX)+nrow(MN)+nrow(QN)+nrow(SI) == nrow(data)

#save into a file.
#write.csv(data, file = "boro_complete.csv")

data = read.csv("C:/data/608/BORO_zip_files_csv/boro_complete.csv", header = TRUE)

library(bigvis)
library(ggplot2)
library(dplyr)
library(ggthemes)


#1. 
data1 <- data %>% filter(YearBuilt > 1850, NumFloors != 0) %>% select(YearBuilt)

yr <- with(data1, condense(bin(YearBuilt, 1)))
ggplot(yr) + geom_line(aes(x=YearBuilt, y=.count)) + geom_point(aes(x=YearBuilt, y=.count)) + theme_tufte() + ylab("") + xlab("Average Number of buildings built per year")

yr5 <- with(data1, condense(bin(YearBuilt, 5)))
ggplot(yr5) + geom_line(aes(x=YearBuilt, y=.count)) + geom_point(aes(x=YearBuilt, y=.count)) + theme_tufte() + ylab("") + xlab("Average Number of buildings built per every 5 years")

yr10 <- with(data1, condense(bin(YearBuilt, 10)))
ggplot(yr10) + geom_line(aes(x=YearBuilt, y=.count)) + geom_point(aes(x=YearBuilt, y=.count)) + ylab("") + xlab("Average Number of buildings built per every 10 years") + theme_tufte()


#2.
data2 <- data %>% filter(YearBuilt > 1850, NumFloors != 0) %>% select(YearBuilt, NumFloors)


q2 = with(data2, condense(bin(YearBuilt, 1), bin(NumFloors, 1) ) )

ggplot(q2, aes(YearBuilt, NumFloors, fill=.count )) + 
  geom_raster() + theme_tufte() + scale_color_gradient(trans = "log") + ylab("") + xlab("Buildings built with specific number of floors per year ")


#3.


data3 <- data %>% filter(YearBuilt > 1850, NumFloors != 0) %>% select(YearBuilt, AssessTot, NumFloors, AssessLand)

data3$PerFloor = (data3$AssessTot-data3$AssessLand)/data3$NumFloors

q3 = with(data3, condense(bin(YearBuilt, 1), z=PerFloor ) )


ggplot(q3) + geom_line(aes(x=YearBuilt, y=.mean/1000)) +
  geom_point(aes(x=YearBuilt, y=.mean/1000, color = .count)) + xlim(1900,2000) + theme_tufte() 


q3_1 = with(data3, condense(bin(YearBuilt, 5), z=PerFloor ) )

ggplot(q3_1) + geom_line(aes(x=YearBuilt, y=.mean/1000)) + 
  geom_point(aes(x=YearBuilt, y=.mean/1000)) +xlim(1900,2017) + theme_tufte() + ylab("Mean $ in 1000s") + xlab("Assessment per floor on average per 5 years")
