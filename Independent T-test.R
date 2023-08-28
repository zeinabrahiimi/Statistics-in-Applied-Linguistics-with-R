# Load the mtcars dataset (it is built-in, so no need to install any additional package)
data(mtcars)

# Conduct the independent sample t-test

result <- t.test(mpg ~ am, data = mtcars)

# t-test >>>> This is the R function used to perform the t-test. 

#mpg ~ am: This part specifies the formula for the t-test. 
# It tells R to compare the mpg (miles per gallon) values based on the levels of the am (transmission type)
# variable. 
# In this case, we are comparing the mpg values of automatic transmission cars (am = 0)
# and manual transmission cars (am = 1).

# View the result
print(result)