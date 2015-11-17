# STEP 1: Merges the training and the test sets to create one data set.
library(rhdf5)
library(dplyr)

# Create the function which for read txt and save to hdf5 file, because reading 
# for text plain, consume huge memory and slowly my system
# I did step in file import step to avoid saturating the memory
# subsequently stored in the file hdf5 to return to invoke if it becomes
# to run the script and not consumption long process .
savetxt = function(namedataset, funread="csv", nrow=100, ...) {
    namefileshdf5 = paste(phase, namedataset, sep="/")
    if(namefileshdf5 %in% datasetinh5$namehdf5) {
        dataset = h5read(fileh5, namefileshdf5)
        H5close()
        return(dataset)
    }


    directoryphase = paste(directory_dataset, phase, sep="/")
    suffix = paste("_", phase, ".txt", sep="")
    namefiletxt = paste(directoryphase, "/", namedataset, suffix, sep="")
    nlines = length(readLines(namefiletxt))
    if(funread == "csv") {
        dataset = read.csv(namefiletxt, nrow=nrow, header=FALSE)
    }
    if(funread == "fwf") {
        dataset = read.fwf(namefiletxt, n=nrow, ...)    
    }

    dim = nrow(dataset)
    l = nlines - dim
    while(l > 0) {
        print(dim)
        if (l > nrow) l = nrow
        if(funread == "csv") {
            newdata = read.csv(namefiletxt, nrow=l, skip=dim, header=FALSE)
        }
        if(funread == "fwf") {
            newdata = read.fwf(namefiletxt, n=nrow, skip=dim, ...)
        }
        
        dataset = rbind(dataset, newdata)
        rm(newdata)
        dim = nrow(dataset)
        l = nlines - dim
        print(dim)
    }
    newnamedataset = sub("Inertial Signals/", "", namedataset)
    names(dataset) = gsub("V", newnamedataset, names(dataset))
    h5write(dataset, fileh5, namefileshdf5, level=0)
    H5close()
    return(dataset)
}
    
fileh5 = "combined.h5"
h5createFile(fileh5)
h5createGroup(fileh5, "test")
h5createGroup(fileh5, "test/Inertial Signals")
h5createGroup(fileh5, "train")
h5createGroup(fileh5, "train/Inertial Signals")

directory_dataset = "UCI HAR Dataset"
phases = c("test", "train")
for(phase in phases) {
    datasetinh5 = h5ls(fileh5)
    datasetinh5$namehdf5 = gsub("^/", "", datasetinh5$group)
    datasetinh5$namehdf5 = paste(datasetinh5$namehdf5, datasetinh5$name, sep="/")
    # load dataset of files txt for a test or train
    y = savetxt("y", funread="csv", nrow=1000)
    names(y) = "y"
    subject = savetxt("subject", funread="csv", nrow=1000)
    names(subject) = "subject"
    columnas = 8976/16
    X = savetxt("X", funread="fwf", nrow=500, rep(16, columnas))
    columnas = 2048/16
    body_acc_x = savetxt("Inertial Signals/body_acc_x", 
                                        funread="fwf", nrow=1000, rep(16, columnas))
    body_acc_y = savetxt("Inertial Signals/body_acc_y", 
                         funread="fwf", nrow=1000, rep(16, columnas))
    body_acc_z = savetxt("Inertial Signals/body_acc_z", 
                         funread="fwf", nrow=1000, rep(16, columnas))
    body_gyro_x = savetxt("Inertial Signals/body_gyro_x", 
                         funread="fwf", nrow=1000, rep(16, columnas))
    body_gyro_y = savetxt("Inertial Signals/body_gyro_y", 
                          funread="fwf", nrow=1000, rep(16, columnas))
    body_gyro_z = savetxt("Inertial Signals/body_gyro_z", 
                          funread="fwf", nrow=1000, rep(16, columnas))
    total_acc_x = savetxt("Inertial Signals/total_acc_x", 
                          funread="fwf", nrow=1000, rep(16, columnas))
    total_acc_y = savetxt("Inertial Signals/total_acc_y", 
                          funread="fwf", nrow=1000, rep(16, columnas))
    total_acc_z = savetxt("Inertial Signals/total_acc_z", 
                          funread="fwf", nrow=1000, rep(16, columnas))
    # join the dataset by the function cbin and save to dataframe
    if(phase == "train") {
        datasettrain = cbind(subject, y, X, body_acc_x, body_acc_y, body_acc_z,
                    body_gyro_x, body_gyro_y, body_gyro_z,
                    total_acc_x, total_acc_y, total_acc_z)
    }
    if(phase == "test") {
        datasettest = cbind(subject, y, X, body_acc_x, body_acc_y, body_acc_z,
                             body_gyro_x, body_gyro_y, body_gyro_z,
                             total_acc_x, total_acc_y, total_acc_z)
    }

}
# join the dataset test and train
library(dplyr)
datasettest = mutate(datasettest, phase="test")
datasettrain = mutate(datasettrain, phase="train")
onedataset = rbind(datasettest, datasettrain)

# end of question 1
# start the question 2
# read the file features.txt with contains the variables names of X
filenamecsv = paste(directory_dataset, "features.txt", sep="/")
namesvariablesX = read.csv(filenamecsv, sep=" ", header=FALSE)
# find the string mean() and std() and the variables names contain in features.txt
namesvariableofmean = namesvariablesX[grep("-mean\\(\\)", namesvariablesX[,2]),1]
namesvariableofstd = namesvariablesX[grep("-std\\(\\)", namesvariablesX[,2]),1]
namesvariablesrequest = sort(c(namesvariableofmean, namesvariableofstd))
labelvariables = as.character(namesvariablesX[namesvariablesrequest, 2])
labelvariables = gsub("\\(\\)", "", labelvariables)

namesvariablesrequest = paste("X", namesvariablesrequest, sep="")
namesvariables = c("subject", "y" ,"phase", namesvariablesrequest)
onedataset = onedataset[,namesvariables]

# end of question 2
# start the question 3
# Uses descriptive activity names to name the activities in the data set
filenamecsv = paste(directory_dataset, "activity_labels.txt", sep="/")
labelactivities = read.csv(filenamecsv, sep=" ", header=FALSE)
names(labelactivities) = c("y", "activity")
onedataset = merge(onedataset, labelactivities, by="y")
namesvariables = c("subject", "y" ,"phase", "activity", namesvariablesrequest)
onedataset = onedataset[,namesvariables]
# end of question 3

# start the question 4
# Appropriately labels the data set with descriptive variable names. 
names(onedataset) = c("subject", "y", "phase", "activity", labelvariables)

# end of the question 5

# start the question 5
# From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.
library(reshape2)

# calculate the average for variable for each activity and each subject
onedatasetmelt = melt(onedataset, id=c("subject", "activity", "phase"), measure.vars=labelvariables)
tidydataprev = dcast(onedatasetmelt, variable + phase ~ activity + subject, mean)

library(tidyr)
tidydataprev2 = tidydataprev %>%
    # pass variables names to column names
    gather(key=activity_subject, value=average, -matches("variable"), -matches("phase")) %>%
    # delete missing values because not all subject participate in train and test
    filter(!is.na(average)) %>%
    # # the character _ not work well with dcast correctly , when we apply separate function
    mutate(activity_subject = gsub("WALKING_DOWNSTAIRS", "WALKINGDOWNSTAIRS", activity_subject)) %>%
    mutate(activity_subject = gsub("WALKING_UPSTAIRS", "WALKINGUPSTAIRS", activity_subject)) %>%
    separate(activity_subject, into=c("activity", "subject")) %>%
    mutate(activity=gsub("WALKINGDOWNSTAIRS", "WALKING_DOWNSTAIRS", activity)) %>%
    mutate(activity = gsub("WALKINGUPSTAIRS", "WALKING_UPSTAIRS", activity))

tidydataprev3 = tidydataprev2 %>%
    # prepare the variables names to split into measure and stat
    mutate(variable = gsub("-mean-X", "-X-mean", variable)) %>%
    mutate(variable = gsub("-mean-Y", "-Y-mean", variable)) %>%
    mutate(variable = gsub("-mean-Z", "-Z-mean", variable)) %>%
    mutate(variable = gsub("-std-X", "-X-std", variable)) %>%
    mutate(variable = gsub("-std-Y", "-Y-std", variable)) %>%
    mutate(variable = gsub("-std-Z", "-Z-std", variable)) %>%
    mutate(variable = gsub("-mean", "_mean", variable)) %>%
    mutate(variable = gsub("-std", "_std", variable)) %>%
    separate(variable, into=c("measure", "stat"), sep="_") %>%
    # separate the prefix t and f, which denote time and frecuency domain signals
    mutate(measure=gsub("^t", "t_", measure)) %>%
    mutate(measure=gsub("^f", "f_", measure)) %>%
    separate(measure, into=c("denote", "measure"), sep="_") %>%
    # separate measure
    mutate(measure=gsub("^Body", "Body_", measure)) %>%
    # exist the name BodyBody to rename Body
    mutate(measure=gsub("^Body_Body", "Body_", measure)) %>%
    mutate(measure=gsub("^Gravity", "Gravity_", measure)) %>%
    separate(measure, into=c("denote2", "measure"), sep="_") %>%
    # separate sensors
    mutate(measure=gsub("^Acc", "Acc_", measure)) %>%
    mutate(measure=gsub("^Gyro", "Gyro_", measure)) %>%
    separate(measure, into=c("sensor", "denote3"), sep="_") %>%
    # change the subffix max by -M
    mutate(denote3=gsub("Mag", "-Mag", denote3)) %>%
    # specify when apply the measurement is raw
    mutate(denote3=gsub("^-", "Fil-", denote3)) %>%
    # separate the type of transform of signal and direction
    separate(denote3, into=c("transform", "direction"), sep="-") 
    
tidydata = tidydataprev3 %>%
    mutate(denote= gsub("t", "Time", denote)) %>%
    mutate(denote= gsub("f", "Frecuency", denote)) %>%
    mutate(stat= gsub("mean", "Mean", stat)) %>%
    mutate(stat= gsub("std", "Std", stat)) %>%
    # pass values of the column stat to variable names because mean and std are variables
    # reference section 3.3 of paper of tidy data http://vita.had.co.nz/papers/tidy-data.pdf
    dcast(... ~ denote + denote2 + sensor + transform + direction + stat, value.var="average")

write.table(tidydata, file="tidydata.txt", row.names = FALSE)

# end of step 5




