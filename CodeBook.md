# Getting and Cleaning Data Course Project

This CodeBook describes the variables, the data, and any transformations or work that were performed to clean up the data.


### MAIN DATA FRAMES AND THEIR CORRESPONDING DATA SET FROM THE UCI HAR DATASET FOLDER

| Data Frame | Description | 
| ----------- | ----------- |
| feats | 'features.txt': List of all features. | 
| activitylabs | 'activity_labels.txt': Links the class labels with their activity name. | 
| xtrain | 'train/X_train.txt': Training set. | 
| ytrain | 'train/y_train.txt': Training labels. | 
| xtest | 'test/X_test.txt': Test set. | 
| ytest | 'test/y_test.txt': Test labels. | 
subjtrain | 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  | 
subjtest  | 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  | 


### DATA FRAMES THAT CAME FROM RESHAPING THE MAIN DATA FRAMES
| Data Frame | Description | 
| ----------- | ----------- |
| feats2 | features with mean or std in their names
| ft | the unique numbers corresponding to features with means or std which will be used to select the column |
| fn | the names of the unique features with means or std which will be used to rename the column |
| xtest2 | a secondary data set from xtest which selects only the columns with the numbers with mean or std |
| xtrain2 | a secondary data set which xtrain selects only the columns with the numbers with mean or std |
| ytest2 | a secondary data set from ytest which converts the activity variable to the corresponding activity name |
| ytrain2 | a secondary data set from ytrain which converts the activity variable to the corresponding activity name |


### DATA FRAMES THAT CAME FROM MERGING THE SECONDARY DATA SETS
| Data Frame | Description | 
| ----------- | ----------- |
| test | test data sets combined from the secondary data set xtest2 & ytest2 |
| train | test data sets combined from the secondary data set xtrain2 & ytrain2 |
| data | test data sets combined from test & train datasets also the cleaned up data |
| tiddydata | data set with the average of each variable for each activity and each subject. |



### VARIABLES

| Data Frame | Description | 
| ----------- | ----------- |
| activity | a factor with 6 levels which represents six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) done by the subject to record 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz |
| subject | a factor with 30 levels which represents volunteers within an age bracket of 19-48 years who performed the activities to collect accelerometer and gyroscope data from smartphones |
The rest of the variables are the mean and standard deviation of the following features: 
---

tBodyAcc-X,Y or Z \n

tGravityAcc-X,Y or Z \n

tBodyAccJerk-X,Y or Z \n

tBodyGyro-X,Y or Z \n

tBodyGyroJerk-X,Y or Z \n

tBodyAccMag \n

tGravityAccMag \n

tBodyAccJerkMag \n

tBodyGyroMag \n

tBodyGyroJerkMag \n

fBodyAcc-X,Y or Z \n

fBodyAccJerk-X,Y or Z \n

fBodyGyro-X,Y or Z \n

fBodyAccMag \n

fBodyAccJerkMag \n

fBodyGyroMag \n

fBodyGyroJerkMag \n


Which come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ of the smart phone.

