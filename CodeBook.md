#Source
The Human Activity Recognition data linked in the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. UCI Machine Learning Repository contains the full description where the data was obtained.

Here are the data for the project: Human Activity Recognition Using Smartphones Data Set

#Tidy Data Information
This repository includes a "tidy" data set of averages of means and standard deviations for various measurements of several common human activities.

#Identifiers
Human Activity Recognition database built from the recordings of 30 volunteers (within an age bracket of 19-48 years) performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.

SubjectID - An identifier of the subject who carried out the experiment. Its range is from 1 to 30.
Activity - The activity type performed when the corresponding measurements were taken. Each person performed six activities:
WALKING - Subject was walking during the experiment
WALKING_UPSTAIRS - Subject was walking up a staircase during the experiment
WALKING_DOWNSTAIRS - Subject was walking down a staircase during the experiment
SITTING - Subject was sitting during the experiment
STANDING - Subject was standing during the experiment
LAYING - Subject was laying down during the experiment

#Measurements
Using the embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. The following are the specific mean and standard deviation measurement variables(in radians per sec and hertz) in the tidy data:

"tbodyaccmeanx" 
"tbodyaccmeany" 
"tbodyaccmeanz" 
"tbodyaccstdx" 
"tbodyaccstdy" 
"tbodyaccstdz" 
"tgravityaccmeanx" 
"tgravityaccmeany" 
"tgravityaccmeanz" 
"tgravityaccstdx" 
"tgravityaccstdy" 
"tgravityaccstdz" 
"tbodyaccjerkmeanx" 
"tbodyaccjerkmeany" 
"tbodyaccjerkmeanz" 
"tbodyaccjerkstdx" 
"tbodyaccjerkstdy" 
"tbodyaccjerkstdz" 
"tbodygyromeanx" 
"tbodygyromeany" 
"tbodygyromeanz" 
"tbodygyrostdx" 
"tbodygyrostdy" 
"tbodygyrostdz" 
"tbodygyrojerkmeanx" 
"tbodygyrojerkmeany" 
"tbodygyrojerkmeanz" 
"tbodygyrojerkstdx" 
"tbodygyrojerkstdy" 
"tbodygyrojerkstdz" 
"tbodyaccmagmean" 
"tbodyaccmagstd" 
"tgravityaccmagmean" 
"tgravityaccmagstd" 
"tbodyaccjerkmagmean" 
"tbodyaccjerkmagstd" 
"tbodygyromagmean" 
"tbodygyromagstd" 
"tbodygyrojerkmagmean" 
"tbodygyrojerkmagstd" 
"fbodyaccmeanx" 
"fbodyaccmeany" 
"fbodyaccmeanz" 
"fbodyaccstdx" 
"fbodyaccstdy" 
"fbodyaccstdz" 
"fbodyaccjerkmeanx" 
"fbodyaccjerkmeany" 
"fbodyaccjerkmeanz" 
"fbodyaccjerkstdx" 
"fbodyaccjerkstdy" 
"fbodyaccjerkstdz" 
"fbodygyromeanx" 
"fbodygyromeany" 
"fbodygyromeanz" 
"fbodygyrostdx" 
"fbodygyrostdy" 
"fbodygyrostdz" 
"fbodyaccmagmean" 
"fbodyaccmagstd" 
"fbodybodyaccjerkmagmean" 
"fbodybodyaccjerkmagstd" 
"fbodybodygyromagmean" 
"fbodybodygyromagstd" 
"fbodybodygyrojerkmagmean" 
"fbodybodygyrojerkmagstd"

Please note that only the variables that were listed as either means or standard deviations of other variables in the data set were retained. For easy reference, the following are applied in the variable names:

mean as Mean
std as Std
acc as Accelerometer
gyro as Gyroscope
Mag as Magnitude
body as Body
t as Time
f as Frequency

other unnecessary characters (e.g. -()) are ommitted

Source file is named run_analysis.R. The tidy dataset is saved as SecondTidy.txt.
