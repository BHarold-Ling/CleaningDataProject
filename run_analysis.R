## run_analysis.R - Run the analysis of the accelerometers measurements
## from wearable electronics

library(dplyr)
library(tidyr)

## Global variables

datadir <- "./"
ucidir <- paste0(datadir, "UCI HAR Dataset/")

## Test settings
rowlimit <- -1
#rowlimit <- 200 # Testing value

## Top level routine - to run full process with no parameters

run_analysis_full <- function() run_analysis(download = TRUE)


## Main routine
##
## This creates tidy_df - tidy dataset of means and standard deviations
## and summ_df - tidy dataset of averages of these measures by subject and
## activity.
##
## Return: Summary dataset
##
##   This has the option to avoid downloading the files and
##   unziping them when rerunning.

run_analysis <- function(download = FALSE) {

    # Run download again only if requested
    if (download) run_download()
    
    # Build the two data sets from their files
    train_df <- mergefiles("train")
    test_df <- mergefiles("test")
    
    # Merge the datasets
    full_df <- rbind(train_df, test_df)
    
    # Extract desired columns (means and standard deviations)
    narrow_df <- extract_cols(full_df)
    
    # Tidy up labels
    names(narrow_df) <- labels_for_uci(narrow_df)
    
    # Provide names for activities
    tidy_df <- name_activites(narrow_df)

    # Add a summary dataset
    summ_df <- tidy_df %>%
        group_by(subject, activity) %>%
        summarize_all(mean)

    # Wrap Up
    
    # Save results
    write.table(tidy_df, "Data/tidy.txt", row.names=FALSE)
    write.table(summ_df, "Data/summ.txt", row.names=FALSE)
    
    summ_df
}


# Download and unpack files

run_download <- function() {
    print("Downloading and unzipping")
    
    download.file(
        "http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip",
        paste0(datadir,"UCI HAR Dataset.zip"), mode="wb"
    )
    
    unzip(paste0(datadir,"UCI HAR Dataset.zip"), exdir=sub("/$","",datadir))
}

## Merge the datasets from muliple files in a directory
## Returns: single dataset with data from all three files

mergefiles <- function(setname) {
    print("Loading data.frames")
    
    # Assemble the filenames for this setname
    # e.g. base directory + "train/subject_train.txt"
    setdir <- paste0(ucidir, setname, "/")
    subj_fname <- paste0(setdir, "subject_", setname, ".txt")
    activity_fname <- paste0(setdir, "y_", setname, ".txt")
    measures_fname <- paste0(setdir, "X_", setname, ".txt")
    mnames_fname <- paste0(ucidir,"features.txt")
    
    # Get measure names from file
    ## measure_names <- readLines(mnames_fname)
    measure_names <- read.table(mnames_fname, sep = " ",
            stringsAsFactors = FALSE)[[2]]
    
    subj_df <- read.table(subj_fname, col.names = c("subject"),
                          nrows = rowlimit)
    act_df <- read.table(activity_fname, col.names = c("activity"),
                         nrows = rowlimit)
    
    print("Loading measures, this may take some time")
    
    # This code splits each line into 561 16-character numbers
    # This takes noticeable time to run
    measures_df <- read.fwf(measures_fname, rep(16,times = 561), 
                            n = rowlimit, col.names = measure_names)
    
    print("Merging data.frames")
    
    # Return the merged data
    cbind(subj_df, act_df, measures_df)
}

# Extract desired columns (means and standard deviations)

extract_cols <- function(df1) {
    print("Extracting columns")
    
    names1 <- names(df1)
    # Only get means and standard deviations
    # Not every column with "mean" in the name should be included;
    select.index <- grep("(std|mean)\\.",names1)
    select.index <- c(1, 2, select.index)
    df2 <- df1[,select.index]
    
    df2
}

# Tidy up labels

labels_for_uci <- function(df1) {
    print("Creating tidy column names")
    
    names1 <- names(df1)

    names1 <- tolower(names1)
    names1 <- gsub("\\.","",names1)
    
    names1
}

# Provide names for activities

name_activites <- function(df1) {
    print("Assigning names to activities")
    
    act_labels_fname <- paste0(ucidir, "activity_labels.txt")
    act_labels_df <- read.table(act_labels_fname, sep = " ",
                                stringsAsFactors = FALSE,
                                col.names = c("activity", "alabel"))
    
    df2 <- inner_join(df1, act_labels_df) %>%
        mutate(activity = alabel, alabel = NULL)
    
    df2
}

get_column_name_table <- function() {
    mnames_fname <- paste0(ucidir,"features.txt")
    
    # Get measure names from file
    ## measure_names <- readLines(mnames_fname)
    measure_names <- read.table(mnames_fname, sep = " ",
                                stringsAsFactors = FALSE)[[2]]
    
    # Only get means and standard deviations
    # Not every column with "mean" in the name should be included;
    select.index <- grep("(std|mean)[^A-Za-z]",measure_names)
    select.index <- c(1, 2, select.index)
    measure_names <- measure_names[select.index]
    
    names1 <- gsub("[^a-z0-9]","",tolower(measure_names))
    
    ntable <- cbind(measure_names, names1)
    
    for (i in 1:nrow(ntable)) {
        xs <- sprintf("| %-28s|% -28s|", ntable[i,2], ntable[i,1])
        print(xs)
    }
}


