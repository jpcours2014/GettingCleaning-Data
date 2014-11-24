##  run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Load features
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE, colClasses = c("character"))

##Load activity labels
activity_labels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

##Load training data
X_train = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
y_train = read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE, col.names=c("ActivityId"))
subject_train= read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE, col.names=c("Subject"))

##Load test data
X_test = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
y_test = read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE, col.names=c("ActivityId"))
subject_test= read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE, col.names=c("Subject"))


## 1. Merges the training and the test sets to create one data set.
train_data <- cbind(cbind(X_train, subject_train), y_train)
test_data <- cbind(cbind(X_test, subject_test), y_test)
all_data <- rbind(train_data, test_data)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
all_labels <- rbind(rbind(features, c(562,"Subject")),c(563, "ActivityId"))[,2]
names(all_data) <- all_labels

all_data<-all_data[,grepl("mean|std|Subject|ActivityId", names(all_data))]

## 3. Uses descriptive activity names to name the activities in the data set
all_data <- join(all_data, activity_labels, by = "ActivityId", match = "first")
all_data <- all_data[,-1]

## 4. Appropriately labels the data set with descriptive activity names.
colNames<-colnames(all_data) 
for (i in 1:length(colNames))
{
colNames[i] = gsub("\\()","",colNames[i])
colNames[i] = gsub("-std$","StdDev",colNames[i])
colNames[i] = gsub("-mean","Mean",colNames[i])
colNames[i] = gsub("^(t)","time",colNames[i])
colNames[i] = gsub("^(f)","freq",colNames[i])
colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};

colnames(all_data) = colNames;


## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data<-ddply(all_data, c("Subject","Activity"), numcolwise(mean))
write.table(tidy_data, "tidy_data.txt", sep="\t")
