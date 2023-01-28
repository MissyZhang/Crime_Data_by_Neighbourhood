#### Preamble ####
# Purpose: Clean the data downloaded from Open Data Toronto
# Author: Mengze Zhang
# Date: 2023-01-26
# Contact: mengze.zhang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
# install.packages("janitor")
library(janitor)

### Read in the raw data ###
raw_data<- read.csv("inputs/data/raw_data.csv")

### Select variables of interest ###
names(raw_data)
reduced_data<-
  raw_data %>% 
  select(HoodName,
         F2021_Population_Projection,
         Assault_Rate2017,
         Assault_Rate2018,
         Assault_Rate2019,
         Assault_Rate2020,
         Assault_Rate2021,
         AutoTheft_Rate2017,
         AutoTheft_Rate2018,
         AutoTheft_Rate2019,
         AutoTheft_Rate2020,
         AutoTheft_Rate2021,
         BreakAndEnter_Rate2017,
         BreakAndEnter_Rate2018,
         BreakAndEnter_Rate2019,
         BreakAndEnter_Rate2020,
         BreakAndEnter_Rate2021,
         Robbery_Rate2017,
         Robbery_Rate2018,
         Robbery_Rate2019,
         Robbery_Rate2020,
         Robbery_Rate2021,
         TheftOver_Rate2017,
         TheftOver_Rate2018,
         TheftOver_Rate2019,
         TheftOver_Rate2020,
         TheftOver_Rate2021,
         Homicide_Rate2017,
         Homicide_Rate2018,
         Homicide_Rate2019,
         Homicide_Rate2020,
         Homicide_Rate2021,
         Shootings_Rate2017,
         Shootings_Rate2018,
         Shootings_Rate2019,
         Shootings_Rate2020,
         Shootings_Rate2021,
         TheftfromMotorVehicle_Rate2017,
         TheftfromMotorVehicle_Rate2018,
         TheftfromMotorVehicle_Rate2019,
         TheftfromMotorVehicle_Rate2020,
         TheftfromMotorVehicle_Rate2021,
         )
rm(raw_data)


### Clean data ###
cleaned_data<- clean_names(reduced_data) %>% 
  rename(population2021 = f2021_population_projection) 
rm(reduced_data)


### Save cleaned data ###
write_csv(cleaned_data, "inputs/data/cleaned_data.csv")
