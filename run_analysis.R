######################################
# 1 Merge training and test sets
######################################

########### 1A Load files from local directories
# Common files
features <- read.table("./features.txt")
activity_labels <- read.table("./activity_labels.txt")

# TRAINING SET files
subject_train <- read.table("./train/subject_train.txt")

y_train <- read.table("./train/y_train.txt")
X_train <- read.table("./train/X_train.txt")

body_acc_x_train <- read.table("./train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train <- read.table("./train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train <- read.table("./train/Inertial Signals/body_acc_z_train.txt")

body_gyro_x_train <- read.table("./train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train <- read.table("./train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train <- read.table("./train/Inertial Signals/body_gyro_z_train.txt")

total_acc_x_train <- read.table("./train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_train <- read.table("./train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_train <- read.table("./train/Inertial Signals/total_acc_z_train.txt")

# TEST SET files
subject_test <- read.table("./test/subject_test.txt")

y_test <- read.table("./test/y_test.txt")
X_test <- read.table("./test/X_test.txt")

body_acc_x_test <- read.table("./test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test <- read.table("./test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test <- read.table("./test/Inertial Signals/body_acc_z_test.txt")

body_gyro_x_test <- read.table("./test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test <- read.table("./test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test <- read.table("./test/Inertial Signals/body_gyro_z_test.txt")

total_acc_x_test <- read.table("./test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test <- read.table("./test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test <- read.table("./test/Inertial Signals/total_acc_z_test.txt")

########### 1B Concatenate TRAINING and TESTsets into single tables
subject <- rbind(subject_train,subject_test)
y <- rbind(y_train,y_test)  # It contains the activity label for each record
X <- rbind(X_train,X_test)

body_acc_x <- rbind(body_acc_x_train,body_acc_x_test)
body_acc_y <- rbind(body_acc_x_train,body_acc_y_test)
body_acc_z <- rbind(body_acc_x_train,body_acc_z_test)

body_gyro_x <- rbind(body_gyro_x_train,body_gyro_x_test)
body_gyro_y <- rbind(body_gyro_x_train,body_gyro_y_test)
body_gyro_z <- rbind(body_gyro_x_train,body_gyro_z_test)

total_acc_x <- rbind(total_acc_x_train,total_acc_x_test)
total_acc_y <- rbind(total_acc_x_train,total_acc_y_test)
total_acc_z <- rbind(total_acc_x_train,total_acc_z_test)

##########################################################################################
# 2 Extracts only the measurements on the mean and standard deviation for each measurement
##########################################################################################

########### Make a subset with the column of features to extract
# First group (5 sets of 6 columns each): 1 to 6     41 to 46    81 to 86    121 to 126    161 to 166
X11 <- subset(X, select= c(1,2,3,4,5,6))
X12 <- subset(X, select= c(41,42,43,44,45,46))
X13 <- subset(X, select= c(81,82,83,84,85,86))
X14 <- subset(X, select= c(121,122,123,124,125,126))
X15 <- subset(X, select= c(161,162,163,164,165,166))
# Second group(5 sets of 2 columns each): 201-202    214-215     227-228     240-241       253-254
X2 <- subset(X, select= c(201,202,214,215,227,228,240,241,253,254))
# Third group (3 sets of 6 columns each): 266 to 271 345 to 350  424 to 429
X31 <- subset(X, select= c(266,267,268,269,270,271))
X32 <- subset(X, select= c(345,346,347,348,349,350))
X33 <- subset(X, select= c(424,425,426,427,428,429))
# Fourth group(4 sets of 2 columns each): 503-504    516-517     529-530     542-543
X4 <- subset(X, select= c(503,504,516,517,529,530,542,543))

X_mean_std <- cbind(X11,X12,X13,X14,X15,X2,X31,X32,X33,X4)
remove(X11,X12,X13,X14,X15,X2,X31,X32,X33,X4)

###########################################################################
# 3  Uses descriptive activity names to name the activities in the data set
###########################################################################

# Convert numbers (integers) identifying the activities to factors
y$V1 <- as.character(y$V1)

# Replace each "factor number" for the corresponding string of the activity
y$V1[y$V1 == "1"] <- toString(activity_labels[[1,2]])
y$V1[y$V1 == "2"] <- toString(activity_labels[[2,2]])
y$V1[y$V1 == "3"] <- toString(activity_labels[[3,2]])
y$V1[y$V1 == "4"] <- toString(activity_labels[[4,2]])
y$V1[y$V1 == "5"] <- toString(activity_labels[[5,2]])
y$V1[y$V1 == "6"] <- toString(activity_labels[[6,2]])

#######################################################################
# 4.  Appropriately labels the data set with descriptive variable names
#######################################################################

# Loop over each column of X and rename it accordingly
for (i in seq_along(features[,1])) {
  colnames(X)[i] <- toString(features[[i,2]])
}

##############################################################################
# 5.  From the data set in step 4, create a second, independent tidy data set
#     with the average of each variable for each activity and each subject
##############################################################################
library("reshape2")

# Add to X the columns identifying the activity (y) and the volunteer id number (subject)
yX <- data.frame(subject,y,X)
colnames(yX)[1] <- "subject"
colnames(yX)[2] <- "activity"
colnames(yX)[3:563] <- names(X)

# Test example (small set of rows including 2 subjects and several activities)
yX1 <- yX[340:360,]
yX1_Melt <- melt(yX1,id=c("subject","activity"),measure.vars=names(yX1)[3:563])
yX1_avg <- dcast(yX1_Melt, subject + activity ~ names(yX1)[3:563],mean)
  
# For each subject and activity obtain the average (mean) of each variable -> yX_avg
yX_Melt <- melt(yX,id=c("subject","activity"),measure.vars=names(yX)[3:563])
yX_avg <- dcast(yX_Melt, subject + activity ~ names(yX)[3:563],mean)

########### Save tidy set to a file named "yX_avg.txt"
write.table(yX_avg,"./TIDY DATA/yX_avg.txt",row.names=FALSE,col.names=TRUE)
