# Codebook for Week 4 Assignment
This Codebook is created for the R script run_analysis.R that is executed for the data preparation of the dataset that was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip cleaned dataset tidydata.txt


### Tidy data variables
The tidy data contains 180 rows and 68 columns. Each row has mean and standard deviation variables for each subject and each activity.
The mean and standard deviation variables from the dataset were the ones kept for the tidy set.

* mean(): Mean
* std(): Standard deviation

### The data were averaged based on subject and activity group.

Subject column is numbered from 1 to 30 while there are 6 activities listed below.
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

### variable units
Activity variable is factor type.
Subject variable is integer type.
All the other variables are numeric type.
