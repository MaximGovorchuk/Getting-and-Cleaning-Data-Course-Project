code_book_file <- "CodeBook.md"
cb <- function(...) {
  cat(..., "\n", file=code_book_file, append=TRUE, sep="")
}
file.remove(code_book_file)

cb("# Code book")

# 0. Download and unpack zip if samsung data folder is absent

if (!dir.exists("UCI HAR Dataset")) {
	data_set_file_name <- "dataset.zip"

	if (!file.exists(data_set_file_name)) {
		download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", data_set_file_name)
	}

	unzip(data_set_file_name)
}

# 1. Merges the training and the test sets to create one data set

cb("\n## Initial data sets:\n")

# Loading training set
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

cb("* `x_train` - training set")
cb("* `y_train` - training labels")
cb("* `subject_train` - training subject who performed the activity")

# Loading test set
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

cb("* `x_test` - test set")
cb("* `y_test` - test labels")
cb("* `subject_test` - test subject who performed the activity")

# Merging corresponding datasets
subject <- rbind(subject_train, subject_test)
activity <- rbind(y_train, y_test)
features <- rbind(x_train, x_test)

cb("\n## Merged datasets:\n")
cb("* `subject` - training and test subjects")
cb("* `activity` - training and test activities/labels")
cb("* `features` - training and test sets/features")

# Reading feature names
feature_names <- read.table('./UCI HAR Dataset/features.txt')

# Assigning column names
colnames(features) <- feature_names[,2]
colnames(activity) <- "ActivityId"
colnames(subject) <- "SubjectId"

# Merging data into complete set
complete_data <- cbind(features,activity,subject)

cb("* `complete_data` - combined merged training and test data sets")


# 2. Extracts only the measurements on the mean and standard deviation for each measurement

col_names <- colnames(complete_data)

columns_to_choose <- (grepl("ActivityId" , col_names) | 
	                  grepl("SubjectId" , col_names) | 
	                  grepl("mean.." , col_names) | 
	                  grepl("std.." , col_names) 
	                 )

selected_columns <- complete_data[, columns_to_choose == TRUE]

cb("\n## Dataset with columns of interest:\n")
cb("* `selected_columns` - ActivityId, SubjectId, mean and standard deviation related columns")


# 3. Uses descriptive activity names to name the activities in the data set

activity_labels = read.table('./UCI HAR Dataset/activity_labels.txt')
colnames(activity_labels) <- c('ActivityId','ActivityType')

complete_labeled_data <- merge(selected_columns, activity_labels,
                               by='ActivityId',
                               all.x=TRUE)
cb("\n## Labeled dataset\n")
cb("* `complete_labeled_data` - `selected_columns` dataset with added labels for activities")


# 4. Appropriately labels the data set with descriptive variable names

cb("\n## Descriptive strategies:\n")

cb("### BodyBody -> Body")
names(complete_labeled_data)<-gsub("BodyBody", "Body", names(complete_labeled_data))

cb("### Extending abbreviations")
cb("* Acc -> Accelerometer")
names(complete_labeled_data)<-gsub("Acc", "Accelerometer", names(complete_labeled_data))
cb("* Gyro -> Gyroscope")
names(complete_labeled_data)<-gsub("Gyro", "Gyroscope", names(complete_labeled_data))
cb("* Mag -> Magnitude")
names(complete_labeled_data)<-gsub("Mag", "Magnitude", names(complete_labeled_data))
cb("* Everything which starts with t* -> Time*")
names(complete_labeled_data)<-gsub("^t", "Time", names(complete_labeled_data))
cb("* Freq -> Frequency")
names(complete_labeled_data)<-gsub("Freq", "Frequency", names(complete_labeled_data), ignore.case = TRUE)
cb("* Everything which starts with f* -> Frequency*")
names(complete_labeled_data)<-gsub("^f", "Frequency", names(complete_labeled_data))

cb("### Minor cleanup")
cb("* Remoting of brackets")
names(complete_labeled_data)<-gsub("\\(|\\)", "", names(complete_labeled_data))
cb("* Replacing dashes with single space")
names(complete_labeled_data)<-gsub("\\-", " ", names(complete_labeled_data))

cb("### Capitalizing/upper casing the rest")
cb("* mean -> Mean")
names(complete_labeled_data)<-gsub("mean", "Mean", names(complete_labeled_data), ignore.case = TRUE)
cb("* std -> STD")
names(complete_labeled_data)<-gsub("std", "STD", names(complete_labeled_data), ignore.case = TRUE)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject"

tidy_data_set <- aggregate(. ~SubjectId + ActivityId, complete_labeled_data, mean)
tidy_data_set <- tidy_data_set[order(tidy_data_set$SubjectId, tidy_data_set$ActivityId),]

cb("\n## Tidy data set:\n")

cb("### Identifiers")

cb("* `SubjectId` - Identifier of the subject")
cb("* `ActivityId` - The type of activity performed")

cb("### Measurements")

col_names <- colnames(tidy_data_set)

columns_to_choose <- (grepl("ActivityId" , col_names) | 
	                  grepl("SubjectId" , col_names) | 
	                  grepl("ActivityType" , col_names)
	                 )

for(c in col_names[columns_to_choose == FALSE]) {
	cb(c)
	cb("")
}

cb("### ActivityType:")

cb("* `WALKING` (value `1`): subject was walking")
cb("* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase")
cb("* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase")
cb("* `SITTING` (value `4`): subject was sitting")
cb("* `STANDING` (value `5`): subject was standing")
cb("* `LAYING` (value `6`): subject was laying down")

write.table(tidy_data_set, "tidy_data_set.txt", row.name=FALSE)
