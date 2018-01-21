install.packages("reshape2")

#Set your Working Directory First
setwd("E:/OFFICE/DOST Data Science Coursera/DOST - Coursera Data Science - 03 Getting and Cleaning the Data/Week 4/Week 4 Project/Getting-and-Cleaning-Data-Course-Project")

#-----------------------
#|0. PREPARING THE DATA|
#-----------------------

# Downloading Human Activity Recognition(HAR) Database from UCI Machine Learning Repository
        if(!file.exists("./data")){dir.create("./data")}
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip dataSet to /data directory
        unzip(zipfile="./data/Dataset.zip",exdir="./data")
        
#-----------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set|
#-----------------------------------------------------------------

#------------------------------Read data in the Train folder
        subjectTrain<-read.table("./data/UCI HAR Dataset/Train/subject_train.txt") 
        xTrain<-read.table("./data/UCI HAR Dataset/Train/X_train.txt")
        yTrain<-read.table("./data/UCI HAR Dataset/Train/y_train.txt")

#------------------------------Combine all three train dataframes by columns in OneDataTrain dataframe
        OneDataTrain<-cbind(subjectTrain,xTrain,yTrain)


#------------------------------Read data in Test folder
        subjectTest<-read.table("./data/UCI HAR Dataset/Test/subject_test.txt")
        xTest<-read.table("./data/UCI HAR Dataset/Test/X_test.txt")
        yTest<-read.table("./data/UCI HAR Dataset/Test/y_test.txt")

#------------------------------Combine all three test dataframes by columns in OneDataTest dataframe
        OneDataTest<-cbind(subjectTest,xTest,yTest)


#------------------------------Append OneDataTrain and OneDataTest - combine them by rows in big dataframe named as OneDataSet
        OneDataSet<-rbind(OneDataTrain,OneDataTest)

#------------------------------Read the features.txt  file with labels for the measures from UCI HAR Dataset folder
        FeatureName<-read.table("./data/UCI HAR Dataset/features.txt")

#------------------------------Rename the columns in Data dataframe. Use dim(labels) to view which names to be rename
        names(OneDataSet)[1]<-"SubjectID"
        names(OneDataSet)[563]<-"Activity"
        names(OneDataSet)[2:562]<- as.character(FeatureName[ ,2])
        names(OneDataSet)
        
#------------------------------------------------------------------------------------------
# 2.Extracts only the measurements on the mean and standard deviation for each measurement|
#------------------------------------------------------------------------------------------
        
#------------------------------Extract the measurements on the mean and standard deviation for each measurement together with the SubjectID and activity column
        OneDataSetTidy<-OneDataSet[,grepl("mean\\(\\)|std\\(\\)|SubjectID|Activity",names(OneDataSet))]
 
#--------------------------------------------------------------------------
# 3.Use descriptive activity names to name the activities in the data set|
#--------------------------------------------------------------------------
        
#------------------------------Read activity_labels.txt file from UCI HAR Dataset Folder
        activityLabels<-read.table("./Data/UCI HAR Dataset/activity_labels.txt")

#------------------------------Generating new variable activityName which will store the activity labels
        OneDataSetTidy$activityName<-rep(NA,nrow(OneDataSetTidy))

#------------------------------Assigning the activity labels to activityName variable
        for (i in 1:length(activityLabels[,2])) 
            {                       
              OneDataSetTidy$activityName[OneDataSetTidy$Activity==i]<-as.character(activityLabels[i,2])
            }
#------------------------------Transforming the variable into factor 
        OneDataSetTidy$activityName<-as.character(OneDataSetTidy$activityName)        

#-------------------------------------------------------------------
# 4. Appropriately label the data set with descriptive column names|
#-------------------------------------------------------------------

#------------------------------Clean the names of the variables in dataTidy dataframe
        anyDuplicated(names(OneDataSetTidy))#There are no duplicates names in the columns in the dataframe

#------------------------------Eliminate the special characters in labels like (,),- e.t.c
        names(OneDataSetTidy) <- gsub("\\(", "", names(OneDataSetTidy))
        names(OneDataSetTidy) <- gsub("\\)", "", names(OneDataSetTidy))
        names(OneDataSetTidy) <-gsub("-","",names(OneDataSetTidy))

#------------------------------All lower case in the labels
        names(OneDataSetTidy)<-tolower(names(OneDataSetTidy))

#------------------------------Save the dataframe-tidy data as a text file 
        write.table(OneDataSetTidy,"FirstTidy.txt", row.names = FALSE)   

#-------------------------------------------------------------------------------------------------------------------
#5. Create a second, independent tidy data set with the average of each variable for each activity and each subject|
#-------------------------------------------------------------------------------------------------------------------
        

        library(reshape2)

#------------------------------Define the vector of ID variables, since we have done string manipulation, "activityName" will be set to all lowercases as a "activityname"        
        idVars<-c("activity","activityname","subjectid")

#------------------------------Define the vector of measured variables        
        measures<-names(OneDataSetTidy)[2:67]

#------------------------------Melt OneDataSetTidy dataframe into form suitable for casting
        melted<-melt(OneDataSetTidy,idVars,measure.vars=measures) 
        
#------------------------------Recast mealted data computing avarage of measures
        SecondTidy<-dcast(melted, activityname + subjectid ~ variable, mean)

#------------------------------Save the dataframe of averaged measures by activity and subject into txt file        
        write.table(SecondTidy,"SecondTidy.txt" ,row.names = FALSE)   
