## Welcome to run_analysis.R
## set working directory to the directory in which the files are unzipped (that contains folder "UCI HAR Dataset")

## Load files into R
trainingset <- read.table("./UCI HAR Dataset/train/X_train.txt")
traininglabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
testset <- read.table("./UCI HAR Dataset/test/X_test.txt")
testlabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
subjecttraining <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

## Step 1 & 4: Merges the training and the test sets to create one 
## data set & Appropriately labels the data set with descriptive variable names.
cnames <- (t(features$V2)) 
trainingdata <- cbind(subjecttraining, traininglabels, trainingset)
testdata <- cbind(subjecttest, testlabels, testset)
colnames(trainingdata) <- c("Subject", "Activity", as.vector(cnames))
colnames(testdata) <- c("Subject", "Activity", as.vector(cnames))
df <- rbind(testdata, trainingdata)

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
df1 <- df[,1:2]
dfstdcol <- df[,(grepl("std()", names(df), fixed = TRUE) == TRUE)]
dfmeancol <- df[,(grepl("mean()", names(df), fixed = TRUE) == TRUE)]
df <- cbind(df1, dfstdcol, dfmeancol)

## Step 3: Uses descriptive activity names to name the activities in the data set
df$`activity label`[df$`Activity` == 1] <- "WALKING"
df$`activity label`[df$`Activity` == 2] <- "WALKING UPSTAIRS"
df$`activity label`[df$`Activity` == 3] <- "WALKING DOWNSTAIRS"
df$`activity label`[df$`Activity` == 4] <- "SITTING"
df$`activity label`[df$`Activity` == 5] <- "STANDING"
df$`activity label`[df$`Activity` == 6] <- "LAYING"

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the 
## average of each variable for each activity and each subject.
library(dplyr)
df2 <- df %>%
group_by(Subject, Activity) %>%
        summarise_each(funs(mean), 3:68)

df2$`Activity`[df2$`Activity` == 1] <- "WALKING"
df2$`Activity`[df2$`Activity` == 2] <- "WALKING UPSTAIRS"
df2$`Activity`[df2$`Activity` == 3] <- "WALKING DOWNSTAIRS"
df2$`Activity`[df2$`Activity` == 4] <- "SITTING"
df2$`Activity`[df2$`Activity` == 5] <- "STANDING"
df2$`Activity`[df2$`Activity` == 6] <- "LAYING"

View(df2)