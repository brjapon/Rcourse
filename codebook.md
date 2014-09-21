Code Book
=========
**Human Activity Recognition Using Smartphones Dataset**

Variables in the (raw) data set
-------------------------------
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
In the following, the names if the variables ended in `_train` refer to the training set, while those ended in `_test` refer to the test set.

- SUBJECTS are identified in the vectors `subject_train` and `subject_test`: Each component identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

- ACTIVITIES are identified in the vectors `y_train` and `y_test`, where each row corresponds to one subject as indicated above

- BODY ACCELERATIONS for each axis are listed in the data frames `body_acc_x_train`, `body_acc_x_test`, `body_acc_y_train`, `body_acc_y_test`, `body_acc_z_train`, `body_acc_z_test`. Each one contains 128 columns corresponding to the 128 readings of the window. Each row corresponds to one subject as indicated above.

- ANGULAR VELOCITIES for each axis are listed in the data frames `body_gyro_x_train`, `body_gyro_x_test`, `body_gyro_y_train`, `body_gyro_y_test`, `body_gyro_z_train`, `body_gyro_z_test`, with the same corresponce of row as indicated for the body accelerations.

- Equally, TOTAL ACCELERATIONS for each axis are listed in the data frames `total_acc_x_train`, `total_acc_x_test`, `total_acc_y_train`, `total_acc_y_test`, `total_acc_z_train`, `total_acc_z_test`. The sensor signals were sampled in fixed-width sliding windows of 2.56 sec and 50% overlap. As the sensors are read at 50 Hz, this means 128 readings/window, which is the number of columns of BODY, ANGULAR and TOTAL accelerations.

- DATA SETS are in the data frames `X_train` and `X_test`. Each column of them corresponds to each of the 561 features obtained after processing BODY, ANGULAR velocities and TOTAL accelerations sets. These features are time and frequency domain. The complete list of them can be found in the data frame `features`, which is sorted according to the column ordering of `X_train` and `X_test`. Detailed info about the variables can be found in `features_info.md`, located in this same repository.

All the features are normalized and bounded within [-1,1]

Information about the summary choices
-------------------------------------
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See `features_info.md` for more details. 


Information about the experimental study design
-----------------------------------------------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually.
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
