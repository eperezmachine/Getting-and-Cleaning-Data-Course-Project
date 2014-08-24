Getting-and-Cleaning-Data-Course-Project
========================================

The Course Project is an important component of Getting and Cleaning Data course. Course Projects are evaluated and graded through peer assessment.

## This repo explains how all of the scripts work and how they are connected. 

1. The source data web:
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the data ("UCI HAR Dataset") in the working directory
3. Use source("run_analysis.R") command in RStudio.
4. The "R" script generate a file named "TidyData.txt" that containing a 
   data matrix called "meansData" with 180 X 68 dimension, the average of 
   each variable for each activity and each subject from data source.
