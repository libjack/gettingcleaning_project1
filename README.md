# Getting and Cleaning Data Project

## run_analysis.R
This script generates the tidy data necessary
### Input necessary:
* Directory containing the data downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Actions performed:
* loads the feature names
* loads the activity labels
* loads the test data, activities and subjects
* Builds test data frame
* loads the train data, activities and subjects
* trims the data frames to just desired columns
* merge train and test data
* group by activity and subjects and calculates mean
