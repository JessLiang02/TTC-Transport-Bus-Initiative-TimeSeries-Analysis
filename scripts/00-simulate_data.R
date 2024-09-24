#### Preamble ####
# Purpose: Simulates data for the TTC Transport Bus Initiative.
# Author: Jing Liang
# Date: 24 September 2024 
# Contact: jess.liang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Ensure that you have a functioning version of R installed and properly running.

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(123)
simulated_transport_data <- 
  tibble(
    # Simulate dates from November 15, 2023, to April 15, 2024
    Date = seq(as.Date("2023-11-15"), as.Date("2024-04-15"), by = "day"),
    # Simulate the number of clients transported using a Poisson distribution
    Clients_transported = rpois(length(seq(as.Date("2023-11-15"), as.Date("2024-04-15"), by = "day")), 
                                lambda = 18),  # Assume 18 average clients transported per day
    # Simulate the number of clients stationary using a Poisson distribution
    Clients_stationary = rpois(length(seq(as.Date("2023-11-15"), as.Date("2024-04-15"), by = "day")), 
                               lambda = 7),  # Assume 7 average clients stationary per day
    # The total number of total clients is the total of "Clients_transported" and "Clients_stationary"
    Total_clients = Clients_transported + Clients_stationary
  )

# Show the first few rows of simulated data
head(simulated_transport_data)

#### Tests for simulated data ####
# Test 1: Check the "Date" column ranges from November 15, 2023 to April 15, 2024
test_date_range <- min(simulated_transport_data$Date) == as.Date("2023-11-15") &&
  max(simulated_transport_data$Date) == as.Date("2024-04-15")
test_date_range  # Should return TRUE if the dates are correct

# Test 2: Ensure that there are no negative values in the "Clients", "Clients_transported", and "Clients_stationary" columns
test_no_negative_values <- all(simulated_transport_data$Clients >= 0) &&
  all(simulated_transport_data$Clients_transported >= 0) &&
  all(simulated_transport_data$Clients_stationary >= 0)
test_no_negative_values  # Should return TRUE if no negative values exist

# Test 3: Check that Total clients is always equal to the sum of Clients transported and Clients stationary
test_clients_sums <- all(simulated_transport_data$Total_clients ==
                           (simulated_transport_data$Clients_transported + simulated_transport_data$Clients_stationary))
stest_clients_sums  # Should return TRUE if the sums are valid


