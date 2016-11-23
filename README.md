#Getting and Cleaning Data Course Project
###Peer-graded Assignment: Tidy Dataset
***

#Introduction:

The purpose of this project is to demonstrate Our ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.  
The submitted data contains the following: 
1. a tidy data set called *data_tidy_output.txt* as described in the [project criteria](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project)
2. a script for performing the analysis called *run_analysis.R*. 
3. a code book that describes the variables, the data, and any transformations or work that have performed to clean up the data called *CodeBook.md*. 
4. also include this *README.md* which explains how all of the scripts work and how they are connected.  
***

>##Background
>One of the most exciting areas in all of data science right now is >wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . 
>Companies like Fit bit, Nike, and Jawbone Up are racing to develop the >most advanced algorithms to attract new users. The data linked to from >the course website represent data collected from the accelerometers >from the Samsung Galaxy S smartphone.   

***
###site where the data was obtained:

[Click Here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

###Here are the data for the project:

[Click Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

***

*##Contents:
  +1. Introduction
  +2. Background
  +3. Data Source
  +4. Script Walk-through
  
***

##Script Walk-through

*file: run_analysis.R*

**Step 0:** Linking all needed libraries (e.g. dplyr & tidyr)

**Step 1:** getting and dowloading data using download.file and unzip and change directory to where our data is located

>we can note that there are 3 types of files included generic data, train,and test

**Step 2:** Read the generic data first i.e. activity_labels.txt & features.txt

>it was found that it is better to fix the names of variables at the beginnig that's how it will be easy to proceed

adding appropriate names to activity_labels frame as id & activity

>fter doing some views noticed that activity_labels goes with y_* and features goes with column names of X_* while subject_* acts as observation ID

**Step 3:** reading the train datasets (using read.table)
      *Step 3.1:* assigning features names to X_train
      *Step 3.2:* fixing names of subject_train & y_train
      *Step 3.3:* now building the train dataset by combinig all the three together
      
**Step 4:** repeating *Step 3* but for test sets

**Step 5:** Merging the training and the test sets to create one data set.

**Step 6:** Using descriptive activity names to name the activities in the data set

>Note: in the same step we argoing to convert the result to dplyr tibble object using %>% tbl_df construct

**Step 7:** Extracting only the measurements on the mean and standard deviation for each measurement.

**Step 8:** tidy data set with the average of each variable for each activity and each subject

>again we will use the operator %>% to pipeline the data to groub_by then to summarize_each functions

**Step 9:** Finaly output our result to file called *data_tidy_output.txt* using write.table

#Voit la here is your tidy dataset :)