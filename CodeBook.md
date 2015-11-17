# CodeBook of the Course Project of Getting and Cleaning Data

# Introduction
The CodeBook is for data tidydata.csv. tidydata.csv is a tidy data generated from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
.

This codebook describe the variables of the tidydata

# Description variables
* **phase**: This variable refers to set the measure was taken
    * **train**: Train set
    * **test**: Test set
* **activity** This variable refers activity of volunteer(subject).
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING
* **subject** id of volunteer, participate 30 volunteers. Range of values id is 1 to 30.
## Next variables
The following names indicate six possible types of combinations , which will be explained below.
Measurement original are normalized and bounded within [-1,1]. The values of the variable are the mean
obtained from activity and subject and phase.

If Time _ ? _ ? _ ? _ ? _ ?, means that the measure is in unit time.

If Frequency _ ? _ ? _ ? _ ? _ ?, means that the measure is a unit of frequency domain signals.

If Time _ ? _ ? _ ? _ ? _ ?, means that the measure is in unit time.

If ? _ Body _ ? _ ? _ ? _ ?, refers to Body aceleration.

If ? _ Gravity _ ? _ ? _ ? _ ?, refers to Gravity aceleration.

If ? _ ? _ Acc _ ? _ ? _ ?, the measure was taken accelerometer sensor.

If ? _ ? _ Gyro _ ? _ ? _ ?, the measure was taken gyroscope sensor.

If ? _ ? _ ? _ Fil _ ? _ ?, measurement is calculed using low pass Butterworth filter with a corner frequency of 0.3 Hz.

If ? _ ? _ ? _ Jerkz _ ? _ ?, the measure is Jerk signals.

If ? _ ? _ ? _ ? _ X _ ?, the measurement refers to movement to direction X

If ? _ ? _ ? _ ? _ Y _ ?, the measurement refers to movement to direction Y

If ? _ ? _ ? _ ? _ Z _ ?, the measurement refers to movement to direction Z

If ? _ ? _ ? _ ? _ Mag _ ?, measurement than indicates magnitude of these three-dimensional signals
were calculated using the Euclidean norm.

If ? _ ? _ ? _ ? _ ? _ mean, Mean value of the signal

If ? _ ? _ ? _ ? _ ? _ std, Standard deviation


This information was obtained from features_info.txt file was obtained from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The names of variables are:

*Frecuency_Body_Acc_Fil_Mag_Mean

*Frecuency_Body_Acc_Fil_Mag_Std

*Frecuency_Body_Acc_Fil_X_Mean

*Frecuency_Body_Acc_Fil_X_Std

*Frecuency_Body_Acc_Fil_Y_Mean

*Frecuency_Body_Acc_Fil_Y_Std

*Frecuency_Body_Acc_Fil_Z_Mean

*Frecuency_Body_Acc_Fil_Z_Std

*Frecuency_Body_Acc_Jerk_Mag_Mean

*Frecuency_Body_Acc_Jerk_Mag_Std

*Frecuency_Body_Acc_Jerk_X_Mean

*Frecuency_Body_Acc_Jerk_X_Std

*Frecuency_Body_Acc_Jerk_Y_Mean

*Frecuency_Body_Acc_Jerk_Y_Std

*Frecuency_Body_Acc_Jerk_Z_Mean

*Frecuency_Body_Acc_Jerk_Z_Std

*Frecuency_Body_Gyro_Fil_Mag_Mean

*Frecuency_Body_Gyro_Fil_Mag_Std

*Frecuency_Body_Gyro_Fil_X_Mean

*Frecuency_Body_Gyro_Fil_X_Std

*Frecuency_Body_Gyro_Fil_Y_Mean

*Frecuency_Body_Gyro_Fil_Y_Std

*Frecuency_Body_Gyro_Fil_Z_Mean

*Frecuency_Body_Gyro_Fil_Z_Std

*Frecuency_Body_Gyro_Jerk_Mag_Mean

*Frecuency_Body_Gyro_Jerk_Mag_Std

*Time_Body_Acc_Fil_Mag_Mean

*Time_Body_Acc_Fil_Mag_Std

*Time_Body_Acc_Fil_X_Mean

*Time_Body_Acc_Fil_X_Std

*Time_Body_Acc_Fil_Y_Mean

*Time_Body_Acc_Fil_Y_Std

*Time_Body_Acc_Fil_Z_Mean

*Time_Body_Acc_Fil_Z_Std

*Time_Body_Acc_Jerk_Mag_Mean

*Time_Body_Acc_Jerk_Mag_Std

*Time_Body_Acc_Jerk_X_Mean

*Time_Body_Acc_Jerk_X_Std

*Time_Body_Acc_Jerk_Y_Mean

*Time_Body_Acc_Jerk_Y_Std

*Time_Body_Acc_Jerk_Z_Mean

*Time_Body_Acc_Jerk_Z_Std

*Time_Body_Gyro_Fil_Mag_Mean

*Time_Body_Gyro_Fil_Mag_Std

*Time_Body_Gyro_Fil_X_Mean

*Time_Body_Gyro_Fil_X_Std

*Time_Body_Gyro_Fil_Y_Mean

*Time_Body_Gyro_Fil_Y_Std

*Time_Body_Gyro_Fil_Z_Mean

*Time_Body_Gyro_Fil_Z_Std

*Time_Body_Gyro_Jerk_Mag_Mean

*Time_Body_Gyro_Jerk_Mag_Std

*Time_Body_Gyro_Jerk_X_Mean

*Time_Body_Gyro_Jerk_X_Std

*Time_Body_Gyro_Jerk_Y_Mean

*Time_Body_Gyro_Jerk_Y_Std

*Time_Body_Gyro_Jerk_Z_Mean

*Time_Body_Gyro_Jerk_Z_Std

*Time_Gravity_Acc_Fil_Mag_Mean

*Time_Gravity_Acc_Fil_Mag_Std

*Time_Gravity_Acc_Fil_X_Mean

*Time_Gravity_Acc_Fil_X_Std

*Time_Gravity_Acc_Fil_Y_Mean

*Time_Gravity_Acc_Fil_Y_Std

*Time_Gravity_Acc_Fil_Z_Mean

*Time_Gravity_Acc_Fil_Z_Std






