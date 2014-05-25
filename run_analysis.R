# Getting and Cleaning Data
# Peer Assessment Course Project
# Junyan Tan

# Instructions to use this script
# Download and unzip required dataset
# Set working directory to unzipped folder containing downloaded data using command below
setwd("~/Desktop/test_repo/UCI HAR Dataset 2")
# run the script once the above directory is set to the correct one on your computer

# Activate required packages
library(plyr)

# read list of features
feature <- read.table('features.txt')

# read and process test dataset
test_res <- read.table("./test/X_test.txt")
test_act <- read.table("./test/y_test.txt")
test_subj <- read.table("./test/subject_test.txt")
colnames(test_res) <- feature[,2]
colnames(test_subj) <- "Subject"
colnames(test_act) <- "Activity"

# update activity codes with descriptive activity names
test_act <- as.factor(test_act[[1]])
test_act <- revalue(test_act,c("1"="Walking","2"="Walking Upstairs","3"="Walking Downstairs","4"="Sitting","5"="Standing","6"="Laying"))
test_cmp <- cbind(test_act,test_subj,test_res)
rm("test_res","test_subj","test_act")
colnames(test_cmp)[1] <- "Activity"

# read and process training dataset 
train_res <- read.table("./train/X_train.txt")
train_act <- read.table("./train/y_train.txt")
train_subj <- read.table("./train/subject_train.txt")
colnames(train_res) <- feature[,2]
colnames(train_subj) <- "Subject"
colnames(train_act) <- "Activity"

# update activity codes with descriptive activity names
train_act <- as.factor(train_act[[1]])
train_act <- revalue(train_act,c("1"="Walking","2"="Walking Upstairs","3"="Walking Downstairs","4"="Sitting","5"="Standing","6"="Laying"))
train_cmp <- cbind(train_act,train_subj,train_res)
rm(train_act,train_subj,train_res)
colnames(train_cmp)[1] <- "Activity"

# merging the test and training dataset into one dataset
cmp_data <- rbind(test_cmp,train_cmp)

# extracting only the measurements on the mean and standard deviation for each measurement.
tidy_data <- cmp_data[,c(1,2,grep("*std()",colnames(cmp_data)),grep("*mean()",colnames(cmp_data)))]
tidy_data <- tidy_data[,-c(grep("*Freq",colnames(tidy_data)))]

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
for (x in 1:(dim(tidy_data)[2]-2)){
    tmp <- ddply(tidy_data,c("Activity","Subject"), function(y) mean(y[[colnames(tidy_data)[x+2]]]))
    if (x == 1) {final_data <- as.data.frame(c(tmp[,c(1,2)]))}
    if (!identical(final_data[,c(1,2)],tmp[,c(1,2)])) break # check that first two columns are identical
    final_data[[paste("mean(",colnames(tidy_data)[x+2],")",sep="")]]<-tmp[,3]
}

# save second, independent tidy data set into text file
write.table(final_data,file="final_data.txt")
