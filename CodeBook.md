## Submission for Getting and Cleaning Data Course

Function does not accept any parameters, it assume, that data folder is in working directory and that dplyr package is installed.


### Code and data transformations

First 3 lines read train data and assign them to 'data' variable. In second and third line it is done by binding new columns.

Next 3 lines does the same as above, but with test data, and 'data1' variable, accordingly.

Next, function is binding that 2 data sets to one variable: 'data'. At that point function read all numeric data needed to perform analysis.

In line 8 & 9, function is reading names for data labels and assigning them to columns. Labels "Volunteer" & "Activities" are added as first two column names.

In next line function drops all columns, that are neither std nor mean. First two are also preserved, as they contain information about Volunteer & Activities.

In line 11 & 12 function should assign activity names (in almost the same way it assigned column names), but I prevented 12th line from executing. I gave warning when function executed mean() function in 17th line. Labels are assigned in 18th line.

Next function creates NULL 'tidy_data' variable, and loads 'dplyr' package.

Lines 15-17 are making tidy data set. First for loop is for volunteers (1 to 30), next one is for activities (1 to 6). In 17th line parts of data are extracted from 'data' variable (for each volunteer and each activity), and mean for each column is counted (in this part summarise_each() function gave NA, when activities were counted; leaving them in integer value saved some warning messages, as well as writing some additional lines of code).

In line 18 function is assigning activity names in column Activities.

The last line returns tidied up data set.


### The original data (from original features_info.txt file):

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."


### The processed data:

All data comes from transformation of original data. Average of each mean and standard deviation variable for each activity and each subject were counted.


### The variables:

Volunteer
	Subject numbers: 1:30

Activities
	Names of activities (6): (WALKING
, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS
, SITTING, STANDING
, LAYING
)


tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
	Mean and Standard deviation of X, Y, Z of body acceleration signals: -1..1

tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
	Mean and Standard deviation of X, Y, Z of gravity acceleration signals: -1..1

tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
	Mean and Standard deviation of X, Y, Z of body linear acceleration Jerk signals: -1..1

tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
	Mean and Standard deviation of X, Y, Z of body angular velocity signals: -1..1

tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
	Mean and Standard deviation of X, Y, Z of body angular velocity Jerk signals: -1..1

tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
	Mean and Standard deviation of magnitude of these three-dimensional signals calculated using the Euclidean norm: -1..1

fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAcc-meanFreq()-X
fBodyAcc-meanFreq()-Y
fBodyAcc-meanFreq()-Z
	Mean, Standard deviation and Mean Frequency of X, Y, Z of Fast Fourier Transform of body acceleration signals: -1..1

fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyAccJerk-meanFreq()-X
fBodyAccJerk-meanFreq()-Y
fBodyAccJerk-meanFreq()-Z
	Mean, Standard deviation and Mean Frequency of X, Y, Z of Fast Fourier Transform of body linear acceleration Jerk signals: -1..1

fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyGyro-meanFreq()-X
fBodyGyro-meanFreq()-Y
fBodyGyro-meanFreq()-Z
	Mean, Standard deviation and Mean Frequency of X, Y, Z of Fast Fourier Transform of body angular velocity signals: -1..1

fBodyAccMag-mean()
fBodyAccMag-std()
fBodyAccMag-meanFreq()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyAccJerkMag-meanFreq() 
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std() 
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
	Mean, Standard deviation and Mean Frequency of Fast Fourier Transform of magnitude of these three-dimensional signals calculated using the Euclidean norm: -1..1

angle(tBodyAccJerkMean),gravityMean)
angle(tBodyGyroMean,gravityMean)
angle(tBodyGyroJerkMean,gravityMean)
angle(X,gravityMean)
angle(Y,gravityMean)
angle(Z,gravityMean)
	Mean and of angles between vectors: -1..1
