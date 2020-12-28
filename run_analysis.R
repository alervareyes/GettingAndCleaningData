library(dplyr)

# read train data
x_train <- read.table("C://Users/nabreyes/Downloads/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("C://Users/nabreyes/Downloads/UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("C://Users/nabreyes/Downloads/UCI HAR Dataset/train/subject_train.txt")

# read test data
x_test <- read.table("C://Users/nabreyes/Downloads/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("C://Users/nabreyes/Downloads/UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("C://Users/nabreyes/Downloads/UCI HAR Dataset/test/subject_test.txt")

# read data description
varnames <- read.table("C://Users/nabreyes/Downloads/UCI HAR Dataset/features.txt")

# read activity labels
actlabels <- read.table("C://Users/nabreyes/Downloads/UCI HAR Dataset/activity_labels.txt")

# 1. Merges the training and the test sets to create one data set.
x_merge <- rbind(x_train, x_test)
y_merge <- rbind(y_train, y_test)
subject_merge <- rbind(subject_train, subject_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
select_var <- varnames[grep("mean\\(\\)|std\\(\\)",varnames[,2]),]
x_merge <- x_merge[,select_var[,1]]

# 3. Uses descriptive activity names to name the activities in the data set
colnames(y_merge) <- "activity"
y_merge$activitylabel <- factor(y_merge$activity, labels = as.character(actlabels[,2]))
activitylabel <- y_merge[,-1]

# 4. Appropriately labels the data set with descriptive variable names.
colnames(x_merge) <- varnames[select_var[,1],2]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
colnames(subject_merge) <- "subject"
total <- cbind(x_merge, activitylabel, subject_merge)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "C://Users/nabreyes/Downloads/UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
