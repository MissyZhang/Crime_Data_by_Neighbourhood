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
number_of_crime_types <-4

simulated_data<-
  tibble(
    Neighborhood = c(
        rep(x = "Downtown", number_of_years*number_of_crime_types),
        rep(x = "North_York", number_of_years*number_of_crime_types),
        rep(x = "Mississauga", number_of_years*number_of_crime_types),
        rep(x = "Scarborough", number_of_years*number_of_crime_types)
    ),
    crime_type =c(
      rep(x= "Assault", number_of_neighborhoods*number_of_years),
      rep(x= "Breakin", number_of_neighborhoods*number_of_years),
      rep(x= "Shooting", number_of_neighborhoods*number_of_years),
      rep(x= "Theft", number_of_neighborhoods*number_of_years)
    ),
    year = rep(c(2017:2021), number_of_neighborhoods*number_of_crime_types),
    crime_rate = runif(
      n = number_of_years*number_of_neighborhoods*number_of_crime_types,
      min = 0,
      max = 100 
    )
  )

# Write some tests for the simulated dataset
## Check if the values in the crime_rate column are all numbers
simulated_data$crime_rate |> class() == "numeric"

## Check if the neighborhood is exclusively one of these four: Downtown, North_York, Mississauga, and Scarborough
simulated_data$Neighborhood |>
  unique() == c(
    "Downtown",
    "North_York",
    "Mississauga",
    "Scarborough"
  )

## Check if the dataset contains the expected number of unique values for each column
simulated_data$Neighborhood |>
  unique() |>
  length() == number_of_neighborhoods
simulated_data$crime_type |>
  unique() |>
  length() == number_of_crime_types
simulated_data$year |>
  unique() |>
  length() == number_of_years

## Check if the year is no smaller than 2017 and no larger than 2021, and is an integer
simulated_data$year |> min() == 2017
simulated_data$year |> max() == 2021
simulated_data$year |> class() == "integer"


