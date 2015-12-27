# assumes data in local directory
dataDir <- "./UCI HAR Dataset/"

# labels for columns and factor info for activity
features <- fread(paste0(dataDir, "features.txt"))
activity_labels <- fread(paste0(dataDir,"activity_labels.txt"))

# test data
testDT <- fread(paste0(dataDir,"test/X_test.txt"))
# test activities
testActivities <- fread(paste0(dataDir,"test/y_test.txt"))
# test subjects
testSubjects <- fread(paste0(dataDir,"test/subject_test.txt"))

# set names from features data
names(testDT) <- features$V2
# add activity as factor based on labels
testDT$activity <- factor(testActivities$V1, activity_labels$V1, activity_labels$V2)
# add subject as column from loaded subjects
testDT$subject <- testSubjects$V1

# trim test set to just what is needed
testDT <- select(testDT, contains("mean()"),contains("std()"),activity,subject)

# training data
trainDT <- fread(paste0(dataDir,"train/X_train.txt"))
# training activities
trainActivities <- fread(paste0(dataDir,"train/y_train.txt"))
# training subjects
trainSubjects <- fread(paste0(dataDir,"train/subject_train.txt"))

# set names from features data
names(trainDT) <- features$V2
# add activity as factor based on labels
trainDT$activity <- factor(trainActivities$V1,activity_labels$V1, activity_labels$V2)
# add subject as column from loaded subjects
trainDT$subject <- trainSubjects$V1

# trim train set to just what is needed
trainDT <- select(trainDT, contains("mean()"),contains("std()"),activity,subject)


# merge all data all column names should match
mergeDT  <- union(testDT,trainDT)

# group by subject/activity and calculate mean
finalDT <- mergeDT %>% group_by(subject, activity) %>% summarise_each(funs(mean))

