## Loading the libraries required to run the script

library(dplyr)
library(data.table)

## Downloading the zip file and unziping 

url <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dest <- paste0(getwd(), "/" , "UCI_HAR_Dataset.zip")
download.file(url, dest)
zipF<- "./UCI_HAR_Dataset.zip"
outDir<-"./UCI HAR Dataset"
unzip(zipF, exdir = outDir)
setwd("./UCI HAR Dataset/UCI HAR Dataset")

dirtest <- "test"
dirtrain <- "train"
subdirtest <- paste0("./", dirtest, "/Inertial Signals")
subdirtrain <- paste0("./", dirtrain, "/Inertial Signals")

test_IS <- list.files(subdirtest)
train_IS <- list.files(subdirtrain)

files_IS <- length(test_IS)

namestest <- gsub(".txt", "", test_IS)
namestrain <- gsub(".txt", "", train_IS)

## Reading general values: activity_labels, features

activity_labels <- read.table("activity_labels.txt", header = FALSE)
features <- read.table("features.txt", header = FALSE)

## Reading subject, x and y for the training data and the test data

subject_test <- read.table("./test/subject_test.txt", header = FALSE)
subject_train <- read.table("./train/subject_train.txt", header = FALSE)

x_test <- read.table("./test/x_test.txt", header = FALSE)
x_train <- read.table("./train/x_train.txt", header = FALSE)

y_test <- read.table("./test/y_test.txt", header = FALSE) 
y_train <- read.table("./train/y_train.txt", header = FALSE) 

## Reading the inertial signals for the training data and the test data -> Not used

for (i in 1:files_IS) {
        filetest <- paste(subdirtest, test_IS[i], sep="/")
        filetrain <- paste(subdirtrain, train_IS[i], sep="/")
        dataframetest <- read.table(filetest, header = FALSE)
        dataframetrain <- read.table(filetrain, header = FALSE)
        namedftest <- namestest[i]
        namedftrain <- namestrain[i]
        assign(namedftest, dataframetest)
        assign(namedftrain, dataframetrain)
}

## Cleaning features names

features_clean <- gsub("[()-]", "", features$V2)

## Assigning names

names(subject_test) <- c("subject")
names(subject_train) <- c("subject")

names(x_test) <- features_clean
names(x_train) <- features_clean

names(y_test) <- c("activity")
names(y_train) <- c("activity")

## Adding a new variable in the subject_test and subject_train

subject_test <- mutate(subject_test, type = "test")
subject_train <- mutate(subject_train, type = "training")

## Joining the subject, activity and feature

test_complete <- cbind.data.frame(subject_test, y_test, x_test)
train_complete <- cbind.data.frame(subject_train, y_train, x_train)

## 1. Merging the training and the test sets to create one data set

HAR <- rbind(test_complete, train_complete)

## 2. Extracting only the measurements on the mean and standard deviation for each measurement.

selected_features_index <- grep("mean|std|subject|type|activity", names(HAR))
selected_features_value <- grep("mean|std|subject|type|activity", names(HAR),value = TRUE)
selected_features_value <- gsub("[()-]", " ", selected_features_value)

HAR_new <- HAR[selected_features_index]

## 3. Using descriptive activity names to name the activities in the data set

HAR_new$activity <- factor(HAR_new$activity, levels=1:6, labels = activity_labels$V2)

## 4. Labeling appropriately the data set with descriptive variable names.

names(HAR_new) <- gsub("BodyBody","Body", names(HAR_new))
names(HAR_new) <- gsub("BodyAccMagmeanFreq","magnitude body acceleration mean frequency", names(HAR_new))
names(HAR_new) <- gsub("BodyAccJerkMagmeanFreq","magnitude body acceleration Jerk mean frequency", names(HAR_new)) 
names(HAR_new) <- gsub("BodyGyroMagmeanFreq","magnitude angular velocity mean frequency", names(HAR_new))
names(HAR_new) <- gsub("BodyGyroJerkMagmeanFreq","magnitude angular velocity Jerk mean frequency", names(HAR_new))
names(HAR_new) <- gsub("meanFreq","mean frequency ", names(HAR_new))
names(HAR_new) <- gsub("MagmeanFreq","magnitude mean frequency ", names(HAR_new))
names(HAR_new) <- gsub("BodyAccJerkMag","magnitude body acceleration Jerk ", names(HAR_new))
names(HAR_new) <- gsub("BodyGyroJerkMag","magnitude angular velocity Jerk ", names(HAR_new))
names(HAR_new) <- gsub("BodyAccMag","magnitude body acceleration ", names(HAR_new))
names(HAR_new) <- gsub("GravityAccMag","magnitude gravity acceleration ", names(HAR_new))
names(HAR_new) <- gsub("BodyGyroMag","magnitude angular velocity ", names(HAR_new))
names(HAR_new) <- gsub("BodyAccJerk","body acceleration Jerk ", names(HAR_new))
names(HAR_new) <- gsub("BodyGyroJerk","angular velocity Jerk ", names(HAR_new))
names(HAR_new) <- gsub("BodyAcc","body acceleration ", names(HAR_new))
names(HAR_new) <- gsub("GravityAcc","gravity acceleration ", names(HAR_new))
names(HAR_new) <- gsub("BodyGyro","angular velocity ", names(HAR_new))
names(HAR_new) <- gsub("^t", "(time domain) ", names(HAR_new))
names(HAR_new) <- gsub("^f", "(frequency domain) ", names(HAR_new))
names(HAR_new) <- gsub("mean", "mean ", names(HAR_new))
names(HAR_new) <- gsub("std", "std ", names(HAR_new))
names(HAR_new)[2] <- "type"
names(HAR_new) <- gsub(" $", "", names(HAR_new), perl=T) # deletes the spaces at the end

## 5. From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_HAR <- HAR_new %>% group_by(subject, activity, type) %>% summarise_all(mean) # type is included to avoid warnings 
write.table(tidy_HAR, "tidy_HAR.txt", row.name=FALSE)


