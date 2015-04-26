## Submission for Getting and Cleaning Data Course

My function does not accept any parameters, it assume, that data folder is in working directory and that dplyr package is installed.

First 3 lines read train data and assign them to 'data' variable. In second and third line it is done by binding new columns.

Next 3 lines does the same as above, but with test data, and 'data1' variable, accordingly.

Next, function is binding that 2 data sets to one variable: 'data'. At that point function read all numeric data needed to perform analysis.

In line 8 & 9, function is reading names for data labels and assigning them to columns. Labels "Volunteer" & "Activities" are added as first two column names.

In next line function drops all columns, that are neither std nor mean. First two are also preserved, as they contain information about Volunteer & Activities.

In line 11 & 12 function should assign activity names (in almost the same way it assigned column names), but I prevented 12th line from executing. I gave warning when function executed mean() function in 17th line. Labels are assigned in 18th line.

Next function creates NULL 'tidy_data' variable, and loads 'dplyr' package.

Lines 15-17 are making tidy data set. First for loop is for volunteers (1 to 30), next one is for activities (1 to 6). In 17th line parts of data are extracted from 'data' variable (for each volunteer and each activity), and mean for each column is counted (in this part summarise_each() function gave NA, when activities were counted; leaving them in integer value saved some warning messages, as well as writing some additional lines of code).

In line 18 function is assigning activity names in column Activities.

The last line returns tidied up data set.


##tl;dr:
Non parameterized function run_analysis() accesses to SAMSUNG data folder localized in working dirctory, reads all necessary data, calculate average of each mean and standard deviation variable for each activity and each subject and returns them in tieded data frame.