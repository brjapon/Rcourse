Code Book
=========
**Human Activity Recognition Using Smartphones Dataset**

Variables in the (raw) data set
------------------------------------
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
In the following, the names if the variables ended in `_train` refer to the training set, while those ended in `_test` refer to the test set.

- SUBJECTS are identified in the vectors `subject_train` and `subject_test`: Each component identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

- ACTIVITIES are identified in the vectors `y_train` and `y_test`, where each row corresponds to one subject as indicated above

- BODY ACCELERATIONS for each axis are listed in the data frames `body_acc_x_train`, `body_acc_x_test`, `body_acc_y_train`, `body_acc_y_test`, `body_acc_z_train`, `body_acc_z_test`. Each one contains 128 columns corresponding to the 128 readings of the window. Each row corresponds to one subject as indicated above.

- ANGULAR VELOCITIES for each axis are listed in the data frames `body_gyro_x_train`, `body_gyro_x_test`, `body_gyro_y_train`, `body_gyro_y_test`, `body_gyro_z_train`, `body_gyro_z_test`, with the same corresponce of row as indicated for the body accelerations.

- Equally, TOTAL ACCELERATIONS for each axis are listed in the data frames `total_acc_x_train`, `total_acc_x_test`, `total_acc_y_train`, `total_acc_y_test`, `total_acc_z_train`, `total_acc_z_test`.

All the features are normalized and bounded within [-1,1]


The sensor signals were sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).

2. Information about the summary choices you made
3. Information about the experimental study design you used
