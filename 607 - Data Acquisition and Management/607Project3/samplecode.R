<<<<<<< Updated upstream
library(RCurl) 
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
library(boilerpipeR)
library(rindeed)
library(httr)
library(sqldf)
library(stringi)


sKills <- read.csv(paste0("C:/data/skills.csv"), header=F)
in_setup(country = "US")

sTerm1 <- in_scrape("Data Scientist", p = 15)
sTerm1$SearchTerm <- "Data Scientist"
sTerm2 <- in_scrape("Data Engineer", p = 15)
sTerm2$SearchTerm <- "Data Engineer"
sTerm3 <- in_scrape("Big Data Engineer", p = 15)
sTerm3$SearchTerm <- "Big Data Engineer"
sTerm4 <- in_scrape("Machine Learning Scientist", p = 15)
sTerm4$SearchTerm <- "Machine Learning Scientist"
sTerm <- rbind(sTerm1, sTerm2, sTerm3, sTerm4)

nData <- sqldf("select * from sTerm where url != 'http://www.indeed.comNA'")
iURL <- nrow(nData)

for (i in 1:nrow(nData)) {
  tryCatch({
  length(iURL) <- 0    
    iURL <- GET(trimws(nData$url[i]))
    content <- getURL(trimws(iURL$url))
    nData$postingID[i] <- i
    nData$URL[i] <- trimws(iURL$url)
    nData$text[i] <- DefaultExtractor(content)
    keyword <- nrow(sKills)
    for (j in 1:nrow(sKills)) {
     kCount <- stri_count_regex(nData$text[i], sKills$V1[j]) + stri_count_regex(nData$summary[i], sKills$V1[j])
      keyword <- paste0(sKills$V1[j],"(", kCount, ")", "," , " ", keyword)
      nData$kWord[i] <- keyword
      kCount <- 0
    }
    length(keyword) <- 0
    } , error=function(e){})
}

nData$url <- NULL
# does not write column Text because of sheer size
#write.csv(nData, file = "output1.csv")

finalData <- data.frame(nData$postingID, nData$SearchTerm, nData$job.title, nData$company, nData$date, nData$location, nData$summary, nData$kWord)

write.csv(finalData, file = "output2.csv")


=======
library(RCurl) 
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
library(boilerpipeR)
library(rindeed)
library(httr)
library(sqldf)
library(stringi)


sKills <- read.csv(paste0("C:/data/skills.csv"), header=F)
in_setup(country = "US")

sTerm1 <- in_scrape("Data Scientist", p = 15)
sTerm1$SearchTerm <- "Data Scientist"
sTerm2 <- in_scrape("Data Engineer", p = 15)
sTerm2$SearchTerm <- "Data Engineer"
sTerm3 <- in_scrape("Big Data Engineer", p = 15)
sTerm3$SearchTerm <- "Big Data Engineer"
sTerm4 <- in_scrape("Machine Learning Scientist", p = 15)
sTerm4$SearchTerm <- "Machine Learning Scientist"
sTerm <- rbind(sTerm1, sTerm2, sTerm3, sTerm4)

nData <- sqldf("select * from sTerm where url != 'http://www.indeed.comNA'")
iURL <- nrow(nData)

for (i in 1:nrow(nData)) {
  tryCatch({
  length(iURL) <- 0    
    iURL <- GET(trimws(nData$url[i]))
    content <- getURL(trimws(iURL$url))
    nData$postingID[i] <- i
    nData$URL[i] <- trimws(iURL$url)
    nData$text[i] <- DefaultExtractor(content)
    keyword <- nrow(sKills)
    for (j in 1:nrow(sKills)) {
     kCount <- stri_count_regex(nData$text[i], sKills$V1[j]) + stri_count_regex(nData$summary[i], sKills$V1[j])
      keyword <- paste0(sKills$V1[j],"(", kCount, ")", "," , " ", keyword)
      nData$kWord[i] <- keyword
      kCount <- 0
    }
    length(keyword) <- 0
    } , error=function(e){})
}

nData$url <- NULL
# does not write column Text because of sheer size
#write.csv(nData, file = "output1.csv")

finalData <- data.frame(nData$postingID, nData$SearchTerm, nData$job.title, nData$company, nData$date, nData$location, nData$summary, nData$kWord)

write.csv(finalData, file = "output2.csv")


>>>>>>> Stashed changes
