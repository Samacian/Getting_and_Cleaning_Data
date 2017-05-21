library(dplyr)

run_analysis <- function() {
    
    # This script, run_analysis.R, does the following.
    # 1. Merges the training and the test sets to create one data set.
    # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
    # 3. Uses descriptive activity names to name the activities in the data set
    # 4. Appropriately labels the data set with descriptive variable names.
    # 5. From the data set in step 4, creates a second, independent tidy data set with 
    #    the average of each variable for each activity and each subject.
    
    
    # Merge the training and test sets
    initial_data = rbind( read.table( "train/X_train.txt"), read.table( "test/X_test.txt"))
    activity_list = rbind( read.table( "train/y_train.txt"), read.table( "test/y_test.txt"))
    subject_list = rbind( read.table( "train/subject_train.txt"), read.table( "test/subject_test.txt"))
    activity_labels = read.table( "activity_labels.txt")
    observation_labels = read.table( "features.txt")
    
    # Identify the measurements that are required
    column_numbers = grep( "mean|std", observation_labels[, 2])
    column_names = grep( "mean|std", observation_labels[, 2], value = TRUE)
    
    # Use the descriptive activity names
    data_labels = activity_labels[match( activity_list[,1], activity_list[,1]),2]
    final_set = cbind( initial_data %>% select( column_numbers), data_labels, subject_list)
    
    # Label the data with descriptive names
    names( final_set) =c( column_names, "activity", "subject")
    
    # Create an independant data set
    write.table( final_set %>% group_by( activity, subject) %>% summarize_all( funs( mean)), "Output.txt", row.names=FALSE)
}
