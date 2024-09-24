#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto.
# Author: Jing Liang
# Date: 23 September 2024 
# Contact: jess.liang@mail.utoronto.ca
# License: MIT
# Pre-requisites: installation and loading of R package "opendatatoronto".


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
# Conduct a search for available data files that are related to the "Transport Bus Initiative Usage"
data_packages <- search_packages("Transport Bus Initiative Usage")
# Retreive all the resources available within the data files
data_resources <- data_packages %>%
  list_package_resources()
# Retrieve the second resource (the .csv file)  and save it as a dataframe
raw_data <- data_resources[2,] %>%
  get_resource()

#### Save data ####
write_csv(raw_data, "data/raw_data/ttc_bus_rawdata.csv") 

