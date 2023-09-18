# This project is all about answering this research question:
# "Does the correction method impact writing test scores?"" Writing scores 
# for three correction methods (i.e., self-correction, peer correction, and teacher correction) 
# can be compared using one-way ANOVA. That is, the background variable is the correction method, 
# and the outcome variable is students’ writing scores.
# the correction method (the factor variable) is categorized into three levels: 
# 1: self-correction
# 2: peer correction
# 3: teacher correction



# Installing and loading the readxl libraries
install.packages("readxl")
library(readxl)

# Loading the dataset from the Excel file
ANOVAdata <- read_excel("OneWayANOVA_Data.xlsx")

# If we want to know more about the dataset..
head(ANOVAdata) # Displaying the first few rows of the dataset
str(ANOVAdata) # The structure of the dataset

# Before we run the test, one of the important assumptions of running ANOVA must be met,
# which is Levene's test for homogeneity of variances/testing the equality of variances between groups.

# Using the leveneTest() function from the "car" package. 

install.packages("car")
library(car)

# Levene's test is used when we have one categorical explanatory variable (factor) and one
# quantitative response variable.
# Since R didn't recognize the CorrectionMethod as a categorical v., we would convert it to a factor:

ANOVAdata$CorrectionMethod <- as.factor(ANOVAdata$CorrectionMethod)

# Running Levene's test:
Levene_test <- leveneTest(WritingTestScore ~ CorrectionMethod, data = ANOVAdata)
print(Levene_test)

# Output:
# Levene's Test for Homogeneity of Variance (center = median)
#       Df F value Pr(>F)
#group   2  0.1139 0.8925
#      112 

#Interpretation:
# The result shows that the group variances are not significantly different.
# Thus, the homogeneity of variance assumption for group comparisons was met (i.e., p > 0.05).
# Now we perform one-way ANOVA using "aov" function.


# Performing one-way ANOVA
ANOVA_Result <- aov(WritingTestScore ~ CorrectionMethod, data = ANOVAdata)
# Viewing the ANOVA results
summary(ANOVA_Result)


# Output:                   Df Sum Sq Mean Sq F value Pr(>F)    
# CorrectionMethod   2  456.0  228.00   181.4 <2e-16 ***
#  Residuals        112  140.7    1.26                   
# ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Interpretation:
# The ANOVA result shows that The results for The F- value was 181.44 which was
# statistically significant at 0.05.


# Now, to measure the effect size, we calculate the partial eta squared.
# Installing the "heplots" package

install.packages("heplots")
library(heplots)


# Calculating partial eta squared
partial_eta_squared <- etasq(ANOVA_Result)
print(partial_eta_squared)

# Output:
# Partial eta^2
# CorrectionMethod     0.7641576
# Residuals                   NA

# Interpretation:
# The partial eta squared effect size (η2) was 0.764. 
# This was a significant result with a large effect size that indicates that nearly 76% of
# the variance between total writing scores on learners was accounted for by the correction methods.



# The results indicates a significant and 
# strong effect of correction methods on the writing scores 
# (F(2,112) = 181.447, p < 0.05, partial η2 = 0.764).




# To perform Scheffe's test, we should first install the "lmom" package and then install "DescTools" package.
install.packages("lmom")
install.packages("DescTools")
library(lmom)
library(DescTools)

# Performing Scheffe's test
scheffe_result <- ScheffeTest(ANOVA_Result, "CorrectionMethod")

# Printing the Scheffe's test results
print(scheffe_result)

# Output:
#   Posthoc multiple comparisons of means: Scheffe Test 
# 95% family-wise confidence level

# $CorrectionMethod
# diff    lwr.ci    upr.ci    pval    
# 2-1 -2.216667 -2.838504 -1.594830 1.3e-13 *** 
#  3-1 -5.096405 -5.761448 -4.431362 < 2e-16 ***
#  3-2 -2.879739 -3.511655 -2.247823 < 2e-16 ***
  
#  ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
 

# In summary, the Scheffe test results suggest that there are significant differences 
# in mean writing test scores between all pairs of correction methods (SELF-CORRECTION vs. 
# PEER-CORRECTION, SELF-CORRECTION vs. TEACHER-CORRECTION, and PEER-CORRECTION vs. TEACHER-CORRECTION).
