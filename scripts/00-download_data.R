### Preamble ###
# Purpose: Use opendatatoronto to get crime rate data by neighbourhood
# Author: Mengze Zhang
# Contact: mengze.zhang@mail.utoronto.ca
# Date: 2023-01-26
# Pre-requisites: None
# to-dos:


### Workspace setup ###
# install.packages("opendatatoronto")
# install.packages("tidyverse")
library(opendatatoronto)
library(tidyverse)

### Get dataset from Open Data Toronto ###
raw_data <-
  list_package_resources("neighbourhood-crime-rates") %>% 
  filter(name == "neighbourhood-crime-rates" ) %>% 
  get_resource()

### Save raw data ###
write_csv(raw_data, "inputs/data/raw_data.csv")

