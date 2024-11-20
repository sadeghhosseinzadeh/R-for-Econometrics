# 9.Hypothesis Testing
# ==================================================================================================

# A. normality: Shapiro-Wilk test
# B. coefficient significance: t-test, F-test


# Clear the environment
rm(list = ls())

# Install and load necessary packages
required_packages <- c("tidyverse", "stargazer", "magrittr", "car", "wooldridge")
lapply(required_packages, library, character.only = TRUE)


data("wage1")

# Prepare the dataset by selecting relevant variables
wage1 %<>% select(wage, educ, exper, tenure, female, married)
glimpse(wage1)

# Shapiro-Wilk Test for Normality
# --------------------------------------------------------
# Histogram of 'wage'
ggplot(wage1, aes(x = wage)) +
  geom_histogram(binwidth = 1, color = 'black', fill = 'lightblue') +
  theme_minimal() +
  labs(title = "Histogram of Wage", x = "Wage", y = "Frequency")

# Shapiro-Wilk test for normality
shapiro.test(wage1$wage)
# Interpretation: If p-value < 0.05, reject H0 (the data is not normally distributed).

wage1 %<>% mutate(lwage = log(wage))
shapiro.test(wage1$lwage)

ggplot(wage1, aes(x = lwage)) +
  geom_histogram(binwidth = 0.1, color = 'black', fill = 'lightblue') +
  theme_minimal() +
  labs(title = "Histogram of Wage", x = "Wage", y = "Frequency")


# B. coefficient significance: t-test, F-test
# -----------------------------------------------------------------------------------------------

# Coefficient Significance
# Run multiple regression
model <- lm(wage ~ educ + exper + tenure + married, data = wage1)
summary(model)

# 1. using t-test: comparing t-statistic with t-critical value
# 2. using p-value : compare p-value with significance level (5%)
# 3. using Confidence Interval: # If confidence interval does not contain 0 then reject null,coefficient is significant
confint(model, "exper", level = 0.95)


# F-test for Joint Coefficient Significance
# -----------------------------------------------------------------------------------------------
# Testing joint significance of 'exper' and 'tenure'
linearHypothesis(model, c("exper = 0", "tenure = 0"))
# Interpretation: If F-statistic > F-critical or p-value < 0.05, reject H0 (coefficients are jointly significant).

# F-test for Overall Significance
# -----------------------------------------------------------------------------------------------
#from the summary of the model
summary(model)
# Interpretation: If p-value < 0.05, reject H0 (model is significant).
#or
linearHypothesis(model, c("exper = 0", "tenure = 0", "married = 0", "educ = 0"))


