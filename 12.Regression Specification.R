# 12.Regression Specification
# ==================================================================================================

# A. RESET test
# B. Proxy and mismeasurements 


# Setup
rm(list = ls()) 


# Install and load necessary packages
required_packages <- c("tidyverse", "magrittr", "car", "lmtest", "wooldridge")
lapply(required_packages, library, character.only = TRUE)

# RESET 
# -----------------------------------------------------------------------------------------------

# We use RESET test to fine out if our model is correctly Specified


data("wage1")

# Regression model of wage
model1 <- lm(wage ~ educ + exper + tenure, data = wage1)
summary(model1)
wage1 %<>% mutate(yhat = fitted(model1),
                          yhatsq = yhat^2,
                          yhatcube = yhat^3)

# RESET
model1_RESET <- update(model1, . ~ . + yhatsq + yhatcube)
summary(model1_RESET)
# The null hypothesis is the model is well-specified
linearHypothesis(model1_RESET, c("yhatsq = 0", "yhatcube = 0"))
# p-value < 0.05 so the model is misspecified.

wage1 %<>% mutate(tenuresq = tenure^2,
                  expersq = exper ^2,
                  educsq = educ ^2,
                  lwage = log(wage))

# Regression model of wage including square terms
model2 <- lm(wage ~ educ + expersq + tenuresq, data = wage1)
summary(model2)

wage1 %<>% mutate(yhat1 = fitted(model2),
                          yhat1sq = yhat1^2,
                          yhat1cube = yhat1^3)
model2_RESET <- update(model2, . ~ . + yhat1sq + yhat1cube)
summary(model2_RESET)
linearHypothesis(model2_RESET, c("yhat1sq = 0", "yhat1cube = 0"))

# Regression model of lwage including square terms
model3 <- lm(lwage ~ educ + exper + tenure + educsq + expersq + tenuresq, data = wage1)
summary(model3)
wage1 %<>% mutate(lyhat1 = fitted(model3),
                          lyhat1sq = lyhat1^2,
                          lyhat1cube = lyhat1^3)
model3_RESET <- update(model3, . ~ . + lyhat1sq + lyhat1cube)
summary(model3_RESET)
linearHypothesis(model3_RESET, c("lyhat1sq = 0", "lyhat1cube = 0"))
# This is a correctly specified model.


# omitted variable and Proxy variable
# what happens when we have omitted variable and what to do? 

# Measurement error
# what happens when we have measurement error in dependent variable or independent variable



