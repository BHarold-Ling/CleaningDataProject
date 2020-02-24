---
title: "Code Book"
author: "Bruce H"
date: "2/21/2020"
output: html_document
---

# Variables


## Original Attribute Information

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 

## Original Notes (providing units)

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.

## Original Feature Notes, reduced for data used in this preparation

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
(Others removed from this set)

## Columns in tidy data.frame

| Column Name                 |Description or orignal label|
|-----------------------------|----------------------------|
| subject                     |Subject ID                  |
| activity                    |Activity being measured     |
| tbodyaccmeanx               |tBodyAcc-mean()-X           |
| tbodyaccmeany               |tBodyAcc-mean()-Y           |
| tbodyaccmeanx               |tBodyAcc-mean()-X           |
| tbodyaccmeany               |tBodyAcc-mean()-Y           |
| tbodyaccmeanz               |tBodyAcc-mean()-Z           |
| tbodyaccstdx                |tBodyAcc-std()-X            |
| tbodyaccstdy                |tBodyAcc-std()-Y            |
| tbodyaccstdz                |tBodyAcc-std()-Z            |
| tgravityaccmeanx            |tGravityAcc-mean()-X        |
| tgravityaccmeany            |tGravityAcc-mean()-Y        |
| tgravityaccmeanz            |tGravityAcc-mean()-Z        |
| tgravityaccstdx             |tGravityAcc-std()-X         |
| tgravityaccstdy             |tGravityAcc-std()-Y         |
| tgravityaccstdz             |tGravityAcc-std()-Z         |
| tbodyaccjerkmeanx           |tBodyAccJerk-mean()-X       |
| tbodyaccjerkmeany           |tBodyAccJerk-mean()-Y       |
| tbodyaccjerkmeanz           |tBodyAccJerk-mean()-Z       |
| tbodyaccjerkstdx            |tBodyAccJerk-std()-X        |
| tbodyaccjerkstdy            |tBodyAccJerk-std()-Y        |
| tbodyaccjerkstdz            |tBodyAccJerk-std()-Z        |
| tbodygyromeanx              |tBodyGyro-mean()-X          |
| tbodygyromeany              |tBodyGyro-mean()-Y          |
| tbodygyromeanz              |tBodyGyro-mean()-Z          |
| tbodygyrostdx               |tBodyGyro-std()-X           |
| tbodygyrostdy               |tBodyGyro-std()-Y           |
| tbodygyrostdz               |tBodyGyro-std()-Z           |
| tbodygyrojerkmeanx          |tBodyGyroJerk-mean()-X      |
| tbodygyrojerkmeany          |tBodyGyroJerk-mean()-Y      |
| tbodygyrojerkmeanz          |tBodyGyroJerk-mean()-Z      |
| tbodygyrojerkstdx           |tBodyGyroJerk-std()-X       |
| tbodygyrojerkstdy           |tBodyGyroJerk-std()-Y       |
| tbodygyrojerkstdz           |tBodyGyroJerk-std()-Z       |
| tbodyaccmagmean             |tBodyAccMag-mean()          |
| tbodyaccmagstd              |tBodyAccMag-std()           |
| tgravityaccmagmean          |tGravityAccMag-mean()       |
| tgravityaccmagstd           |tGravityAccMag-std()        |
| tbodyaccjerkmagmean         |tBodyAccJerkMag-mean()      |
| tbodyaccjerkmagstd          |tBodyAccJerkMag-std()       |
| tbodygyromagmean            |tBodyGyroMag-mean()         |
| tbodygyromagstd             |tBodyGyroMag-std()          |
| tbodygyrojerkmagmean        |tBodyGyroJerkMag-mean()     |
| tbodygyrojerkmagstd         |tBodyGyroJerkMag-std()      |
| fbodyaccmeanx               |fBodyAcc-mean()-X           |
| fbodyaccmeany               |fBodyAcc-mean()-Y           |
| fbodyaccmeanz               |fBodyAcc-mean()-Z           |
| fbodyaccstdx                |fBodyAcc-std()-X            |
| fbodyaccstdy                |fBodyAcc-std()-Y            |
| fbodyaccstdz                |fBodyAcc-std()-Z            |
| fbodyaccjerkmeanx           |fBodyAccJerk-mean()-X       |
| fbodyaccjerkmeany           |fBodyAccJerk-mean()-Y       |
| fbodyaccjerkmeanz           |fBodyAccJerk-mean()-Z       |
| fbodyaccjerkstdx            |fBodyAccJerk-std()-X        |
| fbodyaccjerkstdy            |fBodyAccJerk-std()-Y        |
| fbodyaccjerkstdz            |fBodyAccJerk-std()-Z        |
| fbodygyromeanx              |fBodyGyro-mean()-X          |
| fbodygyromeany              |fBodyGyro-mean()-Y          |
| fbodygyromeanz              |fBodyGyro-mean()-Z          |
| fbodygyrostdx               |fBodyGyro-std()-X           |
| fbodygyrostdy               |fBodyGyro-std()-Y           |
| fbodygyrostdz               |fBodyGyro-std()-Z           |
| fbodyaccmagmean             |fBodyAccMag-mean()          |
| fbodyaccmagstd              |fBodyAccMag-std()           |
| fbodybodyaccjerkmagmean     |fBodyBodyAccJerkMag-mean()  |
| fbodybodyaccjerkmagstd      |fBodyBodyAccJerkMag-std()   |
| fbodybodygyromagmean        |fBodyBodyGyroMag-mean()     |
| fbodybodygyromagstd         |fBodyBodyGyroMag-std()      |
| fbodybodygyrojerkmagmean    |fBodyBodyGyroJerkMag-mean() |
| fbodybodygyrojerkmagstd     |fBodyBodyGyroJerkMag-std()  |

NOTE: the summary data.frame has the same column names, but here they represent the average for each column over subject and activity.

# Raw Data

## Source

The data and explanations are available at this URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

Citation for the original study: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

## Downloading

The files were downloaded and unzipped in R using my function run_download().

## Structure

Each data set consists of three files of column information that could be combined.
* X_train.txt - the measurements
* y_train.txt - the activities
* subject_train.txt - the subjects

For the training data these all have 7357 rows.  For the test data they have 2948 rows.

NOTE: The inertial signals in the next level of subdirectory are not needed for this analysis.

# Clean Up

## Assembling the data sets

The three tables for each set (train and test) were read into data.frames and combined as columns into one data.frame.

Names for the measures were obtained from the file "features.txt".

The measurement file was treated as a fixed-width file with columns of 16 character each.

## Extracting columns

I extracted the desired columns by looking for column names with "mean" and "std" followed by symbols.  I also excluded the ones with a captial "M" in "Mean" because those were actually not measures of means, but measurements of angles.

## Tidying column names

I tidied the column names by removing all symbols and converting all characters to lower case.  The original data in "features.txt" had a variety of symbols.

## Labeling activities

I labeled the activities using the names in activity_labels.txt.

## Sumnmary table

For the summary table I calculated the averages of all columns of measures.

## Saving data

Finally, both tables were written to text files.


