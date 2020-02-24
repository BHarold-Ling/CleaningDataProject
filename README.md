---
title: "README"
author: "Bruce H"
date: "2/21/2020"
output: html_document
---

# Scripts and Operation

## run_analysis_full()

Top level routine - to run full process with no parameters.  This includes the download and unzipping of the raw data.

## run_analysis(download = FALSE)

This is the main controlling routine that runs the routines for the individual steps as needed.

This creates tidy_df - tidy dataset of means and standard deviations
and summ_df - tidy dataset of averages of these measures by subject and
activity.

Return: Summary dataset

This has the option to avoid downloading the files and
unziping them when rerunning.

## run_download()

Download and unpack files

## mergefiles(setname)

Merge the datasets from muliple files in a directory
Returns: single dataset with data from all three files

## extract_cols(df1)

Extract desired columns (means and standard deviations)

## labels_for_uci(df1)

Return tidied labels for a data.frame

## name_activites(df1)

Return a data.frame with names for activities

