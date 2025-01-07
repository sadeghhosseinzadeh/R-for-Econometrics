# 7. Simple Regression
# ==================================================================================================

# A. Simple regression ( and R-squared and Adjusted R-squared)
# B. Log forms


# A. Simple regression ( and R-squared and Adjusted R-squared)
# -----------------------------------------------------------------------------------------------

setwd("D:\\DARS\\TA\\R\\II")  # Set working directory

# Required packages loading
needed_packages <- c("tidyverse", "stargazer", "magrittr", "wooldridge")
lapply(needed_packages, library, character.only = TRUE)


# Load and prepare the dataset
data("wage1")

# Select relevant variables
wage1 %>% select(wage, educ)  %>%  glimpse()
wage1 %>% select(wage, educ)  %>%  stargazer( type = "text")
wage1 %>% select(wage, educ)  %>%  head( 10)

wage1 %<>% select(wage, educ)

# Data exploration
cor(wage1)

# Perform simple regression: wage = beta0 + beta1*educ + u
wage_model <- lm(formula = wage ~ educ, data = wage1)
summary(wage_model)
wage_model$coefficients['educ']

# R-squared and Adjusted R-squared
# Extracting R-squared
summary(wage_model)$r.squared
summary(wage_model)$adj.r.squared


# Using ggplot2 for plotting
ggplot(wage1, aes(x = educ, y = wage)) +
  theme_light() +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# Prediction after regression


# Predicted values and residuals
wage1 <- wage1 %>% mutate(
  wagehat = predict(wage_model),
  uhat = residuals(wage_model)
)
stargazer(wage1, type = "text")

# Plot actual vs. predicted values
ggplot(wage1, aes(x = educ)) +
  geom_point(aes(y = wage, color = 'Actual Wage')) +
  geom_point(aes(y = wagehat, color = 'Predicted Wage')) +
  geom_point(aes(y = uhat, color = 'Residuals')) +
  xlab('Education (years)')



# B .Log form
# -----------------------------------------------------------------------------------------------

wage1 <- wage1 %>% mutate(lwage = log(wage))

# Linear form
linear_model_wage <- lm(wage ~ educ, data = wage1)
summary(linear_model_wage)
ggplot(wage1, aes(x = educ, y = wage)) +
  theme_bw() +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


# Log-linear form
log_linear_model_wage <- lm(lwage ~ educ, data = wage1)
summary(log_linear_model_wage)
ggplot(wage1, aes(x = educ, y = lwage)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)
