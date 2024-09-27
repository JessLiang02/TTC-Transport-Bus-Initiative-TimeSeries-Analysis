#### Preamble ####
# Purpose: Cleans data for the TTC Transport Bus Initiative Analysis.
# Author: Jing Liang
# Date: 24 September 2024
# Contact: jess.liang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Ensure that you have a functioning version of R installed and properly running.

#### Workspace setup ####
library(tidyverse)

#### Cleans data ####
# Reads in raw data
raw_data <- read.csv("data/01-raw_data/ttc_bus_rawdata.csv", header = T)
# Remove unwanted columns
cleaned_data <- raw_data |> select(-X_id)
# Saves the clean data for analysis
write.csv(cleaned_data, "data/02-analysis_data/ttc_bus_cleandata.csv", row.names = F)
