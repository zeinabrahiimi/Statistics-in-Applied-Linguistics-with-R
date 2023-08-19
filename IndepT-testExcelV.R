# Read the Excel file into a data frame
data <- read.csv("Indept-test.csv")


# Perform the independent t-test
result <- t.test(Score ~ Gp, data = data)

# View the result
print(result)
