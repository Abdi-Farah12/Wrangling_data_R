
# 2 options to remove columns
wages2 <- subset (wages, select = -c(sex,region))

wages3 <- select(wages, -sex, -region)

# let’s select all 25 year-olds who earn more than 110.

filter(wages2,
       age == 25, daily_wage > 110)

# Order observations (arrange)

# sort by race, job_class,education
arrange(wages2,
        race, job_class, education)

# sort by age descending
arrange(wages, desc(age))

# Adding a new column using mutate as functions of existing columns

mutate(wages, 
       new_var = daily_wage/logwage)


