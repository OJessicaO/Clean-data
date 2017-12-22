library(dplyr)
# Read raw test and train files and set the feature
# name to each column

    test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="", 
                 header=FALSE, stringsAsFactors = FALSE)
    train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="", 
                        header=FALSE, stringsAsFactors = FALSE)
    feat <- read.table("./UCI HAR Dataset/features.txt", 
                             sep="", header = FALSE)
    colnames(test) <- feat[,2]
    colnames(train) <- feat[,2]

# Add columns for activity and subject id 
# for test
    
    act <- read.table("./UCI HAR Dataset/test/y_test.txt", sep="",
                      header = FALSE, stringsAsFactors = FALSE)
    lab <- read.table("./UCI HAR Dataset/activity_labels.txt", sep="",
                      header = FALSE,stringsAsFactors = FALSE)
       for(i in 1:6){
          act[which(act==lab[i,1]),] = lab[i,2]
       }
    test <-cbind(act, test)
    names(test)[1] = "activity"
    
    sub <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep="",
                      header = FALSE, stringsAsFactors = FALSE)
    test <-cbind(sub, test)
    names(test)[1] = "subject_id"
    
# for train
    
    act <- read.table("./UCI HAR Dataset/train/y_train.txt", sep="",
                      header = FALSE, stringsAsFactors = FALSE)
    for(i in 1:6){
      act[which(act==lab[i,1]),] = lab[i,2]
    }
    train <-cbind(act, train)
    names(train)[1] = "activity"
    
    sub <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep="",
                      header = FALSE, stringsAsFactors = FALSE)
    train <-cbind(sub, train)
    names(train)[1] = "subject_id"

# Merge test and train
    full <- rbind(test, train)
    vec <- grep("mean\\(\\)|std\\(\\)", feat$V2)
    vec <- vec+2
    vec <- c(1,2,vec)
    full <- full[,vec]

#Group by subjects and activities and keep only means 
# of all variables by each group
    
    full <- group_by(full, subject_id, activity)
    full <- summarise_all(full, mean)
    