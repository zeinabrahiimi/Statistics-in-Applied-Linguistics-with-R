# In this project, the independent-samples t-test would be performed in R. 
# This test is used when we want to compare whether two groups are the same or different on a specific dependent variable.


# Let's say we have an excel file containing two columns named "Gp" and "VocabRetention" for 100 students.
# In the "Gp" column, we have two groups, with each student being either a "1" (Native English Speaker) or a "2" (Non-native English Speaker).
# In the "VocabRetention" column, speakers' scores are ranged from 10 to 20. 
# Assuming we checked the normality assumptions of the data, we perform the independent-samples t-test.

# If not installed these libraries, please install them first and then load them.
# install.packages ("readxl") # install.packages("stats")
# Load required libraries

library(readxl) # If using Excel files
library(stats) # a library for data analysis
data <- read_excel("IndepT-testData.xlsx") # You should enter the name of your Excel file.


# Performing t-test in R straightforwardly! 
result <- t.test(VocabRetention ~ Gp, data = data)
# t-test : function
# VocabRetention ~ Gp : the formula showing that we want to compare  the "VocabRetention" scores based on the different levels in the "Gp" column

print(result)
# The variable result will store the output of the t-test analysis,
# including information about the t-statistic, degrees of freedom, p-value, and confidence interval, and sample estimates.


# Output


# t-value and p-value:

# The t-value is 23.87.
# The p-value is very close to zero: < 2.2e-16.

# Interpretation: The extremely low p-value indicates that there is a statistically
# significant difference in the mean vocabulary retention scores between the two groups.

# Confidence Interval:
# Lower bound: 4.328711
# Upper bound: 5.112698
# This means that we are 95% confident that the true difference in means between group 1 and group 2 lies within this interval.

# Sample Estimates

# Mean in group 1: 16.85185
# Mean in group 2: 12.13115

# The mean vocabulary retention score in group 1 is higher compared to the mean score in group 2.


