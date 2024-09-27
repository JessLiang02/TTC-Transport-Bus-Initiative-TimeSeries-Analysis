#### Preamble ####
# Purpose: Tests the simulated data and cleans data for the TTC Transport Bus Initiative Analysis.
# Author: Jing Liang
# Date: 24 September 2024
# Contact: jess.liang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Ensure that the simulated data and the clean data is saved and available.

#### Workspace setup ####
library(tidyverse)

#### Tests for simulated data ####
# Reads the simulated data in
simulated_transport_data <- read.csv("data/00-simulated_data/ttc_bus_simdata.csv", header = T)

# Test 1: Check the "Date" column ranges from November 15, 2023 to April 15, 2024
test_date_range <- min(simulated_transport_data$Date) == as.Date("2023-11-15") &&
  max(simulated_transport_data$Date) == as.Date("2024-04-15")
test_date_range # Should return TRUE if the dates are correct

# Test 2: Ensure that there are no negative values in the "Total Clients", "Clients_transported", and "Clients_stationary" columns
test_no_negative_values <- all(simulated_transport_data$Total_clients >= 0) &&
  all(simulated_transport_data$Clients_transported >= 0) &&
  all(simulated_transport_data$Clients_stationary >= 0)
test_no_negative_values # Should return TRUE if no negative values exist

# Test 3: Check that Total clients is always equal to the sum of Clients transported and Clients stationary
test_clients_sums <- all(simulated_transport_data$Total_clients ==
  (simulated_transport_data$Clients_transported + simulated_transport_data$Clients_stationary))
test_clients_sums # Should return TRUE if the sums are valid

#### Tests for clean data ####
# Reads the clean data in
clean_transport_data <- read.csv("data/02-analysis_data/ttc_bus_cleandata.csv", header = T)

# Test 1: Check the "Date" column ranges from November 15, 2023 to April 14, 2024
test_date_range <- min(clean_transport_data$Date) == as.Date("2023-11-15") &&
  max(clean_transport_data$Date) == as.Date("2024-04-14")
test_date_range # Should return TRUE if the dates are correct

# Test 2: Ensure that there are no negative values in the "Clients", "Clients_transported", and "Clients_stationary" columns
test_no_negative_values <- all(clean_transport_data$Clients >= 0) &&
  all(clean_transport_data$Clients.transported >= 0) &&
  all(clean_transport_data$Clients.stationary >= 0)
test_no_negative_values # Should return TRUE if no negative values exist

# Test 3: Check that Total clients is always equal to the sum of Clients transported and Clients stationary
test_clients_sums <- all(clean_transport_data$clients ==
  (clean_transport_data$Clients.transported + clean_transport_data$Clients.stationary))
test_clients_sums # Should return TRUE if the sums are valid
