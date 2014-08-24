# Getting and Cleaning Data - Course Project 
## ENRIQUE PÉREZ PÉREZ
## eperezmachine@gmail.com 
#
# Steps.
# 1.- Merges the training and the test sets to create one data set.
#
#
setwd("D:/005 ClassGCD/005 Course Project/data/UCI HAR Dataset")
#
xTrainData <- read.table("./train/X_train.txt")
xTestData <- read.table("./test/x_test.txt")
xMergeData <- rbind(xTrainData, xTestData)
#
yTrainData <- read.table("./train/y_train.txt")
yTestData <- read.table("./test/y_test.txt") 
yMergeData <- rbind(yTrainData, yTestData)
#
sTrainData <- read.table("./train/subject_train.txt")
sTestData <- read.table("./test/subject_test.txt")
sMergeData <- rbind(sTrainData, sTestData)
#
dim(xMergeData)
# [1] 10299   561
#
dim(yMergeData)
# [1] 10299     1
#
dim(sMergeData)
# [1] 10299     1
#
#
# 2.- Extracts only the measurements on the mean and standard deviation for each measurement. 
#
#
features <- read.table("features.txt")
selectIndices <- as(features[grepl("mean\\(\\)|std\\(\\)", features[, 2]) , 1],"array")
length(selectIndices) 
# 66
selectIndices
# [1]   1   2   3   4   5   6  41  42  43  44  45  46  81  82  83  84  85  86 121 122
# [21] 123 124 125 126 161 162 163 164 165 166 201 202 214 215 227 228 240 241 253 254
# [41] 266 267 268 269 270 271 345 346 347 348 349 350 424 425 426 427 428 429 503 504
# [61] 516 517 529 530 542 543
xmsMergeData <- xMergeData[, selectIndices]
dim(xmsMergeData)
# [1] 10299   66
#
#
#
# 3. Uses descriptive activity names to name the activities in the data set.
#
#
#
activity <- read.table("activity_labels.txt")
activityNames <- gsub("_", " ", activity[, 2])
activityNames
# [1] "WALKING"            "WALKING UPSTAIRS"   "WALKING DOWNSTAIRS"
# [4] "SITTING"            "STANDING"           "LAYING" 
activityLabel <- activityNames[yMergeData[,1]]
yMergeData[,1] <- activityLabel
names(yMergeData) <- "Activity"
#
#
#
# 4. Appropriately labels the data set with descriptive activity names.
#
#
#
names(sMergeData) <- "Subject"
names(xmsMergeData) <- gsub("\\(\\)", "", features[selectIndices,2])
names(xmsMergeData) <- gsub("-"," ",names(xmsMergeData))
names(xmsMergeData)
# [1] "tBodyAcc mean X"           "tBodyAcc mean Y"           "tBodyAcc mean Z"           "tBodyAcc std X"           
# [5] "tBodyAcc std Y"            "tBodyAcc std Z"            "tGravityAcc mean X"        "tGravityAcc mean Y"       
# [9] "tGravityAcc mean Z"        "tGravityAcc std X"         "tGravityAcc std Y"         "tGravityAcc std Z"        
# [13] "tBodyAccJerk mean X"       "tBodyAccJerk mean Y"       "tBodyAccJerk mean Z"       "tBodyAccJerk std X"       
# [17] "tBodyAccJerk std Y"        "tBodyAccJerk std Z"        "tBodyGyro mean X"          "tBodyGyro mean Y"         
# [21] "tBodyGyro mean Z"          "tBodyGyro std X"           "tBodyGyro std Y"           "tBodyGyro std Z"          
# [25] "tBodyGyroJerk mean X"      "tBodyGyroJerk mean Y"      "tBodyGyroJerk mean Z"      "tBodyGyroJerk std X"      
# [29] "tBodyGyroJerk std Y"       "tBodyGyroJerk std Z"       "tBodyAccMag mean"          "tBodyAccMag std"          
# [33] "tGravityAccMag mean"       "tGravityAccMag std"        "tBodyAccJerkMag mean"      "tBodyAccJerkMag std"      
# [37] "tBodyGyroMag mean"         "tBodyGyroMag std"          "tBodyGyroJerkMag mean"     "tBodyGyroJerkMag std"     
# [41] "fBodyAcc mean X"           "fBodyAcc mean Y"           "fBodyAcc mean Z"           "fBodyAcc std X"           
# [45] "fBodyAcc std Y"            "fBodyAcc std Z"            "fBodyAccJerk mean X"       "fBodyAccJerk mean Y"      
# [49] "fBodyAccJerk mean Z"       "fBodyAccJerk std X"        "fBodyAccJerk std Y"        "fBodyAccJerk std Z"       
# [53] "fBodyGyro mean X"          "fBodyGyro mean Y"          "fBodyGyro mean Z"          "fBodyGyro std X"          
# [57] "fBodyGyro std Y"           "fBodyGyro std Z"           "fBodyAccMag mean"          "fBodyAccMag std"          
# [61] "fBodyBodyAccJerkMag mean"  "fBodyBodyAccJerkMag std"   "fBodyBodyGyroMag mean"     "fBodyBodyGyroMag std"     
# [65] "fBodyBodyGyroJerkMag mean" "fBodyBodyGyroJerkMag std"  
trueData <- cbind(sMergeData, yMergeData, xmsMergeData)
names(trueData)
# [1] "Subject"                   "Activity"                   "tBodyAcc mean X"           "tBodyAcc mean Y"          
# [5] "tBodyAcc mean Z"           "tBodyAcc std X"             "tBodyAcc std Y"            "tBodyAcc std Z"           
# [9] "tGravityAcc mean X"        "tGravityAcc mean Y"         "tGravityAcc mean Z"        "tGravityAcc std X"        
# [13] "tGravityAcc std Y"         "tGravityAcc std Z"         "tBodyAccJerk mean X"       "tBodyAccJerk mean Y"      
# [17] "tBodyAccJerk mean Z"       "tBodyAccJerk std X"        "tBodyAccJerk std Y"        "tBodyAccJerk std Z"       
# [21] "tBodyGyro mean X"          "tBodyGyro mean Y"          "tBodyGyro mean Z"          "tBodyGyro std X"          
# [25] "tBodyGyro std Y"           "tBodyGyro std Z"           "tBodyGyroJerk mean X"      "tBodyGyroJerk mean Y"     
# [29] "tBodyGyroJerk mean Z"      "tBodyGyroJerk std X"       "tBodyGyroJerk std Y"       "tBodyGyroJerk std Z"      
# [33] "tBodyAccMag mean"          "tBodyAccMag std"           "tGravityAccMag mean"       "tGravityAccMag std"       
# [37] "tBodyAccJerkMag mean"      "tBodyAccJerkMag std"       "tBodyGyroMag mean"         "tBodyGyroMag std"         
# [41] "tBodyGyroJerkMag mean"     "tBodyGyroJerkMag std"      "fBodyAcc mean X"           "fBodyAcc mean Y"          
# [45] "fBodyAcc mean Z"           "fBodyAcc std X"            "fBodyAcc std Y"            "fBodyAcc std Z"           
# [49] "fBodyAccJerk mean X"       "fBodyAccJerk mean Y"       "fBodyAccJerk mean Z"       "fBodyAccJerk std X"       
# [53] "fBodyAccJerk std Y"        "fBodyAccJerk std Z"        "fBodyGyro mean X"          "fBodyGyro mean Y"         
# [57] "fBodyGyro mean Z"          "fBodyGyro std X"           "fBodyGyro std Y"           "fBodyGyro std Z"          
# [61] "fBodyAccMag mean"          "fBodyAccMag std"           "fBodyBodyAccJerkMag mean"  "fBodyBodyAccJerkMag std"  
# [65] "fBodyBodyGyroMag mean"     "fBodyBodyGyroMag std"      "fBodyBodyGyroJerkMag mean" "fBodyBodyGyroJerkMag std"  
#
#
#
# 5. Creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject.
#
#
#
meansData<-matrix(NA, nrow=dim(table(sMergeData))*dim(activity)[1], ncol=dim(trueData)[2]) 
dim(meansData)
# [1] 180  68
dimnames(meansData)<-list(NULL,c("Subject","Activity",names(xmsMergeData)))
meansData[,1]<-c(1:30)
meansData<-meansData[order(meansData[,1]),]
meansData[,2]<-activityNames[]
counter<-1
for (i in 1:30) {
    for (j in 1:6) {
        meansData[counter,3:68]<-colMeans(trueData[trueData[,1]==i&trueData[,2]==activityNames[j],3:68]) 
        counter<-counter+1
    }
}
setwd("D:/005 ClassGCD/005 Course Project/data")
write.table(meansData, "TidyData.txt",row.name=FALSE)
#
#
#
