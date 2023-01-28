### Preamble ###
# Purpose: simulate the dataset of Toronto crime data
# Author: Mengze Zhang
# Contact: mengze.zhang@mail.utoronto.ca
# Date: 2023-01-27
# Pre-requisites: None


# Create simulated data
set.seed(853)
number_of_years <- 5
number_of_neighborhoods <- 4

simulated_data<-
  tibble(
    Neighborhood = c(
        rep(x = "Downtown", number_of_years),
        rep(x = "North_York", number_of_years),
        rep(x = "Mississauga", number_of_years),
        rep(x = "Scarborough", number_of_years)
    ),
    year = rep(c(2017:2021), number_of_neighborhoods),
    crime_cases = round(runif(
      n = number_of_years*number_of_neighborhoods,
      min = 0,
      max = 1000 
    ))
  )

