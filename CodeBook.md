# Code Book of the Project

## Human Activity Recognition Using Smartphones Data Set [1] 

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The following experiment is a good example. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50 Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70 % of the volunteers was selected for generating the training data and 30 % the test data. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. These signals were sampled in fixed-width sliding windows of 2.56 sec and 50 % overlap (128 readings/window). Similarly, the sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). The gravitational force is assumed to have only low frequency components, therefore another filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. . 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a 
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

The dataset includes the following files:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

## The Tidy Data Set [1] 

This tidy data that can be used for later analysis using the Human Activity Recognition Using Smartphones Data Set.

The R script called run_analysis.R that does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Variables 

* "subject"

Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

* "type"

Identifies if the the subject was selected for generating the training data or the test data. Two values: "test" and "training". 

* "activity"   

Activvity permformed: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. 

* "(time domain) body acceleration" -XYZ -mean/std

Body acceleration signal obtained by subtracting the gravity from the total acceleration. These time domain signals were captured at a constant rate of 50 Hz. The units used for the accelerations are 'g's (gravity of earth -> 9.80665 m/seg2). The variables that were estimated from these signals are the mean value and the standard deviation: 

   - "(time domain) body acceleration mean X"                            
   - "(time domain) body acceleration mean Y"                            
   - "(time domain) body acceleration mean Z"                            
   - "(time domain) body acceleration std X"                             
   - "(time domain) body acceleration std Y"                             
   - "(time domain) body acceleration std Z"
   
* "(time domain) gravity acceleration" -XYZ -mean/std  
 
Gravity acceleration. These time domain signals were captured at a constant rate of 50 Hz. The units are 'g's (gravity of earth -> 9.80665 m/seg2). The variables that were estimated from these signals are the mean value
and the standard deviation: 
 
   - "(time domain) gravity acceleration mean X"                         
   - "(time domain) gravity acceleration mean Y"                         
   - "(time domain) gravity acceleration mean Z"                         
   - "(time domain) gravity acceleration std X"                          
   - "(time domain) gravity acceleration std Y"                          
   - "(time domain) gravity acceleration std Z"  
   
* "(time domain) body acceleration Jerk" -XYZ -mean/std     

The body linear acceleration was derived in time to obtain Jerk signals.

   - "(time domain) body acceleration Jerk mean X"                       
   - "(time domain) body acceleration Jerk mean Y"                       
   - "(time domain) body acceleration Jerk mean Z"                       
   - "(time domain) body acceleration Jerk std X"                        
   - "(time domain) body acceleration Jerk std Y"                        
   - "(time domain) body acceleration Jerk std Z"   
   
   
   
   - "(time domain) angular velocity mean X"                             
[23] "(time domain) angular velocity mean Y"                             
[24] "(time domain) angular velocity mean Z"                             
[25] "(time domain) angular velocity std X"                              
[26] "(time domain) angular velocity std Y"                              
[27] "(time domain) angular velocity std Z"                              
[28] "(time domain) angular velocity Jerk mean X"                        
[29] "(time domain) angular velocity Jerk mean Y"                        
[30] "(time domain) angular velocity Jerk mean Z"                        
[31] "(time domain) angular velocity Jerk std X"                         
[32] "(time domain) angular velocity Jerk std Y"                         
[33] "(time domain) angular velocity Jerk std Z"                         
[34] "(time domain) magnitude body acceleration mean"                    
[35] "(time domain) magnitude body acceleration std"                     
[36] "(time domain) magnitude gravity acceleration mean"                 
[37] "(time domain) magnitude gravity acceleration std"                  
[38] "(time domain) magnitude body acceleration Jerk mean"               
[39] "(time domain) magnitude body acceleration Jerk std"                
[40] "(time domain) magnitude angular velocity mean"                     
[41] "(time domain) magnitude angular velocity std"                      
[42] "(time domain) magnitude angular velocity Jerk mean"                
[43] "(time domain) magnitude angular velocity Jerk std"                 
[44] "(frequency domain) body acceleration mean X"                       
[45] "(frequency domain) body acceleration mean Y"                       
[46] "(frequency domain) body acceleration mean Z"                       
[47] "(frequency domain) body acceleration std X"                        
[48] "(frequency domain) body acceleration std Y"                        
[49] "(frequency domain) body acceleration std Z"                        
[50] "(frequency domain) body acceleration frequency mean  X"            
[51] "(frequency domain) body acceleration frequency mean  Y"            
[52] "(frequency domain) body acceleration frequency mean  Z"            
[53] "(frequency domain) body acceleration Jerk mean X"                  
[54] "(frequency domain) body acceleration Jerk mean Y"                  
[55] "(frequency domain) body acceleration Jerk mean Z"                  
[56] "(frequency domain) body acceleration Jerk std X"                   
[57] "(frequency domain) body acceleration Jerk std Y"                   
[58] "(frequency domain) body acceleration Jerk std Z"                   
[59] "(frequency domain) body acceleration Jerk frequency mean  X"       
[60] "(frequency domain) body acceleration Jerk frequency mean  Y"       
[61] "(frequency domain) body acceleration Jerk frequency mean  Z"       
[62] "(frequency domain) angular velocity mean X"                        
[63] "(frequency domain) angular velocity mean Y"                        
[64] "(frequency domain) angular velocity mean Z"                        
[65] "(frequency domain) angular velocity std X"                         
[66] "(frequency domain) angular velocity std Y"                         
[67] "(frequency domain) angular velocity std Z"                         
[68] "(frequency domain) angular velocity frequency mean  X"             
[69] "(frequency domain) angular velocity frequency mean  Y"             
[70] "(frequency domain) angular velocity frequency mean  Z"             
[71] "(frequency domain) magnitude body acceleration mean"               
[72] "(frequency domain) magnitude body acceleration std"                
[73] "(frequency domain) magnitude body acceleration frequency mean"     
[74] "(frequency domain) magnitude body acceleration Jerk mean"          
[75] "(frequency domain) magnitude body acceleration Jerk std"           
[76] "(frequency domain) magnitude body acceleration Jerk frequency mean"
[77] "(frequency domain) magnitude angular velocity mean"                
[78] "(frequency domain) magnitude angular velocity std"                 
[79] "(frequency domain) magnitude angular velocity frequency mean"      
[80] "(frequency domain) magnitude angular velocity Jerk mean"           
[81] "(frequency domain) magnitude angular velocity Jerk std"            
[82] "(frequency domain) magnitude angular velocity Jerk frequency mean" 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
