run_analysis <- function() {
	data <- read.table("./UCI HAR Dataset/train/subject_train.txt")
	data <- cbind(data,read.table("./UCI HAR Dataset/train/y_train.txt"))
	data <- cbind(data,read.table("./UCI HAR Dataset/train/x_train.txt"))
	data1 <- read.table("./UCI HAR Dataset/test/subject_test.txt")
	data1 <- cbind(data1,read.table("./UCI HAR Dataset/test/y_test.txt"))
	data1 <- cbind(data1,read.table("./UCI HAR Dataset/test/x_test.txt"))

	data <- rbind (data,data1)

	labels <- read.table("./UCI HAR Dataset/features.txt")
	colnames(data) <- c("Volunteer","Activities",as.character(labels[,2]))

	data <- data[,c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,83,84,85,86,87,88,123,124,125,126,127,128,163,164,165,166,167,168,203,204,216,217,229,230,242,243,255,256,268,269,270,271,272,273,296,297,298,347,348,349,350,351,352,375,376,377,426,427,428,429,430,431,454,455,456,505,506,515,518,519,528,531,532,544,545,554,558,559,560,561,562,563)]

	alabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
##	data[,2] <- as.character(alabels[data[,2],2])

	tidy_data <- NULL
	library (dplyr)

	for (i in c(1:30)) {
		for (i1 in c(1:6)) {
			tidy_data <- rbind(tidy_data,filter(data, Volunteer == i, Activities == i1) %>% summarise_each(funs(mean)))
		}
	}

	tidy_data[,2] <- as.character(alabels[tidy_data[,2],2])

	return(tidy_data)
}
