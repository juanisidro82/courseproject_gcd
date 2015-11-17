# README

This repository is the course Project of the Course Getting and Cleaning Data.
Contains the files tidydata.txt, that a data arranged in txt format.
CodeBook.md, the description of the variables contained in tidydata file.
The file is the one that script run_analysis.R tidydata.txt genres, generate data for
This file is obtained
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Files were imported by savetxt function. The function f is created with the
About X Files to import txt _.... due queue overflowed the function the read.fwf
the RAM.

Para run, you must unzip the contents of the file obtained link
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
in the same location as the script, or if put in another directory changes the line
directory_dataset = "HAR UCI data set" with the right direction.

The file generate file hdf5 combined.h5, so that if re-run
the script no longer have to obtain information file txt. Get file information
hdf5 which is faster.

The file generates the tidydata.txt file, whose description is in
CodeBook.md

The names of the variables have been renamed for the purpose of applying power
separate function easily if required.
