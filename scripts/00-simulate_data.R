#### Preamble ####
# Purpose: Simulates data for the TTC Transport Bus Initiative Analysis.
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
      lambda = 18
    ), # Assume 18 average clients transported per day
    # Simulate the number of clients stationary using a Poisson distribution
    Clients_stationary = rpois(length(seq(as.Date("2023-11-15"), as.Date("2024-04-15"), by = "day")),
      lambda = 7
    ), # Assume 7 average clients stationary per day
    # The total number of total clients is the total of "Clients_transported" and "Clients_stationary"
    Total_clients = Clients_transported + Clients_stationary
  )

# Show the first few rows of simulated data
head(simulated_transport_data)

# Saves the simulated data for testing
write.csv(simulated_transport_data, "data/00-simulated_data/ttc_bus_simdata.csv")
