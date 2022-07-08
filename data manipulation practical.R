#Open RStudio, and prepare your workstation by importing the necessary libraries and the data set (seatbelt.csv). 
seatbelts <- read.csv(file.choose(), header = TRUE)
#Use the View() and as_tibble() functions to sense-check the data set. 
as_tibble(seatbelts)
View(seatbelts)
#Determine whether there are missing values and how to address them if there are. 
## are there missing values
is.na(seatbelts))

## how many missing values
sum(is.na(seatbelts))

# Identify what columns the missing values are in 
apply(is.na(seatbelts), 2, which)

#Compare the sum of missing values for the whole data set with the sum of missing values for the seatbelt column. 

## sum of missing values for entire dataset
sum(is.na(seatbelts))

## sum of missing values for seatbelt column
sum(is.na(seatbelts$seatbelt))

#Replace the missing values with 0. (Hint: dataframe[is.na(dataframe)] <- 0)

seatbelts[is.na(seatbelts)]<- 0

View(seatbelts)

#Determine whether there are still missing values.
sum(is.na(seatbelts))

#Determine whether the data set is normally distributed. Use the summary() function.
summary(seatbelts)

#Compile a data profile report with the DataExplorer() function.
DataExplorer:: create_report(seatbelts)

##Perform data manipulation as follows:
#Delete unnecessary columns. (Hint: The X column is the same as the row number.)
seatbelts <- select(seatbelts, c(- X))

#Keep only the numeric columns with the subset() function. (Hint: dataframe<- dataframe %>% keep(is.numeric).)
seatbelts2 <- seatbelts %>%
                      keep(is.numeric)

#Sense-check the new data frame with the head() function.
head(seatbelts)

#Round all the columns to two decimal places. (Hint: dataframe <- round(dataframe, 2).)
seatbelt2 <- round(seatbelts2, 2)

#Sense-check the new data frame with the head() function.
head(seatbelts)

#Determine whether the columns are normally distributed with a boxplot. (Hint: boxplot(dataframe$column_name).)

boxplot(seatbelts2$miles)
boxplot(seatbelts2$fatalities)
boxplot(seatbelts2$age)
boxplot(seatbelts2$income)

#Calculate the sum, max, and min of all the columns with the apply() function. Round the answers to two decimal places. (Hint: This might indicate whether the data is normally distributed.)

round(apply(seatbelts2[,-1], 2, sum), 2) # sum for all columns with year excluded
round(apply(seatbelts2[,-1], 2, max), 2)
round(apply(seatbelts2[,-1], 2, min), 2)

#Based on the aggregate results, determine which columns can be used for data analysis and your approach to the analysis.

# compare state, year and miles
miles <- select(seatbelts, (c("state", "year", "miles")))

as_tibble(miles)

d.ages <- select(seatbelts, (c("drinkage", "year", "miles")))

as_tibble(d.ages)
