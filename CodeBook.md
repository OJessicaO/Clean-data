The data has been collected by combining the "test" and "train" datasets of the UCI HAR Data. The data reports results of experiments on 30 subjects(their identifiers being 1-30) doing 6 types of activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Measurements of linear and angular accelerations are reported in the dataset.

 Each record contains the subject identifier, the type of activity and the measurement of the accelerations and certain other features. So the first two columns give

 subject_id - A number between 1 and 30

 activity - Any out of the 6 - (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
 
 The rest of the columns give mean and standard deviation of the features explained as follows:
 
	"t" indicates "total" for e.g. tBodyAcc indicates that the variable gives value of the total body acceleration 
	
	"f" indicates "frequency domain signals" for Fourier Transformed applied measurements e.g fBodyAcc
	
	"X", "Y" or "Z" indicates the axial direction in case of linear variables
	
	"Jerk" and "Mag" indicate the jerk and magnitude respectively
	
So the rest of the variables are of the forms:
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


(the XYZ symbol indicates whether the axial directions are part of the measurement)

Out of many different variables reported for these measurements, only mean() and std() i.e average and standard deviation values have been included in the dataset.

From the raw data, the final data is reported after a transformation. Only the average value of a variable for a particular subject for a particular activity has been reported. So there is one value for a variable corresponding to every activity for every subject. 