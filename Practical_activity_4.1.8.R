# Create 6 object lists and combine into a data frame

Name <- c('Donna','Anthea','Yusuf','Bongile',
          'Abe','Quentin','Tracy','Bilal',
          'Victoria', 'Indira')

Last_name <- c('Watusi','Smits','Zayeed','Maleson',
               'Dawidowitz','Ng','Jacks','Ghani',
               'LeGrande','De Silva')

Gender <- c('F','F','M','F','M','N','F','M','F','F')

Age <- c(38,29,44,24,66,34,55,40,38,29)

Email <- c('donnaw@gotmail.co.uk','as@workmail.co.nz',
           'yusufzz@glammail.com','bongi1@workmail.co.uk',
           'papabe@oldmail.com','qng7@mailio.com',
           'tracy@blurredv.co.uk','bghani2@mailio.com',
           'beachh@glammail.com','indigirl@workmail.com')

Purchases <- c(24,16,28,33,21,30,28,21,22,32)

# create boo_df by combining lists using data.frame
book_df <- data.frame(Name,Last_name, Gender, Age, Email, Purchases)

# print data frame
print(book_df)

# check df type
typeof(book_df)

# check class
class(book_df)

# check df dimensions
dim(book_df)

# Change column names to uppercase
names(book_df) <- c('Name', 'Last_Name', 'Gender', 'age', 'Email', 'Purchases')

book_df

# Add a new ID column to the data frame 

# Creat a new list object for ID
ID <- c(2101:2110) # this will create new ID numbers between 2101 and 2110

# add new column to df
book_df$ID <- ID
#print df
book_df

# find all of the female customers using subset()
subset(book_df, Gender == 'F')

# find all customers over the age of 50
subset(book_df, age >= 50)

# find all customers with fewer than 20 purchases
subset(book_df, Purchases < 20)
