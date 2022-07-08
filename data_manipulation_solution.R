# LSE Data Analytics Online Career Accelerator
# DA301: Advanced Analytics for Organisational Impact

# Practical activity: Data manipulation in R

###############################################################################
# This is the solution to the practical activity

# So far, you have learned to explore a data set and manipulate data based on 
# the I4U case study and the travel mode data set. Now it's time to apply your 
# learning in a practical activity. You will continue with the I4U case study 
# but with a new data set this time. 

# During your morning team meeting, Ryan asks you to complete the following:
# - Import the CSV file into RStudio.
# - Explore and sense-check the data set.
# - Create a data profile report with the DataExplorer() function.
# - Perform data manipulation.
# - Present a suitable visualisation of the data set.

###############################################################################

# 1. Prepare your workstation

# import libraries - this might take a minute or so
# whole tidyverse package
library(tidyverse)
# Useful for importing data
library(readr) 
#Useful for data wrangling
library(dplyr) 
#Useful for data wrangling
library(tidyr) 
# Useful for creating tidy tables
library(knitr) 
# useful for working with vectors and functions
library(purrr)
# useful to create insightful summaries of data set
library(skimr)
# useful to create insightful reports on data set
library(DataExplorer)


# import CSV file into R
seatbelt <- read.csv (file.choose (), header = T)

# sense-check data set
as_tibble(seatbelt)

View(seatbelt)



##############################################################################

# 2. Understand your data set

# sum of missing values 
sum(is.na (seatbelt))

sum(is.na (seatbelt$seatbelt))


# replace NA with 0
seatbelt[is.na(seatbelt)] = 0
head(seatbelt)

sum(is.na (seatbelt$seatbelt))

#to get the gist of the data
summary(seatbelt)

DataExplorer::create_report(seatbelt)

# Drop column X
seatbelt_df <- subset(seatbelt, select = -c(1))
head(seatbelt_df)


seatbelt1 <- seatbelt_df %>% keep(is.numeric)
# round all the columns
seatbelt1 <- round(seatbelt1, 2)
head(seatbelt1)

##############################################################################

# 3. Visualise data set

# visualise data with boxplot to determine normal 
# distribution of separate columns
boxplot(seatbelt1$miles)
boxplot(seatbelt1$fatalities)
boxplot(seatbelt$income)
boxplot(seatbelt$age)
boxplot(seatbelt$seatbelt)


###############################################################################

# 4. Perform data manipulation

aseatbelt1 <- apply(seatbelt1, 2, sum)
aseatbelt1 <- round(aseatbelt1, 2)
head(aseatbelt1)
# we can see the the sum of the coulmns is show below only for fatalities and
# income it makes sense to use sum for rest it
# doesn't make any sense

# optional
# lseatbelt1 <- lapply(seatbelt1, min)
# lseatbelt1
# we can see that min values tells us that in the data min miles a car 
# travelled is 3099, earliest year is 1983, 
# min income is 8372 and the age is 28.23


seatbelt1 <- seatbelt %>% keep(is.numeric)
sseatbelt1 <- sapply(seatbelt1, min)
sseatbelt1 <- round(sseatbelt1, 2)
sseatbelt1



seatbelt1 <- seatbelt %>% keep(is.numeric)
sseatbelt1 <- sapply(seatbelt1, max)
sseatbelt1 <- round(sseatbelt1, 2)
sseatbelt1
# we can see that min values tells us that in the data max miles a car
# travelled is 285612, farthest year is 1997, 
# min income is 35863 and the age is 39.16

#further drill down using aggregate function


##########################################################################


seatbelt_agg <- select(seatbelt, c("state", "year", "miles"))
as_tibble(seatbelt_agg)

agg1 = seatbelt_agg %>% group_by(state) %>% summarize(cnt_rows = n(),
                                                      min_year = min(year),
                                                      max_year = max(year), 
                                                      Avg_miles = mean(miles)) %>% arrange(desc(Avg_miles))
as_tibble(agg1)
#from this we can derive that the data is normally distributed among the state 
# as each state only has 15 rows, min and max year 
#is also same for all the states and Average miles states that CA is the one 
# with highest traffic miles as we sorted it by traffic miles

#further drill down using aggregate fucntion
seatbelt_agg <- select(seatbelt, c("drinkage", "year", "miles"))
agg1 = seatbelt_agg %>%  group_by(drinkage) %>% summarize(cnt_rows = n(), 
                                                          min_year = min(year), 
                                                          max_year = max(year), 
                                                          Avg_miles = mean(miles))  %>% arrange(desc(Avg_miles))
as_tibble(agg1)
#from this we can derive that the data is not normally distributed among the 
# drinkage, min year is same but max year 
#is not the same for all the drinkage and Average miles is higher in drinkage 
# yes as there are more number of records for it


###############################################################################


# 5. Save your R script


##############################################################################


