##  run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Load features
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

##Load activity labels
activity_Labels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

##Load training data
X_train = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
Y_train = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
subject_train= read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

##Load test data
X_test = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
Y_test = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
subject_test= read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)


## 1. Merges the training and the test sets to create one data set.
train_data <- cbind(cbind(X_train, subject_train), Y_train)
test_data <- cbind(cbind(X_test, subject_test), Y_test)
all_data <- rbind(train_data, test_data)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
extracted_features <- grepl("mean|std", features)
all_data<-all_data[,extracted_features]

## 3. Uses descriptive activity names to name the activities in the data set

## 4. Appropriately labels the data set with descriptive activity names.

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
