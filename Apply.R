# The apply() function

# Apply() funtion: Matrix

# 1. Create a matrix

sales <- matrix (c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 
                   10, 30, 40, 50, 70, 85, 95, 110, 120, 125,
                   15, 20, 25, 35, 45, 55, 65, 70, 85, 95,
                   12, 20, 28, 35, 49, 60, 71, 80, 95, 105,
                   9, 15, 26, 38, 45, 59, 75, 85, 99, 110),
                 nrow=10, byrow=FALSE)

# a. Specifiy row names

rownames(sales) <- c("w1", "w2", "w3", "w4", "w5", "w6", "w7", 
                     "w8", "w9", "w10")

# b. specify column names

colnames(sales) <- c("t1", "t2", "t3", "t4","t5" )

sales # c. print matrix

class(sales) d. #verify the data structure

# 2. Interrogate the matrix

# a. what is the highest value in the first row


# we use the max() function and set the margin to 1
max(sales [1,])

# Now lets find out the max sales for all 10 weeks(each week).
# To do this without repeating the code 10 times we use apply()

apply(sales, 1, max) # R returns a list containing the weeks and corresponding values

# Now we want the mean sales of each store
apply(sales, 2, mean)


# Apply() funtion DataFrame

# 1. Build a new data frame

# Lets the cahnge the sales matrix above into a data frame
sales.df = data.frame(sales)

sales.df

class(sales.df)


# 2. Interrogate the data frame

# Lets determine the means sales per week across the five stores
apply(sales.df, 1, mean)

# Apply() funtions: Other options

# 1. Exclude columns
# We want the mean sales of all stores except t2?

apply(sales.df [, -2], 2, mean) # [, -2] right after the object is used to drop column 2 from the calculation

# what if we want to exclude column 10 as well
apply(sales.df [-10,-2], 2, mean) # now we have excluded a row and a column, the row always goes first

# 2. Change the values

#What if we have missing values in a data frame? Can we still use the apply() function? 
#Let’s change the value of Row 1 and Column 5 to NA. To do this:

sales.df[1,5] <- NA
sales.df

# Now we will calculate the min sales per store excluding the NA value
apply(sales.df, 2, min, na.rm =TRUE) # na.rm=TRUE indicates that NA value needs to be ignored

# THE lapply() function

# we use the lapply() function on lists and other data structures to return a list
# because it returns a list the lapply does not need a margin

# 1. create a new list

sales.number <- list(t1 = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                     t2 = c(10, 30, 40, 50, 70, 85, 95, 110, 120, 125),
                     t3 = c(15, 20, 25, 35, 45, 55, 65, 70, 85, 95),
                     t4 = c(12, 20, 28, 35, 49, 60, 71, 80, 95, 105),
                     t5 = c(9, 15, 26, 38, 45, 59, 75, 85, 99, 110))

sales.number
class(sales.number)


# 2. Interrogate the list

# determine the mean sales in the sales.number list

lapply(sales.number, mean) # the output is returned as list

# lapply() function: Data Frame

# 1. create a new data frame

computers.df <- data.frame(sales)

computers.df
class(computers.df)

# 2. Interrogate the data frame

# Calculate the sd for each store
lapply(computers.df, sd)

# sapply() function:

# same as lapply but simplifies the output to the most basic data structure

# 1. interrogate list

sapply(sales.number, mean)

# what if your data set is a data frame

sapply(computers.df, mean)




