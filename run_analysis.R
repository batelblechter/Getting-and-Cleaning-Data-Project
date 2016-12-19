##Getting and Cleaning Data Course Assignment

install.packages("reshape2")
library(reshape2)


#Load activity labels and features

activityL <- read.table("activity_labels.txt")
activityL[,2] <- as.character(activityL[,2])
features <- read.table("features.txt")
features[,2] <- as.character(features[,2])

#Extract data for mean and SD

featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
featuresWanted.names <- features[featuresWanted,2]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)

#Load train datasets

train <- read.table("X_train.txt")[featuresWanted]
trainActivities <- read.table("Y_train.txt")
trainSubjects <- read.table("subject_train.txt")

#combine train subjects and train activities

train <- cbind(trainSubjects, trainActivities, train)

#Load test datasets

test <- read.table("X_test.txt")[featuresWanted]
testActivities <- read.table("Y_test.txt")
testSubjects <- read.table("subject_test.txt")

#Combine test subjects and test activities

test <- cbind(testSubjects, testActivities, test)

#merge train and test datasets

allData <- rbind(train, test)

#assign labels

colnames(allData) <- c("subject", "activity", featuresWanted.names)

#change class of activities and subjects to factors

allData$activity <- factor(allData$activity, levels = activityL[,1], labels = activityL[,2])
allData$subject <- as.factor(allData$subject)

#Melt allData dataset and extract mean

allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

#save tidy table with means

write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)

