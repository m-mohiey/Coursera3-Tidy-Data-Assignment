#Getting and Cleaning Data Course Project

## Step 0: Linking all needed libraries

library(dplyr)
library(tidyr)

## First Downloading data to working directory ##

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","UCI HAR Dataset.zip")

## Unpacking the zip file and moving to the new directory
unzip("UCI HAR Dataset.zip")
setwd("UCI HAR Dataset")

## Reding activity_labels & features
activity_labels<-read.table("activity_labels.txt")
features<-read.table("features.txt")

## fixing activity_labels names for redability

names(activity_labels)<-c("id","activity")

# after doing some views noticed that activity_labels goes with y_*
# and features goes with column names of X_*
# while subject_* acts as observation ID

# let's start by reading train data

subject_train<-read.table("train/subject_train.txt")
X_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
# assigning features names to X_train
names(X_train)<-features[,2]
#fixing names of subject & y
names(subject_train)<-"subject"
names(y_train)<-"activity_id"
#now building the train dataset by combinig all the three together
data_train<-data.frame(subject=subject_train,activity_id=y_train,X_train)

# then will proceed with the test data

subject_test<-read.table("test/subject_test.txt")
X_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
# assigning features names to X_test
names(X_test)<-features[,2]
#fixing names of subject & y
names(subject_test)<-"subject"
names(y_test)<-"activity_id"
#now building the test dataset by combinig all the three together
data_test<-data.frame(subject=subject_test,activity_id=y_test,X_test)


## Merging the training and the test sets to create one data set.

data_all<-rbind(data_train,data_test) 

#  Using descriptive activity names to name the activities in the data set
#   and converting it to dplyr tbl object

data_all<-merge(data_all,activity_labels,by.x = "activity_id", by.y = "id",sort = FALSE) %>% tbl_df

### Extracting only the measurements on the mean and standard deviation for each measurement.

data_extract<-select(data_all,subject,activity_id,activity,contains("mean"),contains("std"))

### it is time for tidy data
### tidy data set with the average of each variable for each activity and each subject

data_tidy<-data_extract %>% group_by(subject,activity) %>% summarise_each(funs(mean))

### Finaly output our result to file

write.table(data_tidy,"../data_tidy_output.txt")