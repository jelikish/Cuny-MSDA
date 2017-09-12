# 608 HW1

#setwd("/Users/joseph/Documents/GitHub/Cuny/Fall2017/608")
#data = read.csv("lecture1/Data/inc5000_data.csv", header = TRUE)

data = read.csv("https://github.com/jelikish/Cuny1/raw/master/Fall2017/608/lecture1/Data/inc5000_data.csv", header = TRUE)

library(ggplot2)
library(plyr)
#head(data)

#1.

#Order by State
data <- within(data, State <- factor(State, levels=names(sort(table(State), decreasing=FALSE))))

#setup ggplot
p1 = ggplot(data, aes(x = State)) + geom_bar() + coord_flip() + geom_text(stat='count',aes(label=..count..), vjust=1, color="red", size=3.0)


#Remove background ink grid and save some ink.
p1 = p1+ theme_bw() + theme(
  plot.background = element_blank()
  ,panel.grid.major = element_blank()
  ,panel.grid.minor = element_blank()
  ,panel.border = element_blank()
) 

p1 = p1 + xlab("") + ylab("Distribution of companies by state")
p1


#2.

#Take a subset
state = subset(data, State=='NY')

state <- state[complete.cases(state)==TRUE,]



#Finding outliers
summary(state$Employees)

#Filtering out 1st and 4rth quartiles.
state = subset(state, Employees>21)
state = subset(state, Employees<105.5)



p2 = ggplot(state, aes(x = reorder(Industry, Employees, FUN=median), y = Employees)) + geom_boxplot() + coord_flip()

p2 = p2+theme_bw() + theme(
  plot.background = element_blank()
  ,panel.grid.major = element_blank()
  ,panel.grid.minor = element_blank()
  ,panel.border = element_blank()
) 

p2 = p2 + xlab("") + ylab("Median number employees per Industry")
p2



#3.
data <- data[complete.cases(data)==TRUE,]
data$Rev_emp = round((data$Revenue/data$Employees)/1000)

Investor = data %>% group_by(Industry) %>% summarise(Industry_Total = sum(Rev_emp))

p3 = ggplot(Investor, aes(x = reorder(Industry, Industry_Total), y = Industry_Total)) + geom_bar(stat='identity') + coord_flip()

p3 = p3 + theme_bw() + theme(
  plot.background = element_blank()
  ,panel.grid.major = element_blank()
  ,panel.grid.minor = element_blank()
  ,panel.border = element_blank()
) 

p3 = p3 + xlab("") + ylab("Revenue per employee in $1000s by Industry")
p3
