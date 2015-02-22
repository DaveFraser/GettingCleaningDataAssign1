### GETTING & CLEANING DATA
### COURSE PROJECT
### *UCI HAR TIDY DATA SET*
#### README

Description: An R script named run_analysis.R which merges and tidies the following UCI HAR datasets:

Libraries required:
dplyr

Data description:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

Data files:
[http://archive.ics.uci.edu/ml/machine-learning-databases/00240/]

    * UCI HAR Dataset/train/X_train.txt (training dataset observations)
    * UCI HAR Dataset/train/Y_train.txt (training dataset activity indices)
    * UCI HAR Dataset/train/subject_train.txt (training dataset subject indices)
    * UCI HAR Dataset/test/X_test.txt (training dataset observations)
    * UCI HAR Dataset/test/Y_test.txt (training dataset activity indices)
    * UCI HAR Dataset/test/subject_test.txt (test dataset subject indices)
    * UCI HAR Dataset/features.txt (observation desciptions
    * UCI HAR Dataset/features.txtactivity_labels.txt (activity descriptions)

How run_analysis.R works:

Having loaded in the above text files using the , two data frames are created for the 'Test' and 'Train' data sets:

1.
- X_train.txt / X_test.txt contain the observations and are loaded as data frames
- subject_test.txt is loaded as a new column and is used to describe the test subjects
- A flag named 'dataSet' is inserted into each data set as a column (as 'test' or 'train', given they will later be merged)
- Y_train.txt / Y_test.txt are loaded as columns and are numeric values describing the various activities performed

2.
- The test / train data sets are merged
- The activity descriptions are added based on the numeric values provided using the dplyr 'full join' function
- Column names are added from data in the features.txt file, however this dataset contains duplicates so a unique three digit prefix is added to avoid later calculation issues

3.
To create the tidy data set, all but the mean and std observations must be removed, the best way I found to do this without inherently changing the underlying order of the columns was filtering using the grepl function, specifying that new columns added (subject, dataSet, activityIndex, activity) remain and and those containing either 'std' or 'mean', the original dataset is subsetted using this filter.
 
4.
Three digit prefixes are no longer required so these are removed and the column names are tidied up

5.
A new dataframe (tidyData) is created, cloning the original and a column inserted which describes new observations which are all averages.

6.
Final step is to:

    * Rearrange the columns within the data set so descriptive data is up front (subject ID, the data set the observations come from, the type of activity peformed, then all the observations)
    * Define the following groupings for the data set (by subject / by data set / by data type / by activity)
    * This is performed so that the summarise_each function understands at what level to summarise the data
    * Summarise_each is applied with the function mean to create averages for the grouping described above
    * The data is then sorted by subject / data type / activity
    * and is written to an output text file called "UCI_HAR_tidyData.txt"

Why is this tidy data:

* Each column contains a variable
* Each row is an observation
