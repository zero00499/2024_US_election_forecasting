#### Preamble ####
# Purpose: Cleaned the raw data by selecting needed columns and rows, as well as create duration.
# Author: Manjun Zhu
# Date: 3 November 2024
# Contact: karmen.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites: raw data needed

#### Workspace setup ####
library(tidyverse)


#### Clean data ####
raw_data <- read_csv("data/01-raw_data/raw_data.csv")

# Filter for non-partisan polls and the actual votes (where hypothetical shown as FALSE)
filtered_data <- raw_data |> 
  filter(is.na(partisan))

# Select relevant columns for analysis
target_data <- filtered_data %>%
  select(pollster, state, party, hypothetical, start_date, end_date, numeric_grade, pollscore,
         transparency_score, candidate_name, pct)

# Further refine polling data: focus on polls with positive 'pollscore'
filtered_data <- target_data %>%
  filter(pollscore > 0)

# Replace NA values in 'state' with "National" for completeness
filtered_data <- filtered_data %>%
  mutate(
    state = if_else(is.na(state), "National", state)
  )

# Convert 'start_date' to Date format, calculate 'duration', and remove 'start_date'
filtered_data <- filtered_data %>%
  mutate(
    start_date = as.Date(start_date, format="%m/%d/%y"),
    end_date = as.Date(end_date, format="%m/%d/%y"),
    duration = as.numeric(difftime(end_date, start_date, units = "days"))
  ) %>%
  select(-start_date)  # Remove the 'start_date' column

# Reorder the columns, put duration in the middle instead of the end
filtered_data <- filtered_data %>%
  select(pollster, state, party, hypothetical, end_date, duration, numeric_grade, pollscore,
         transparency_score, candidate_name, pct)


#### Save the filtered data ####
# Write the cleaned and transformed data to a new CSV file
write_csv(filtered_data, "data/02-analysis_data/analysis_data.csv")
