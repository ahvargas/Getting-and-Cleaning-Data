######################################################################
#1. Merges the training and the test sets to create one data set.
######################################################################

##The path of the files
path <- file.path("UCI HAR Dataset")

########## Subject

## Read the subject Train and Test
subjectTrain <- read.table(file.path(path, "train", "subject_train.txt"))
subjectTest  <- read.table(file.path(path, "test", "subject_test.txt"))

#Concatenate rows subject train and subject test
subject <- rbind(subjectTrain,subjectTest)

# Rename column  change "V1" to "subject"
# http://www.cookbook-r.com/Manipulating_data/Renaming_columns_in_a_data_frame/
names(subject)[names(subject)=="V1"] <- "subject"


##########Activity

#Read the activity data
activityTrain <- read.table(file.path(path, "train", "Y_train.txt"))
activityTest  <- read.table(file.path(path, "test" , "Y_test.txt" ))

#Concatenate activity and test
activity <- rbind(activityTrain,activityTest)


#Rename column by name: change "V1" to "activity"
names(activity)[names(activity)=="V1"] <- "activity"


##########Sensor

train <- read.table(file.path(path, "train", "X_train.txt"))
test  <- read.table(file.path(path, "test" , "X_test.txt" ))

#Concatenate rows for train and test sensor
sensorData <- rbind(train, test)


##########Making the large data set

#Concatenate data of subject and activity
subjectAndActivity <- cbind(subject, activity)
#Concatenate data of subject and activity
all <- cbind(subjectAndActivity, sensorData)


######################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
######################################################################

##########Feature
allFeatures <- read.table(file.path(path,"features.txt"),stringsAsFactors=FALSE)

#Rename column by name: change "V1" to "activity"
names(allFeatures)[names(allFeatures)=="V1"] <- "num"
names(allFeatures)[names(allFeatures)=="V2"] <- "name"

## Subset the data set for features like mean and standard deviation (std)
##http://stackoverflow.com/questions/13043928/selecting-rows-where-a-column-has-a-string-like-hsa-partial-string-match
meanCols <- grep("std", allFeatures$name)
stdCols <- grep("mean", allFeatures$name)
interestingFeatures <- allFeatures[sort(c(meanCols,stdCols)),]

#Add a new column to the data frame
#This column will be used to rename columnes V1 V2 in the all data set
##http://www.cookbook-r.com/Manipulating_data/Adding_and_removing_columns_from_a_data_frame/

interestingFeatures$pivot <- paste0("V",interestingFeatures$num)

##Now remove the boring features for the big dataset
interesting <- all[,c("subject","activity",interestingFeatures$pivot)]

##Rename the columns for the interesting dataset
# http://stackoverflow.com/questions/6081439/changing-column-names-of-a-data-frame-in-r
colnames(interesting) <- c("subject","activity",interestingFeatures$name)

######################################################################
# 3. Uses descriptive activity names to name the activities in the data set
######################################################################


#Read the activity names
activityNames  <- read.table(file.path(path, "activity_labels.txt"))
#Fancy colnames
colnames(activityNames) <- c("num","name")
#Merge the names columns
interesting <- merge(interesting,activityNames,by.x = "activity",by.y = "num")
##Set the correct order
interesting$activity <-interesting$name 
##Remove the duplicate
interesting$name <-NULL

######################################################################
# 4. Appropriately labels the data set with descriptive variable names.
######################################################################
#http://www.statmethods.net/management/reshape.html
library(reshape)

##This function takes 4 params
# str -> The  string to be matched
# exp -> The grep expression
# a -> This function yields a if exp is matched and b otherwise
checkExpression <- function(str,exp,a,b){
  result <- grep(exp,str)
  if(!is.null(result) && length(result) == 1  && result == 1){
   a
  }else{
    b
  }
  
}

##This function transform the name of the column to a more human readble format
columnRename <- function(name){
  ##Activity and subject columns
  ## dont need to rename
  if(name =="activity"){
    return ("activity")
  }
  if(name =="subject"){
    return ("subject")
  }
  
  ##Time and Frequency
  ##Check if the name starts with f (Frequency or Time)
  newName <- checkExpression(name,"^f","Frequency","Time")
  ##Rename the cryptic names...
  newName <- paste0(newName,checkExpression(name,"Body"," Body",""))
  newName <- paste0(newName,checkExpression(name,"Gravity"," Gravity",""))
  newName <- paste0(newName,checkExpression(name,"Acc"," Acceleration",""))
  newName <- paste0(newName,checkExpression(name,"Gyro"," Gyroscope",""))
  newName <- paste0(newName,checkExpression(name,"Jerk"," Jerk",""))
  newName <- paste0(newName,checkExpression(name,"Mag"," Magnetic",""))
  newName <- paste0(newName,checkExpression(name,"mean"," Mean",""))
  newName <- paste0(newName,checkExpression(name,"std"," Standard Deviation",""))
  newName <- paste0(newName,checkExpression(name,"-X"," X",""))
  newName <- paste0(newName,checkExpression(name,"-Y"," Y",""))
  newName <- paste0(newName,checkExpression(name,"-Z"," Z",""))
  
  newName
}

#Rename the columns
colnames(interesting) <- mapply(columnRename,names(interesting), SIMPLIFY = T)

######################################################################
#5.- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
######################################################################

#Melt the data in a large data set
large <- melt(interesting,id.vars = c("activity","subject"))
##Average of each variable for each activity and each subject.
#Answer 3
##http://stackoverflow.com/questions/20279643/average-of-values-in-columns-in-dataframe
library(plyr)
tidy <- ddply(large, .(activity,subject,variable), summarize, mean = mean(value))


##Finally write the results

write.table(tidy, "tydy.txt")


