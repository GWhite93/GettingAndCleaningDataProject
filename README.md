# README
This is the README file for run_analysis.R for the Peer Graded Assignment (Course Project)
of the Data Science course "Getting and Cleaning Data".It gives a description of all the files that were used or created for the completion of the Course Project. 

title: "README.md"
author: "Gerben Tempelman"
date: "July 18th 2016"

## The dataset includes the following files:

* run_analysis.R
* README.md (this file)
* CodeBook.md

==================================================================
## About run_analysis.R

This file contains the R script that was used to create a tidy dataset. It does so by 
loading the files into R, merging the files into one dataset, appropriately labeling the data set with descriptive variable names, extracting only the measurements on the mean and standard deviation for each measurement, and by tidying the dataset by taking the 
average of each variable for each activity and each subject. 

The final dataset contains information on measurements of 6 activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) for 30 subjects. The tidy dataset contains 180 rows (30 subjects * 6 activities), and 68 columns. The first column indicates the Subject ID. The second column indicates the Activity that the Subject performed. Columns 3 - 68 are various measurements that were recorded per Subject/Activity. These measurements all contain either the mean() or std(). Each measurement is the average for each activity and each subject for a specific variable.

## Instructions R script
Before running the R script, the user has to make sure that the files that are loaded into R by the R script are unzipped into the working directory. In other words: the user has to make sure that the working directory is set to the folder that contains the folder "UCI HAR Dataset". Otherwise the R script will not load the files correctly. Setting the working directory can be done by using the setwd("file_path") command.

Furthermore, to read run_analysis.txt into R from the file, make sure that the txt file exists in your working directory and use the following code:

data <- read.table("run_analysis.txt", header = TRUE)
View(data)

## Steps in the R script
In order to finish the Course Project successfuly, several steps had to be taken. This section explains how the 5 steps were performed and how the script works.

* Load files into R
First, the R script loads all the necessary files into R in order to manipulate them in later steps.

* Step 1 & 4: Merges the training and the test sets to create one data set & Appropriately labels the data set with descriptive variable names.
In order to create a more efficient script, steps 1 and 4 were combined, so that extracting certain measures in step 2 becomes much easier. This step creates one dataset for the test-subjects and one for the training-subjects, and later merges them together into one big dataset. The column names are defined and are used as variable labels and are descriptive names. They describe the features that were selected as the variables. The complete list of variables and their description is available in 'CodeBook.md'. For a very specific description of how the variables were measured, I would like to refer to the features_info.txt file in the unzipped files folder.

* Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
This step selects only the columns that contain either the word "mean()" or "std()" in order to select the measures of the features that hold either the mean or the standard deviation. The columns that contained the word "mean" but not the parantheses were omitted.  

* Step 3: Uses descriptive activity names to name the activities in the data set
Originally, the activities that the subjects performed were coded as integers (ranging 1 to 6). These integers were replaced by descriptive activity names (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING). 

* Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
This step takes the data set in the previous step and creates a more tidy and parsimoniouss data set. It is structured so that each row contains the average measurements for a certain subject performing a certain activity. The first column shows a unique subject ID, the second column shows a unique activity that was performed by the subject in column 1, and the other columns show the average value for that subject performing that specific activity. This last set returns a tidy dataset called "df2" which is tidy because it meets the following principles:

* Each variable that was measured is in one column
* Each different observation of the variables is in a different row
* It includes descriptive variable names for the variables
* There are no duplicate columns

==================================================================
## CodeBook.md

The script is accompanied by a codebook. The codebook gives a description of the variable names and their meaning. Even though the descriptive variable names are included in the data set, the codebook gives a full description of each variable. I chose not to make the descriptive variable names free from all abbreviations, since most abbreviations like mean() and std() would be clear for any one that is interested to work with this dataset. Furthermore, making all descriptive variable names fully human readable by writing them out would hurt the parsimony and readability of the variable names, since they would be very long and they are difficult to compare due to the sheer length of the variable names. The codebook provides a more thorough description of what each variable measures.
