# In this project, the Multiple Regression analysis would be performed in R. 
# This test is used when we want to understand the relationship between multiple independent variables 
# (also called predictors) and a single dependent variable (also called the outcome variable).

# Let's consider we have excel file for 100 students. It contains four columns named "Motivation", "Stress",
# "Confidence", scored on a scale from 1 to 10, and the outcome variable "Linguistics_Performance" 
# scored on a scale of 0 to 100. 
# Assuming we checked the normality assumptions of the data, we can perform multiple regression analysis to understand how "Motivation," "Stress," and "Confidence" predict
# "Linguistics_Performance."

# If not installed these libraries, please install them first and then load them.
# install.packages ("readxl") # install.packages("stats")
# Loading required libraries
library(readxl) # If using Excel files
library(stats) # a library for data analysis


# Reading the data from Excel
data <- read_excel("MultipleRegressionData.xlsx") # You should enter the name of your Excel file.

# Performing multiple regression
model <- lm(Linguistics_Performance ~ Motivation + Stress + Confidence, data = data)
#  the linear regression function lm()


# Printing the summary of the regression
summary(model)


# Coefficients:
# The coefficients represent the estimated relationships between the independent variables 
# and the dependent variable.

# Intercept: The intercept is 46.4008. 
# It represents the estimated average "Linguistics_Performance" score when all
# the independent variables ("Motivation," "Stress," and "Confidence") are set to zero.

# Motivation: For each unit increase in "Motivation," there is an estimated 
# increase of 1.7675 units in the "Linguistics_Performance" score.
# The p-value (9.74e-05) is very small, indicating that the relationship between 
# "Motivation" and "Linguistics_Performance" is statistically significant.

# Stress: For each unit increase in "Stress," there is an estimated increase of
# 1.0870 units in the "Linguistics_Performance" score.
# The p-value (0.07290) is greater than 0.05, indicating that the relationship 
# between "Stress" and "Linguistics_Performance" is not statistically significant
# at the conventional significance level of 0.05.

# Confidence: For each unit increase in "Confidence," there is an estimated increase of 
# 1.8796 units in the "Linguistics_Performance" score. 
# The p-value (0.000799) is very small, indicating that the relationship between
# "Confidence" and "Linguistics_Performance" is statistically significant.

# Multiple R-squared and Adjusted R-squared:
# The multiple R-squared value (0.2898) indicates that approximately 28.98% of
# the variability in "Linguistics_Performance" can be explained by the combination of
# "Motivation," "Stress," and "Confidence."


