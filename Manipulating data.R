# import packages
library(tidyverse)

# Check what table looks like
as_tibble(travelmode)

# drop unwanted columns
travelmode <- subset(travelmode,
                     select = -c(X, gender))

# check columns have been droped
colnames(travelmode) 

# rename columns

travelmode <- travelmode %>%
              rename(waiting_time = wait,
                     vehicle_cost = vcost,
                     travel_time = travel,
                     general_cost = gcost,
                     family_size = size)
# check new table
head(travelmode)

# 1. Calculate the total costs for car clients only, and add these values to the initial data set. 

# create a new df and use subset add 'car' clients to new dataframe
car_costs <- subset(travelmode, mode == 'car')

# use mutate to add vehicle_cost and general_cost to get total_costs
car_costs <- car_costs %>%
  mutate(total_costs = vehicle_cost + general_cost)

# check head of df
head(car_costs)

# left join new df to main df
joined_travelmode <-left_join(travelmode, car_costs)

# check new df
head(joined_travelmode)

# because weve used a left join R returns all the rows from the left table(main df)
# and only the matching rows from the car_costs df. We can confirm no new 
# rows have been added by checking the dimensions

dim(joined_travelmode)

# 2. Create data frames for each travel mode for members with families.

air_family <- select( filter(travelmode, family_size >= 2, # filter and select the condition
                             mode == 'air'),
                      c('individual',choice:family_size)) # choose the columns you want to keep
# check table
head(air_family)

train_family <- select( filter(travelmode, family_size >= 2, # filter and select the condition
                             mode == 'train'),
                      c('individual',choice:family_size)) # choose the columns you want to keep

bus_family <- select( filter(travelmode, family_size >= 2, # filter and select the condition
                             mode == 'bus'),
                      c('individual',choice:family_size)) # choose the columns you want to keep

car_family <- select( filter(travelmode, family_size >= 2, # filter and select the condition
                             mode == 'car'),
                      c('individual',choice:family_size)) # choose the columns you want to keep


# 3. Find the preferred travel mode for families.
# From these new dataframes we can find out which type of travelmode families prefer

# use the count function to count the yes and no values in the coice column to see if clients prefer
# air travel or not and the do the same for all the other modes
air_family %>%
  count(choice)

train_family %>%
  count(choice)

bus_family %>%
  count(choice)

car_family %>%
  count(choice)

# 4. Calculate the average vehicle cost and general costs for members with families.

mean_car_costs <- summarise(car_family, mean_VC = mean(vehicle_cost), # use summarise to calculate the mean of vehicle cost and put the result in a new column
                            mean_GC = mean(general_cost)) # do the same as above for general cost

# see the results in a small dataframe
mean_car_costs

# we use similiar codes for bus and train modes
mean_bus_costs <- summarise(bus_family, mean_VC = mean(vehicle_cost), 
                            mean_GC = mean(general_cost))

mean_bus_costs

mean_train_costs <- summarise(train_family, mean_VC = mean(vehicle_cost), # use summarise to calculate the mean of vehicle cost and put the result in a new column
                            mean_GC = mean(general_cost))

mean_train_costs

# 5. Create a data frame that contains this data for land-based travel modes, arranged by mean general costs.

# now we put this results in a dataframe using rbind function
mean_costs <- rbind(mean_car_costs, mean_bus_costs,mean_train_costs)

# display new df
mean_costs

# we see the results in a df but were not sure which mode results belong to
# we can create a new column with car, train and bus and add this to df using cbind

vehicle <- c('car','bus', 'train')
mean_costs <- cbind(vehicle,mean_costs)

#check new df
mean_costs

# now we cansee what result belongs to what vehicle type.
# Now lets arrange the dataset in ascending order using mean_GC
arrange(mean_costs, desc(mean_GC))

# Save the dataframe
setwd('/Users/hamdihassan/Desktop/Data Analysis training/R_codes/Data_Output')

write.csv(travelmode, file = '/Users/hamdihassan/Desktop/Data Analysis training/R_codes/Data_Output/travelmode.csv')

getwd()




