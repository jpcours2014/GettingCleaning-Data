# Getting and Cleaning Data

## Course Project
The purpose of this project is to demonstrate  ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.

##Repository files description

* __CodeBook.md__:  A code book that describes the variables, the data, and any transformations or work  performed to clean up the data
* __LICENSE__: license terms for text and code
* __README.md__:this file
* __run_analysis.R__: R script to transform raw data set in a tidy one


##R script called run_analysis.R  does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##Steps how to create tidy data set

1. Download the data [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)and put into a folder on your local drive. You'll have a UCI HAR Dataset folder.
2. Put run_analysis.R in the parent folder of UCI HAR Dataset
3. Set it as your working directory using setwd() function in RStudio.
4. Run source("run_analysis.R")
