<<<<<<< Updated upstream
library(boilerpipeR)
library(RCurl)
library(stringr)
library(stringi)

#read the file with links
list = read.csv("c:/data/links.csv", stringsAsFactors = FALSE)



#parsing each link and saving job text into description column
for (i in 1:nrow(list))
{
  content <- getURL(list$Link[i])
  extract <- DefaultExtractor(content)
  list$description[i] = extract
}

#gettong rid of entries with an empty description
list = subset(list, list$description != "")



#extracting job title, city, state from url and adding them as columns

for (i in 1:nrow(list))
{
  r_extract=str_match(list$Link[i], "http://jobview.monster.com/(.*)-job-(.*)-(\\w\\w)-us.*")
  list$Job_Title[i] = r_extract[2]
  list$City[i] = r_extract[3]
  list$State[i] = r_extract[4]
}




# read in keywords to search
skills = read.csv("c:/data/skills.csv", stringsAsFactors = FALSE,  header=F)

#Search the keywords through the data set

total = 0
for (i in 1:nrow(skills))
{
  for (j in 1:nrow(list))
  {
    ctr = stri_count_regex(list$description[j], skills$V1[i])
    total = total+ctr
  }
  skills$count[i] = total
  total = 0
}

#File dump, run as needed
#write.csv(list, file = "monster.csv")
#write.csv(skills, file = "monster_results.csv")

=======
library(boilerpipeR)
library(RCurl)
library(stringr)
library(stringi)

#read the file with links
list = read.csv("c:/data/links.csv", stringsAsFactors = FALSE)



#parsing each link and saving job text into description column
for (i in 1:nrow(list))
{
  content <- getURL(list$Link[i])
  extract <- DefaultExtractor(content)
  list$description[i] = extract
}

#gettong rid of entries with an empty description
list = subset(list, list$description != "")



#extracting job title, city, state from url and adding them as columns

for (i in 1:nrow(list))
{
  r_extract=str_match(list$Link[i], "http://jobview.monster.com/(.*)-job-(.*)-(\\w\\w)-us.*")
  list$Job_Title[i] = r_extract[2]
  list$City[i] = r_extract[3]
  list$State[i] = r_extract[4]
}




# read in keywords to search
skills = read.csv("c:/data/skills.csv", stringsAsFactors = FALSE,  header=F)

#Search the keywords through the data set

total = 0
for (i in 1:nrow(skills))
{
  for (j in 1:nrow(list))
  {
    ctr = stri_count_regex(list$description[j], skills$V1[i])
    total = total+ctr
  }
  skills$count[i] = total
  total = 0
}

#File dump, run as needed
#write.csv(list, file = "monster.csv")
#write.csv(skills, file = "monster_results.csv")

>>>>>>> Stashed changes
