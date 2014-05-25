CodeBook
=========
Junyan Tan (25/05/2014)
Describe the variables, the data, and any transformations or work performed to clean up the data

# Data:

The data used is the Human Activity Recognition Using Smartphones Data Set retrieved from the UCI Machine Learning Repository which is built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. Reference: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, retrieved 25/05/2014.

The dataset consists of a training and test dataset. The obtained dataset has been randomly partitioned into two sets, where 70 percent of the volunteers was selected for generating the training data and 30 percent the test data. 

Some more important variables used in code (ignoring any temporary intermediate ones):

1. feature - a data frame containing a list of codes corresponding to the corresponding feature measurement recorded obtained from feature.txt in the dataset
2. train_cmp - nicely formatted training data frame with descriptive activity and feature names
3. test_cmp - nicely formatted test data frame with descriptive activity and feature names
4. cmp_data - nicely formatted merged test and training data frame
5. tidy_data - data frame with only mean and standard deviations of measurements of each feature
6. final_data - final independent tidy data set with the average of each variable for each activity and each subject

# Work performed to obtain clean dataset:

1. Read and process test and training dataset - using feature.txt and activity_labels.txt to replace the codes for different activities and variables for more descriptive names 
2. Merge the training and test datasets using rbind()
3. Using regular expressions (grep()) to extract only the measurements on the mean and standard deviation for each measurement
4. Using a for loop and the plyr package (ddply) to create second, independent tidy data set with the average of each variable for each activity and each subject
5. Write new tidy data set to final_data.txt

Variables in final tidy data set (final_data.txt) - "Activity" and "Subject" are self-explanatory and the average of each feature for each activity and each subject can be found under the variable name (mean(*insert feature)). To understand what each variable (feature) means please refer to features_info.txt and README.txt in the downloaded dataset.

[1] "Activity"                         
[2] "Subject"                          
[3] "mean(tBodyAcc-std()-X)"           
[4] "mean(tBodyAcc-std()-Y)"           
[5] "mean(tBodyAcc-std()-Z)"           
[6] "mean(tGravityAcc-std()-X)"        
[7] "mean(tGravityAcc-std()-Y)"        
[8] "mean(tGravityAcc-std()-Z)"        
[9] "mean(tBodyAccJerk-std()-X)"       
[10] "mean(tBodyAccJerk-std()-Y)"       
[11] "mean(tBodyAccJerk-std()-Z)"       
[12] "mean(tBodyGyro-std()-X)"          
[13] "mean(tBodyGyro-std()-Y)"          
[14] "mean(tBodyGyro-std()-Z)"          
[15] "mean(tBodyGyroJerk-std()-X)"      
[16] "mean(tBodyGyroJerk-std()-Y)"      
[17] "mean(tBodyGyroJerk-std()-Z)"      
[18] "mean(tBodyAccMag-std())"          
[19] "mean(tGravityAccMag-std())"       
[20] "mean(tBodyAccJerkMag-std())"      
[21] "mean(tBodyGyroMag-std())"         
[22] "mean(tBodyGyroJerkMag-std())"     
[23] "mean(fBodyAcc-std()-X)"           
[24] "mean(fBodyAcc-std()-Y)"           
[25] "mean(fBodyAcc-std()-Z)"           
[26] "mean(fBodyAccJerk-std()-X)"       
[27] "mean(fBodyAccJerk-std()-Y)"       
[28] "mean(fBodyAccJerk-std()-Z)"       
[29] "mean(fBodyGyro-std()-X)"          
[30] "mean(fBodyGyro-std()-Y)"          
[31] "mean(fBodyGyro-std()-Z)"          
[32] "mean(fBodyAccMag-std())"          
[33] "mean(fBodyBodyAccJerkMag-std())"  
[34] "mean(fBodyBodyGyroMag-std())"     
[35] "mean(fBodyBodyGyroJerkMag-std())" 
[36] "mean(tBodyAcc-mean()-X)"          
[37] "mean(tBodyAcc-mean()-Y)"          
[38] "mean(tBodyAcc-mean()-Z)"          
[39] "mean(tGravityAcc-mean()-X)"       
[40] "mean(tGravityAcc-mean()-Y)"       
[41] "mean(tGravityAcc-mean()-Z)"       
[42] "mean(tBodyAccJerk-mean()-X)"      
[43] "mean(tBodyAccJerk-mean()-Y)"      
[44] "mean(tBodyAccJerk-mean()-Z)"      
[45] "mean(tBodyGyro-mean()-X)"         
[46] "mean(tBodyGyro-mean()-Y)"         
[47] "mean(tBodyGyro-mean()-Z)"         
[48] "mean(tBodyGyroJerk-mean()-X)"     
[49] "mean(tBodyGyroJerk-mean()-Y)"     
[50] "mean(tBodyGyroJerk-mean()-Z)"     
[51] "mean(tBodyAccMag-mean())"         
[52] "mean(tGravityAccMag-mean())"      
[53] "mean(tBodyAccJerkMag-mean())"     
[54] "mean(tBodyGyroMag-mean())"        
[55] "mean(tBodyGyroJerkMag-mean())"    
[56] "mean(fBodyAcc-mean()-X)"          
[57] "mean(fBodyAcc-mean()-Y)"          
[58] "mean(fBodyAcc-mean()-Z)"          
[59] "mean(fBodyAccJerk-mean()-X)"      
[60] "mean(fBodyAccJerk-mean()-Y)"      
[61] "mean(fBodyAccJerk-mean()-Z)"      
[62] "mean(fBodyGyro-mean()-X)"         
[63] "mean(fBodyGyro-mean()-Y)"         
[64] "mean(fBodyGyro-mean()-Z)"         
[65] "mean(fBodyAccMag-mean())"         
[66] "mean(fBodyBodyAccJerkMag-mean())" 
[67] "mean(fBodyBodyGyroMag-mean())"    
[68] "mean(fBodyBodyGyroJerkMag-mean())"


