# 1. Import and sense check data
#import the CO2 data set
library(tidyverse)
data("CO2")
#sense-check the imported data
View(CO2)
#view the data set dimensions
dim(CO2)

# 2. Determine the mean CO2 uptake (one subset)

# [1] Specify the function as aggregate(), and [2] specify the numeric variable (uptake), 
#the grouping variable (conc), the data source (as C02), and the mean:

# mean
aggregate(uptake~conc, CO2, mean)

# sum
aggregate(uptake~conc, CO2, sum)

# standard deviation
aggregate(uptake~conc, CO2, sd)

# 3. Determine the mean CO2 uptake(multiple subsets)

# [1] Specify the function as aggregate(), and [2] specify the numeric variable (uptake), 
#the grouping variable (conc), the additional grouping 
#variable (treatment), the data source, and the mean:

aggregate(uptake~conc+Treatment, CO2, mean)


