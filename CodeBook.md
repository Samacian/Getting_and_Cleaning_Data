---
Title: "CodeBook.md"

---
Codebook explaining the different variables used and any transformations applied in scripts for the data cleaning project.

# run_analysis.R

## file names

 - 'features_info.txt': Shows information about the variables used on the feature vector.

 - 'features.txt': List of all features.

 - 'activity_labels.txt': Links the class labels with their activity name.

 - 'train/X_train.txt': Training set.

 - 'train/y_train.txt': Training labels.

 - 'test/X_test.txt': Test set.

 - 'test/y_test.txt': Test labels.


The following files are available for the train and test data. Their descriptions are equivalent. 

 - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


## variables

 - initial_data       : the joined observations (train & test)
 - activity_list      : the joined list of the activity codes (train & test)
 - subject_list       : the joined list of subject codes (train & test)
 - activity_labels    : the mapping between the activity code and a text description
 - observation_labels : the mapping of the observation to a text description

 - column_numbers     : lists all columns whose text label contains the text 'mean' or 'std'
 - column_names       : the text label for each of the columns in column_numbers
 
 - data_labels        : the matched list of activities
 - final_set          : contains the filtered list of observations (only mean and standard deviation) with the activity text and subject code.

  
## transformations

 - initial_data with all observations is filtered based on the given columns for mean and std values. The number of these columns are listed in column_numbers.
 - final_set is prepared by doing column bind of observations, activity labels and subject numbers
 - the column names in final_set are replaced as provided in column_names
 - the output file "Output.txt" is created using write.table and by using dplyr library to chaining the functions groupby and summarize_all
