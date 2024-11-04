#### Preamble ####
# Purpose: Downloads and saves the data
# Author: Manjun Zhu
# Date: 4 November 2024
# Contact: karmen.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites: presidential poll data needed


#### Workspace setup ####
library(tidyverse)

#### Download data ####
raw_data_polls <-
  read_csv(
    file = 
      "https://projects.fivethirtyeight.com/polls/data/president_polls.csv",
    show_col_types = FALSE,
  )

write_csv(
  raw_data_polls, file = "president_polls.csv"
)

#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_data_polls, "data/01-raw_data/raw_data.csv") 

