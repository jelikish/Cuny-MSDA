library(stringr)
library(dplyr)
library(dbConnect)

username = 'data607'
password = 'project3'
dbname = 'ds_skills'
host = 'data607-project3.ce2dfe0qxt5q.us-west-2.rds.amazonaws.com'
myDb = dbConnect(MySQL(), user=username, password=password, dbname=dbname, host=host)

my_data <- read.csv("https://raw.githubusercontent.com/dhnanjay/607Project3/master/data2.csv", 
                    stringsAsFactors = FALSE)

# roles df
role_desc <- unique(str_replace(my_data$Job_Title, "\\'", ""))  # BH: removed apostrophes for SQL import
role_id <- seq.int(length(role_desc))
roles <- data.frame(role_id=role_id,role_desc=role_desc)
roles = roles %>% mutate(insertValue = paste0("(", role_id, ", '", role_desc, "')"))
insertValues = paste(unlist(roles$insertValue), collapse = ', ')
insertQry = dbSendQuery(myDb, paste0("INSERT INTO roles VALUES ", insertValues, ";"))
fetch(insertQry, n = -1)

# location df
locations <- unique(my_data[,c("City","State")])
locations <- cbind(loc_id =  seq.int(nrow(locations)), locations)
locations = locations %>% mutate(insertValue = paste0("(", loc_id, ", '", City, "', '", State, "')"))
insertValues = paste(unlist(locations$insertValue), collapse = ', ')
insertQry = dbSendQuery(myDb, paste0("INSERT INTO locations VALUES ", insertValues, ";"))
fetch(insertQry, n = -1)

# keywords df
key_list <- unlist(str_split(tolower(my_data$keywordtag),","))
key_desc <- unique(key_list[key_list!=""])
key_id <- seq.int(length(key_desc))
keywords <- data.frame(key_id = key_id, key_desc = key_desc)
keywords = keywords %>% mutate(insertValue = paste0("(", key_id, ", '", key_desc, "')"))
insertValues = paste(unlist(keywords$insertValue), collapse = ', ')
insertQry = dbSendQuery(myDb, paste0("INSERT INTO keywords VALUES ", insertValues, ";"))
fetch(insertQry, n = -1)

# post_keys df
key_list <- str_split(tolower(my_data$keywordtag),",")
key_list <- lapply(key_list,unique)
post_id = integer(); key_desc = character()
for (i in 1:length(key_list)){
  for (j in 1:length(key_list[[i]])) {
    post_id <- append(post_id,i)
    key_desc <- append(key_desc,key_list[[i]][[j]])
  }
}
post_keys <- data.frame(post_id = post_id,key_desc = key_desc)
post_keys <- filter(post_keys, key_desc != "" & key_desc !=" ")
post_keys <- merge(keywords, post_keys, by = "key_desc")
post_keys <- subset(post_keys, select = c(post_id, key_id))
post_keys = post_keys %>% mutate(insertValue = paste0("(", post_id, ", '", key_id, "')"))
insertValues = paste(unlist(post_keys$insertValue), collapse = ', ')
insertQry = dbSendQuery(myDb, paste0("INSERT INTO post_keys VALUES ", insertValues, ";"))
fetch(insertQry, n = -1)

# jobs df
jobs <- my_data
names(jobs)[names(jobs)=="Job_Title"] <- "role_desc"
jobs$post_id <-seq.int(nrow(jobs))
jobs <- merge(jobs, roles, by ="role_desc")
jobs <- merge(jobs, locations, by= c("City","State"))
jobs <- subset(jobs, select= c(post_id,role_id,loc_id))
jobs = jobs %>% mutate(insertValue = paste0("(", post_id, ", ", role_id, ", ", loc_id, ")"))
insertValues = paste(unlist(jobs$insertValue), collapse = ', ')
insertQry = dbSendQuery(myDb, paste0("INSERT INTO jobs VALUES ", insertValues, ";"))
fetch(insertQry, n = -1)
