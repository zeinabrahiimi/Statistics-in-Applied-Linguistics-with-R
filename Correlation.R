# In this project, the correlation analysis would be performed in R. 
# This test is used when we want to assess the strength and direction of the
# relationship between two variables.


# Let's say we have an excel file containing 100 scores of grammar and speaking.
# Assuming we checked the normality assumptions of the data, we can use correlation analysis 
# to understand whether changes in grammar scores are connected with changes in speaking scores.
 

#if not installed these libraries, please install them first and then load them.
# install.packages ("readxl") install.packages ("ggplot2") # install.packages("stats")
library(readxl) # a library for reading excel files
library(ggplot2) # a library for visualization
library(stats) # # a library for data analysis

# Read the Excel file (CorrelationData.xlsx with two columns named gr_Score 
# and sp_Score) into a data frame.

data <- read_excel("CorrelationData.xlsx")

#First, we check the Descriptive Stats. and visualize the relationship between
# grammar scores and speaking scores.

# Descriptive statistics
summary(data) # It shows Min, 1st Qu, Median, Mean, 3rd Qu., and Max

# Create a scatter plot to visualize the relationship between grammar and speaking scores.

ggplot(data, aes(x = gr_Score, y = sp_Score)) +
  geom_point() +
  labs(title = "Scatter Plot of Grammar Scores vs. Listening Scores",
       x = "Grammar Score", y = "Speaking Score")

# Correlation Analaysis
# Now, we calculate the correlation coefficient between grammar scores and 
# speaking scores. 

correlation <- cor(data$gr_Score, data$sp_Score)

# Print the correlation coefficient
print(paste("Correlation Coefficient:", correlation)) 

# output: "Correlation Coefficient: 0.504050860415546"

# As the result shows, there is a moderate positive correlation between grammar scores and speaking scores. 
# This means that as grammar scores increase, speaking scores tend to increase as well, and vice versa.
