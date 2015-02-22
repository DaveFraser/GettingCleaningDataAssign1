## Load dplyr library as it will be used for manipulating the resulting data frame
require(dplyr)

## Load in the test, train data, features header and activity type values

X_testData <- read.csv("UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "", strip.white = TRUE, colClasses="numeric") ## Load test data
Y_testData <- read.csv("UCI HAR Dataset/test/Y_test.txt", header= FALSE, colClasses="numeric") ## Load test activities
subjectTest <-read.csv("UCI HAR Dataset/test/subject_test.txt", header= FALSE) ## Load test subjects

X_trainData <- read.csv("UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "", strip.white = TRUE, colClasses="numeric") ## Load train data
Y_trainData <- read.csv("UCI HAR Dataset/train/Y_train.txt", header = FALSE, sep = "", strip.white = TRUE) ## Load train data
subjectTrain <-read.csv("UCI HAR Dataset/train/subject_train.txt", header= FALSE) ## Load train subjects

featuresHeader <- read.csv("UCI HAR Dataset/features.txt", header= FALSE, sep = "") ## load features headings 
activityLabels <- read.csv("UCI HAR Dataset/activity_labels.txt", header= FALSE, sep = "") ## load activity labels
colnames(activityLabels) <- c("activityIndex", "activity") ## create headers

## Merge the test data frames
X_testData["subject"] <- subjectTest ## Add Y data to 'subject' column
X_testData["dataSet"] <- "Test" ## Label all this data as 'test' data
X_testData["activityIndex"] <- Y_testData ## Add Activities data to 'activityIndex' column

## Merge the train data frames
X_trainData["subject"] <- subjectTrain ## Add Y data to 'subject' column
X_trainData["dataSet"] <- "Train" ## Label all this data as 'train' data
X_trainData["activityIndex"] <- Y_trainData ## Add Activities data to 'activityIndex' column

## Create one big data set from the test / train data frames
test_trainData <- rbind(X_testData, X_trainData) ##merge data frames

## Join activity names based on activityIndex
test_trainData <- full_join(test_trainData, activityLabels, by = "activityIndex")

## Label the columns and include  a fixed four digit numeric prefix to avoid duplicate column headers
colnames(test_trainData) <- c(paste(formatC(1:nrow(featuresHeader), width = 3, flag = 0), "", featuresHeader[,2], sep=""), "000subject", "000dataSet", "000activityIndex", "000activity") 

## Subset the data to include only subject, dataset (train or test), activity index, activity name, and std/mean values
##test_trainData <- select(test_trainData, matches("000subject"), matches("000dataSet"), matches("000activityIndex"), matches("000activity"), contains("std"), contains("mean"))     ##select only columns required

dataFilter <- (grepl("mean", colnames(test_trainData)) | 
                      grepl("std", colnames(test_trainData)) | 
                      grepl("000subject", colnames(test_trainData)) |
                      grepl("000dataSet", colnames(test_trainData)) |
                      grepl("000activityIndex", colnames(test_trainData)) |
                      grepl("000activity", colnames(test_trainData)))

test_trainData <- test_trainData[,dataFilter]

## Remove the now superfluous three digit prefix to clean up the headers and apply back to the data frame
dataNames <- substring(names(test_trainData),4)     ## remove prefix from column headers
colnames(test_trainData) <- dataNames

## Generate 2nd tidy data set

tidyData <- select(test_trainData, -activityIndex)     ##remove activity index for tidy data set
tidyData["dataType"] <- "Mean" ## A column which explains that the observations within this set are all (going to be) averages

tidyData %>% 
    select(subject, dataSet, dataType, activity, 1:79) ## rearrange so descriptions are up front
    group_by(subject, dataSet, dataType, activity) %>%  ##  Group by subect # / data set type / activity performed
    summarise_each(funs(mean)) %>% ## Generate means for each variable based on the above grouping
    arrange(subject, dataSet, dataType, activity) %>% ## Sort by subject / data set / activity type
    write.table(file="UCI_HAR_tidyData.txt", row.names = FALSE)  ## Write to a text file without row names
