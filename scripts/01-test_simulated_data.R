#### Preamble ####
# Purpose: Simulates a dataset of American electoral divisions, including the 
  #state and party that won each division.
# Author: Ziheng Wang
# Date: 4 November 2024
# Contact: zzzziheng.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)

analysis_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 2000 rows
if (nrow(analysis_data) == 2000) {
  message("Test Passed: The dataset has 2000 rows.")
} else {
  stop("Test Failed: The dataset does not have 2000 rows.")
}

# Check if the dataset has 3 columns
if (ncol(analysis_data) == 7) {
  message("Test Passed: The dataset has 7 columns.")
} else {
  stop("Test Failed: The dataset does not have 7 columns.")
}

# Check if all values in the 'division' column are unique
if (n_distinct(analysis_data$division) == nrow(analysis_data)) {
  message("Test Passed: All values in 'division' are unique.")
} else {
  stop("Test Failed: The 'division' column contains duplicate values.")
}

# Check if the 'state' column contains only valid Australian state names
valid_states <- c("New South Wales", "Victoria", "Queensland", "South Australia", 
                  "Western Australia", "Tasmania", "Northern Territory", 
                  "Australian Capital Territory")

if (all(analysis_data$state %in% valid_states)) {
  message("Test Passed: The 'state' column contains only valid Australian state names.")
} else {
  stop("Test Failed: The 'state' column contains invalid state names.")
}

# Check if the 'party' column contains only valid party names
valid_parties <- c("Labor", "Liberal", "Greens", "National", "Other")

if (all(analysis_data$party %in% valid_parties)) {
  message("Test Passed: The 'party' column contains only valid party names.")
} else {
  stop("Test Failed: The 'party' column contains invalid party names.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(analysis_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Test no empty strings in 'state' or 'pollster' columns
if (all(simulated_data$state != "" & simulated_data$pollster != "")) {
  message("Test Passed: No empty strings in 'state' or 'pollster' columns.")
} else {
  stop("Test Failed: Empty strings found in 'state' or 'pollster' columns.")
}

# Check if the 'party' column has at least two unique values
if (n_distinct(analysis_data$party) >= 2) {
  message("Test Passed: The 'party' column contains at least two unique values.")
} else {
  stop("Test Failed: The 'party' column contains less than two unique values.")
}

# Test all percentage values are within a valid range (0 to 100)
if (all(simulated_data$pct >= 0 & simulated_data$pct <= 100)) {
  message("Test Passed: All pct values are between 0 and 100.")
} else {
  stop("Test Failed: Some pct values are outside the range 0 to 100.")
}
