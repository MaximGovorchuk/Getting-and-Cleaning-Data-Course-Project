# Code book

## Initial data sets:

* `x_train` - training set
* `y_train` - training labels
* `subject_train` - training subject who performed the activity
* `x_test` - test set
* `y_test` - test labels
* `subject_test` - test subject who performed the activity

## Merged datasets:

* `subject` - training and test subjects
* `activity` - training and test activities/labels
* `features` - training and test sets/features
* `complete_data` - combined merged training and test data sets

## Dataset with columns of interest:

* `selected_columns` - ActivityId, SubjectId, mean and standard deviation related columns

## Labeled dataset

* `complete_labeled_data` - `selected_columns` dataset with added labels for activities

## Descriptive strategies:

### BodyBody -> Body
### Extending abbreviations
* Acc -> Accelerometer
* Gyro -> Gyroscope
* Mag -> Magnitude
* Everything which starts with t* -> Time*
* Freq -> Frequency
* Everything which starts with f* -> Frequency*
### Minor cleanup
* Remoting of brackets
* Replacing dashes with single space
### Capitalizing/upper casing the rest
* mean -> Mean
* std -> STD

## Tidy data set:

### Identifiers
* `SubjectId` - Identifier of the subject
* `ActivityId` - The type of activity performed
### Measurements
TimeBodyAccelerometer Mean X

TimeBodyAccelerometer Mean Y

TimeBodyAccelerometer Mean Z

TimeBodyAccelerometer STD X

TimeBodyAccelerometer STD Y

TimeBodyAccelerometer STD Z

TimeGravityAccelerometer Mean X

TimeGravityAccelerometer Mean Y

TimeGravityAccelerometer Mean Z

TimeGravityAccelerometer STD X

TimeGravityAccelerometer STD Y

TimeGravityAccelerometer STD Z

TimeBodyAccelerometerJerk Mean X

TimeBodyAccelerometerJerk Mean Y

TimeBodyAccelerometerJerk Mean Z

TimeBodyAccelerometerJerk STD X

TimeBodyAccelerometerJerk STD Y

TimeBodyAccelerometerJerk STD Z

TimeBodyGyroscope Mean X

TimeBodyGyroscope Mean Y

TimeBodyGyroscope Mean Z

TimeBodyGyroscope STD X

TimeBodyGyroscope STD Y

TimeBodyGyroscope STD Z

TimeBodyGyroscopeJerk Mean X

TimeBodyGyroscopeJerk Mean Y

TimeBodyGyroscopeJerk Mean Z

TimeBodyGyroscopeJerk STD X

TimeBodyGyroscopeJerk STD Y

TimeBodyGyroscopeJerk STD Z

TimeBodyAccelerometerMagnitude Mean

TimeBodyAccelerometerMagnitude STD

TimeGravityAccelerometerMagnitude Mean

TimeGravityAccelerometerMagnitude STD

TimeBodyAccelerometerJerkMagnitude Mean

TimeBodyAccelerometerJerkMagnitude STD

TimeBodyGyroscopeMagnitude Mean

TimeBodyGyroscopeMagnitude STD

TimeBodyGyroscopeJerkMagnitude Mean

TimeBodyGyroscopeJerkMagnitude STD

FrequencyBodyAccelerometer Mean X

FrequencyBodyAccelerometer Mean Y

FrequencyBodyAccelerometer Mean Z

FrequencyBodyAccelerometer STD X

FrequencyBodyAccelerometer STD Y

FrequencyBodyAccelerometer STD Z

FrequencyBodyAccelerometer MeanFrequency X

FrequencyBodyAccelerometer MeanFrequency Y

FrequencyBodyAccelerometer MeanFrequency Z

FrequencyBodyAccelerometerJerk Mean X

FrequencyBodyAccelerometerJerk Mean Y

FrequencyBodyAccelerometerJerk Mean Z

FrequencyBodyAccelerometerJerk STD X

FrequencyBodyAccelerometerJerk STD Y

FrequencyBodyAccelerometerJerk STD Z

FrequencyBodyAccelerometerJerk MeanFrequency X

FrequencyBodyAccelerometerJerk MeanFrequency Y

FrequencyBodyAccelerometerJerk MeanFrequency Z

FrequencyBodyGyroscope Mean X

FrequencyBodyGyroscope Mean Y

FrequencyBodyGyroscope Mean Z

FrequencyBodyGyroscope STD X

FrequencyBodyGyroscope STD Y

FrequencyBodyGyroscope STD Z

FrequencyBodyGyroscope MeanFrequency X

FrequencyBodyGyroscope MeanFrequency Y

FrequencyBodyGyroscope MeanFrequency Z

FrequencyBodyAccelerometerMagnitude Mean

FrequencyBodyAccelerometerMagnitude STD

FrequencyBodyAccelerometerMagnitude MeanFrequency

FrequencyBodyAccelerometerJerkMagnitude Mean

FrequencyBodyAccelerometerJerkMagnitude STD

FrequencyBodyAccelerometerJerkMagnitude MeanFrequency

FrequencyBodyGyroscopeMagnitude Mean

FrequencyBodyGyroscopeMagnitude STD

FrequencyBodyGyroscopeMagnitude MeanFrequency

FrequencyBodyGyroscopeJerkMagnitude Mean

FrequencyBodyGyroscopeJerkMagnitude STD

FrequencyBodyGyroscopeJerkMagnitude MeanFrequency

### ActivityType:
* `WALKING` (value `1`): subject was walking
* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase
* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase
* `SITTING` (value `4`): subject was sitting
* `STANDING` (value `5`): subject was standing
* `LAYING` (value `6`): subject was laying down
