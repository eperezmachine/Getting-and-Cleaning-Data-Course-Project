# Getting and Cleaning Data 
# Course Project 
# Code Book
*************************************************************************
## Code Book describes the variables, the data and any transformations 
## or work that performed to clean up the data
*************************************************************************

## Course Project

You should create one R script called run_analysis.R that does the 
following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for 
   each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each 
   variable for each activity and each subject.
*************************************************************************

## Source of the Data Course Project

The source site where the data was obtained:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones    

*************************************************************************

## 1. Merges the training and the test sets to create one data set.

1.1. Read X_train.txt, y_train.txt and subject_train.txt files from the 
     "./train" folder and store them in "xTrainData", "yTrainData" and 
     "sTrainData" variables respectively.       
1.2. Read X_test.txt, y_test.txt and subject_test.txt files from the 
     "./test" folder and store them in "xTestData", "yTestData" and 
     "sTestData" variables respectively.  
1.3. Join "xTrainData" to "xTestData" to create a data frame, "xMergeData", 
     join "yTrainData" to "yTestData" to create a data frame, "yMergeData", 
     join "sTrainData" to "sTestData" to create a data frame "sMergeData".  

*************************************************************************

##  2.- Extracts only the measurements on the mean and standard deviation 
        for each measurement.

2.1. Read the features.txt file from the "/UCI HAR Dataset" folder and 
     store the data in a variable called "features"
2.2. We select the measurements on the mean and standard deviation. The 
     results were a 66 indices list named "selectIndices", we create a 
     subset of "xMergeData" with the 66 corresponding columns named 
     "xmsMergeData".  

*************************************************************************

##  3. Uses descriptive activity names to name the activities in the 
       data set.

3.1. Read the activity_labels.txt file from the "/UCI HAR Dataset" folder 
     and store the data in a variable called "activity"
3.2. We remove the "-" symbols in the activity names. 
3.3. Replacement of the activity names in "yMergeData" file.
3.4. We name the head of activity_label column with "Activity".

*************************************************************************

##  4. Appropriately labels the data set with descriptive activity names.

4.1. We name the head of sMergeData column with "Subject".
4.2. We remove the "()" and "-" symbols in the column of "xmsMergeData"
     data frame.
4.3. We combine "sMergeData", "yMergeData" and "xmsMergeData" to "trueData" 
     frame. 

*************************************************************************

##  5. Creates a second, independent tidy data set with the average of 
       each variable for each activity and each subject.

5.1. Finally, generate a tidy data set with the average of each measurement 
     for each activity and each subject. We create a data matrix with 30 
     subjects and 6 activities named "meansData", in other words, 180 rows. 
     For each row of the matrix, we compute the mean of each measurement. 
     We use a double "for" to calculate and assign the results.
5.2. Write the matrix of results "meansData" out to "TidyData.txt" file 
     in current working directory. 

*************************************************************************

# Getting and Cleaning Data 
# Course Project 
# Code Book

*************************************************************************

 Enrique Pérez Pérez
 eperezmachine@gmail.com

*************************************************************************
