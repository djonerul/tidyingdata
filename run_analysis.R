rm(list=ls())

library(plyr);library(dplyr)

setwd("~/R/tidyingdata") #project folder

#####READ-----

activitylabs <- read.table("./UCI HAR Dataset/activity_labels.txt",header = F, stringsAsFactors = T)
feats <- read.table("./UCI HAR Dataset/features.txt",header = F, stringsAsFactors = T)
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt",header = F, stringsAsFactors = T)
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt",header = F, stringsAsFactors = T)
subjtest <- read.table("./UCI HAR Dataset/test/subject_test.txt",header = F, stringsAsFactors = T)
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header = F, stringsAsFactors = T)
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header = F, stringsAsFactors = T)
subjtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",header = F, stringsAsFactors = T)



#####RESHAPE----
#prepare column names and columns with mean() and std()
feats2 <- feats[grepl("mean",feats$V2) | grepl("std",feats$V2),] #get features with mean or std
ft <- feats2$V1 #get the numbers corresponding to features with means or std
fn <- c("subject","activity",as.vector(feats2$V2)) %>% #use the numbers to locate the names
        gsub(pattern = "\\(\\)",replacement = "") %>% #clean up the names
        gsub(pattern = "-",replacement = "") %>% #clean up the names
        gsub(pattern = "std",replacement = "StDev") 


#select columns with mean() and std()
xtest2 <- select(xtest,ft) #select only the columns with the numbers with mean or std
xtrain2 <- select(xtrain,ft) #select only the columns with the numbers with mean or std

#replace activity ID with activity labels
ytest2 <- join(ytest,activitylabs,by='V1');ytest2 <- ytest2[-1]
ytrain2 <- join(ytrain,activitylabs,by='V1');ytrain2 <- ytrain2[-1]



#####MERGE----
test <- cbind(subjtest,ytest2,xtest2) #combine the test data sets
train <- cbind(subjtrain,ytrain2,xtrain2) #combine the train data sets
data <- rbind(test,train)#combine both data sets
names(data) <- fn #set the name for each variable
data$subject <- as.factor(data$subject) #make subject as factor



#####SUBSET-----
tiddydata <- data %>% group_by(activity,subject) %>% #group according to activity
        summarise_all(mean) #summarise all contents of the table


#####EXPORT-----
write.table(tiddydata,"tidydata.txt",row.names = F) #create a text file with the tidy data
