# 1. Creating a data frame for a book store

# create a list of objects containing the numeric values 10,20,30,40
a <- c(10,20,30,40)
# create a list object containing strings
b <- c('R_for_data_science', 'R_for_dummies',
      'The_philosophy_of_R', 'R_in_a_Nutshell')
# create a list object conatining boolean values
c <- c(TRUE, FALSE, FALSE, TRUE)
# create a list object containing numeric values
d <- c(11.25, 18, 22.8, 15)

# create df by using data.frame() and including a,b,c,d list objects
df <- data.frame(a,b,c,d)

# display df
df

# 2. Customise df
#use names (df) funtion to change column names
names (df) <- c('ID','books','loan_status','price')
df

# we can also return the structure of the df by using str()
str(df)


# 3. Slice data from a data frame

# Extract the element in the 1st row of the 2nd column:
df [1, 2] 

# Extract an entire column or row
df[1:2, ] # extract the first and second rows

# Extract the first two rows of the first two columns
df[1:2, 1:2]

# Slice using column names by using c() function to call column names
df[, c('ID','price')]

# 4. Manipulate a data frame

# adding a new column to a data fram

# first create an object list
age <- c(10,35,40,5)
# add the new object to the data frame
df$age <- age
df

# use $ to select a column
df$age

# Use subset() to select subset of a specific column
# example: finding specific informaton about book with an ID of 10

subset(df, ID== 10)

subset()