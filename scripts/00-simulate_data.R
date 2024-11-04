#### Preamble ####
# Purpose: Simulates a dataset of American electoral divisions, including the 
  #state and party that won each division.
# Author: Ziheng Wang
# Date: 4 November 2024
# Contact: zzzziheng.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
set.seed(853)


#### Simulate data ####
# Number of rows to simulate data for
n <- 2000

# State names
states <- c("New York", "California", "Texas", "Florida", "Ohio", "Georgia", 
            "Arizona", "Nevada", "North Carolina", "Pennsylvania", "Michigan", 
            "Wisconsin", "Montana", "Virginia", "Minnesota", "New Hampshire", 
            "Nebraska", "New Mexico", "Connecticut", "Rhode Island", "Maryland",
            "Massachusetts", "Missouri", "Indiana", "Iowa", "Washington", "National")
#candidates
candidate_names <- c("Kamala Harris", "Donald Trump", "Joe Biden", "Bernie Sanders", "Elizabeth Ann Warren")
#transparency
transparency_scores <- seq(0, 10, 0.5)
#pollsters
pollsters <- c(pollsters <- c("Siena/NYT", "Ipsos", "Beacon/Shaw", "SurveyUSA", 
                              "Marist", "Quinnipiac", "YouGov", "Emerson"))
#party
partys <- c("DEM", "LIB", "GRE", "IND", "REP")


# Create a dataset by randomly assigning states and parties to divisions
simulated_data <- tibble(
  pct = rnorm(n, mean = 45, sd = 3.5)  # Simulate percentage support for Trump
) %>%
  mutate(
    pollscore = rnorm(n, mean = -1, sd = 0.2),  # Simulate pollster score
    pollster = sample(pollsters, n, replace = TRUE),  # Assign pollster from the list randomly
    state = sample(states, n, replace = TRUE),  # Assign states randomly
    end_date = sample(seq(as.Date("2024-10-05"), as.Date("2024-10-15"), by = "day"), n, replace = T),
    transparency_score = sample(transparency_scores, replace = TRUE, n),
    party = sample(partys, n, replace = TRUE)
  )



#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")
