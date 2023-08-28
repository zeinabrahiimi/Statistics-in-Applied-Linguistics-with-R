# Let's say we have an excel file containing 100 scores of grammar and speaking.
# The dataset is in the repo.
# Then, we want to check whether they are correlated with one another.
 

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

# Scatter plot
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


