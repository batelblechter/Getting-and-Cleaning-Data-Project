Getting and Cleaning Data - Course Project
The R script (run.analysis.R) for the course project does the following: 
1. Downloads the dataset 
2. Loads the activity and feature info
3. Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
4. Loads the activity and subject data for each dataset, and merges those columns with the dataset
5. Merges the two datasets
6. Converts the activity and subject columns into factors
7. Creates a tidy dataset that consists of the mean values of each variable for each subject and activity pair.
8. The end result is shown in the file tidy.txt.

