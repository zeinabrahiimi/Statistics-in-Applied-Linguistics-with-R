# The main focus of this project is to answer the following research question.
# RQ: "Does the Correction Method have a significant effect on Writing Test Scores
# after controlling for the initial pretest scores?"


# Loading necessary libraries
library(stats)

# Installing and load the required libraries if you haven't already
install.packages("readxl")
library(readxl)

# Loading the dataset from the Excel file
ANCOVAdata <- read_excel("ANCOVA_Data.xlsx")


# Performing ANCOVA
ancova_result <- lm(WritingTestScore ~ CorrectionMethod + pretest_Score, data = ANCOVAdata)

# View the ANCOVA results
summary(ancova_result)


# Assuming you have already performed ANCOVA and stored the result in 'ancova_result'
library(heplots)

# Calculating partial eta squared for CorrectionMethod
partial_eta_squared_correction <- etasq(ancova_result, partial = TRUE, type = 2)

# Printing the result
print(partial_eta_squared_correction)



# The CorrectionMethod has a statistically significant and 
# practically significant effect on WritingTestScore (Partial eta squared = 0.7648)


# The pretest_Score does not have a statistically significant effect on WritingTestScore
# (Partial eta squared = 0.0239). Therefore, it does not seem to significantly impact# the writing test scores in this context.


# In summary, while the effect of the covariate (pretest score) may not be statistically or practically
# significant on its own, including it in the ANCOVA model can still improve the overall quality of 
# the analysis by controlling for potential confounding factors and increasing the precision of the main effect estimates. This can lead to more robust and reliable conclusions about the impact of CorrectionMethod on WritingTestScore.
