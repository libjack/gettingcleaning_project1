## CodeBook for Getting and Cleaning Data Project

The data downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
contains accelerometer data, for several features, collected from individuals performing six activities: (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

The list of features is loaded to be used for column names in loaded data.

The list of activity names is loaded to be used as factors for activities' lists.

The data is split into two directories, Training and Test. Within each directory, the following data will be loaded:
* list of subjects
* list of activities
* list of vectors containing collected data corresponding to set of features

The list of each of the loaded files contains the same number of observations.

The following operations are performed for both the train and test data
* Build a data frame with loaded data
* assign names based on list of features loaded
* add subjects as column
* add activities as column using factor names from loaded activity names
* trim the data frame by selecting just the mean std deviation features, as well as the  subject and activity columns

Build a merged data frame from the train and test data. This is simply a union of all data since each data frame has the same set of column names

The final data frame groups the merged data by subject and activity and calculates the average of feature.
