## UCI HAR TIDY DATA SET: MEAN ACTIVITY VALUE BY SUBJECT
## CODEBOOK:

### *Data source:*
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

### *The summarised data set:*

From:
[http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names]

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

* This summarised, tidy data set merges data from the test and training data sets as described above and provides mean values by:
    * Subject
    * Data set
    * Activity

* Data files used include:
    * UCI HAR Dataset\train\X_train.txt (training dataset observations)
    * UCI HAR Dataset\train\Y_train.txt (training dataset subject indices)
    * UCI HAR Dataset\test\X_test.txt (training dataset observations)
    * UCI HAR Dataset\test\Y_test.txt (training dataset subject indices)

* Columns / observations are named using values from *UCI HAR Dataset\features.txt*
* Only mean and standard deviation observations are included from the original data sets

### *Each record contains:*

* An identifier of the subject who carried out the experiment (range 1-30)
* Which data set the subject was part of (test or training)
* The activity they performed:
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING

* A description of how the observation is being calculated (for this data set, every value is an average or mean)
    * For a given activity, the average triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
    * For a given activity, the average triaxial Angular velocity from the gyroscope. 

### *Description of observations:*

From: UCI HAR Dataset\features_info.txt

The features selected for the original database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### *Records:*

1. subject
2. dataSet
3. activity
4. dataType
5. tBodyAcc-mean()-X
6. tBodyAcc-mean()-Y
7. tBodyAcc-mean()-Z
8. tBodyAcc-std()-X
9. tBodyAcc-std()-Y
10. tBodyAcc-std()-Z
11. tGravityAcc-mean()-X
12. tGravityAcc-mean()-Y
13. tGravityAcc-mean()-Z
14. tGravityAcc-std()-X
15. tGravityAcc-std()-Y
16. tGravityAcc-std()-Z
17. tBodyAccJerk-mean()-X
18. tBodyAccJerk-mean()-Y
19. tBodyAccJerk-mean()-Z
20. tBodyAccJerk-std()-X
21. tBodyAccJerk-std()-Y
22. tBodyAccJerk-std()-Z
23. tBodyGyro-mean()-X
24. tBodyGyro-mean()-Y
25. tBodyGyro-mean()-Z
26. tBodyGyro-std()-X
27. tBodyGyro-std()-Y
28. tBodyGyro-std()-Z
29. tBodyGyroJerk-mean()-X
30. tBodyGyroJerk-mean()-Y
31. tBodyGyroJerk-mean()-Z
32. tBodyGyroJerk-std()-X
33. tBodyGyroJerk-std()-Y
34. tBodyGyroJerk-std()-Z
35. tBodyAccMag-mean()
36. tBodyAccMag-std()
37. tGravityAccMag-mean()
38. tGravityAccMag-std()
39. tBodyAccJerkMag-mean()
40. tBodyAccJerkMag-std()
41. tBodyGyroMag-mean()
42. tBodyGyroMag-std()
43. tBodyGyroJerkMag-mean()
44. tBodyGyroJerkMag-std()
45. fBodyAcc-mean()-X
46. fBodyAcc-mean()-Y
47. fBodyAcc-mean()-Z
48. fBodyAcc-std()-X
49. fBodyAcc-std()-Y
50. fBodyAcc-std()-Z
51. fBodyAcc-meanFreq()-X
52. fBodyAcc-meanFreq()-Y
53. fBodyAcc-meanFreq()-Z
54. fBodyAccJerk-mean()-X
55. fBodyAccJerk-mean()-Y
56. fBodyAccJerk-mean()-Z
57. fBodyAccJerk-std()-X
58. fBodyAccJerk-std()-Y
59. fBodyAccJerk-std()-Z
60. fBodyAccJerk-meanFreq()-X
61. fBodyAccJerk-meanFreq()-Y
62. fBodyAccJerk-meanFreq()-Z
63. fBodyGyro-mean()-X
64. fBodyGyro-mean()-Y
65. fBodyGyro-mean()-Z
66. fBodyGyro-std()-X
67. fBodyGyro-std()-Y
68. fBodyGyro-std()-Z
69. fBodyGyro-meanFreq()-X
70. fBodyGyro-meanFreq()-Y
71. fBodyGyro-meanFreq()-Z
72. fBodyAccMag-mean()
73. fBodyAccMag-std()
74. fBodyAccMag-meanFreq()
75. fBodyBodyAccJerkMag-mean()
76. fBodyBodyAccJerkMag-std()
77. fBodyBodyAccJerkMag-meanFreq()
78. fBodyBodyGyroMag-mean()
79. fBodyBodyGyroMag-std()
80. fBodyBodyGyroMag-meanFreq()
81. fBodyBodyGyroJerkMag-mean()
82. fBodyBodyGyroJerkMag-std()
83. fBodyBodyGyroJerkMag-meanFreq()
