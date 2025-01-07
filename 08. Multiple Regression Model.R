# 8.Multiple Regression Model
# ==================================================================================================

# A. Multiple Regression (R-squared and Adjusted R-squared) 
# B. Perfect Collinearity 
# C. Exogeneity and Omitted Variable Bias Variance in Misspecified Models
# D. Homoscedasticity and Heteroscedasticity

# Setup
rm(list = ls())  
setwd("D:\\DARS\\TA\\R\\II")  # Set working directory

# Install and load necessary packages
required_packages <- c("tidyverse", "stargazer", "magrittr", "car", "wooldridge")
#install.packages(setdiff(required_packages, rownames(installed.packages())), dependencies = TRUE)
lapply(required_packages, library, character.only = TRUE)

# Load and prepare the dataset
data("wage1")

# Select relevant variables and take a glimpse at the dataset
wage1 %>% select(wage, educ, exper, tenure, female, married) %>% glimpse()

# Correlation matrix
cor(wage1 %>% select(wage, educ, exper, tenure, female, married))

# A. Multiple Regression (R-squared and Adjusted R-squared) 
# -----------------------------------------------------------------------------------------------

# Simple regression: wage = beta0 + beta1*educ + u
simple_model <- lm(wage ~ educ, data = wage1)
summary(simple_model)

# Multiple regression: wage = beta0 + beta1*educ + beta2*exper  + u
multi_model <- lm(wage ~ educ + exper , data = wage1)
summary(multi_model)

# Multiple regression: wage = beta0 + beta1*educ + beta2*exper + beta3*tenure + beta4*female + u
multi_model_2 <- lm(wage ~ educ + exper + tenure + female, data = wage1)
summary(multi_model_2)

# Compare simple and multiple regression coefficients
stargazer(simple_model, multi_model, multi_model_2, type = "text", single.row = TRUE)


# R-squared and Adjusted R-squared
# -----------------------------------------------------------------------------------------------

# How to use Adjusted R-squared for multiple regression
stargazer(simple_model, multi_model,multi_model_2, type = "text", single.row = TRUE)


# Perfect collinearity
# -----------------------------------------------------------------------------------------------

# Attempt regression with married only
no_collinear_model <- lm(wage ~ educ + married, data = wage1)
summary(no_collinear_model)

# Create a perfect collinearity by generating not_married variable
wage1 %<>% mutate(not_married = 1 - married)

# Attempt regression with not_married only
no_collinear_model_2 <- lm(wage ~ educ + not_married, data = wage1)
summary(no_collinear_model_2)


# Attempt regression with both not_married and married to demonstrate perfect collinearity
collinear_model <- lm(wage ~ educ + married + not_married, data = wage1)
summary(collinear_model)

# Run regression with "no constant" (not preferred option) 
no_const_model <- lm(wage ~ 0 + educ + married + not_married, data = wage1)
summary(no_const_model)


# Select relevant variables
wage2_data <- wage1 %>% select(wage, educ, exper, tenure)

# Calculate correlation matrix
cor(wage2_data)

# High correlation values (close to 1 or -1) indicate potential multicollinearity.

# Fit regression model
model <- lm(wage ~ educ + exper + tenure, data = wage2_data)

# Calculate VIF values
vif_values <- vif(model)
print(vif_values)

# Explanation: Variance Inflation Factor (VIF) measures the extent of multicollinearity in a regression model.
# VIF > 10 typically indicates high multicollinearity, meaning that one predictor variable can be linearly predicted from the others with a high degree of accuracy.
# This can make the coefficient estimates unstable and their interpretation difficult.


# C. Exogeneity and Omitted Variable Bias and Variance in Misspecified Models 
# -----------------------------------------------------------------------------------------------

# Load the wage2 dataset
data("wage2")

# Select relevant variables
wage2_data <- wage2 %>% select(wage, educ, IQ)

# Omitted Variable Bias

# Model with omitted variable (IQ)
# This model includes only education (educ) as a predictor of wage, omitting IQ
model_omitted <- lm(wage ~ educ, data = wage2_data)
summary(model_omitted)

# True model with educ and IQ
# This model includes both education (educ) and IQ as predictors of wage
model_true <- lm(wage ~ educ + IQ, data = wage2_data)
summary(model_true)



# Compare the two models
# Using stargazer to display the summaries of both models side by side
stargazer(model_true, model_omitted, type = "text", single.row = TRUE)


# D . Homoscedasticity and Heteroscedasticity
# -----------------------------------------------------------------------------------------------

# Homoscedasticity: Constant variance of errors for each x value
# Heteroscedasticity: Non-constant variance of errors for each x value

# Fit a multiple regression model
# model_multiple2 <- lm(wage ~ educ + exper + tenure, wage1)
summary(multi_model_2)

wage1 <- wage1 %>% mutate(
  wagehat = predict(multi_model_2),
  uhat = residuals(multi_model_2)
)

# Plot residuals for experience
ggplot(data = wage1, mapping = aes(x = exper, y = uhat)) +
  theme_minimal() +
  geom_point() +
  geom_hline(yintercept = 0, color = 'blue') +
  ylab("Residuals")

# Plot residuals for education
ggplot(data = wage1, mapping = aes(x = educ, y = uhat)) +
  theme_minimal() +
  geom_point() +
  geom_hline(yintercept = 0, color = 'blue') + 
  ylab("Residuals") 



# Interpretation: The plots indicate heteroscedasticity for education and homoscedasticity for experience





