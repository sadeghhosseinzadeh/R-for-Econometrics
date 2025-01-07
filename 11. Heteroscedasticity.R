# 11.Heteroscedasticity
# ==================================================================================================

# A. what is Heteroscedasticity
# B. Heteroscedasticity tests
# C. How to deal with Heteroscedasticity


# A. what is Heteroscedasticity
# -----------------------------------------------------------------------------------------------

# Clear the environment
rm(list = ls())

# Install and load necessary packages
required_packages <- c("tidyverse", "stargazer", "magrittr","sandwich", "car","lmtest", "wooldridge")
lapply(required_packages, library, character.only = TRUE)


# Load the data set on house prices
data("hprice1")

# Display structure and summary statistics
hprice1 %>%
  select(price, lprice, lotsize, sqrft, bdrms) %>%
  str()

stargazer(hprice1 %>% select(price, lprice, lotsize, sqrft, bdrms), type = "text")


# Regression model for price
lin_model <- lm(price ~ lotsize + sqrft + bdrms, data = hprice1)
summary(lin_model)
hprice1 %<>% mutate(uhat = resid(lin_model))

# Graph of residuals against independent variable
ggplot(hprice1, aes(x = sqrft, y = uhat)) + 
  theme_bw() +
  geom_point() +
  geom_hline(yintercept = 0, color = 'red') + 
  labs(y = 'Residuals', x = 'Square feet (sqrft)')


# Regression model for log price
log_model <- lm(lprice ~ lotsize + sqrft + bdrms, data = hprice1)
summary(log_model)
hprice1 %<>% mutate(uhat1 = resid(log_model))

# Graph of residuals against independent variable
ggplot(hprice1, aes(x = sqrft, y = uhat1)) + 
  theme_bw() + 
  geom_point() +
  geom_hline(yintercept = 0, color = 'red') + 
  labs(y = 'Residuals', x = 'square feet (lsqrft)')

# B. Heteroscedasticity tests
# -----------------------------------------------------------------------------------------------

#lin model 
hprice1 %<>% mutate(uhatlinsq = resid(lin_model)^2)
lin_model_uhat <- lm(uhatlinsq ~ lotsize + sqrft + bdrms, data = hprice1)
summary(lin_model_uhat)

# Breusch-Pagan test
bp_test <- bptest(lin_model)
bp_test


hprice1 %<>% mutate(uhatlogsq = resid(log_model)^2)
log_model_uhat <- lm(uhatlogsq ~ lotsize + sqrft + bdrms, data = hprice1)
summary(log_model_uhat)
# Breusch-Pagan test for log price
bp_test_log <- bptest(log_model)
bp_test_log

# White test

# Generate squares and interaction of independent variables
hprice1 %<>% mutate(
  lotsizesq = lotsize^2,
  sqrftsq = sqrft^2,
  bdrmssq = bdrms^2,
  lotsizeXsqrft = lotsize * sqrft,
  lotsizeXbdrms = lotsize * bdrms,
  sqrftXbdrms = sqrft * bdrms
)



white_test <- lm(uhatlinsq ~ lotsize + sqrft + bdrms + lotsizesq + sqrftsq +
                   bdrmssq + lotsizeXsqrft + lotsizeXbdrms + sqrftXbdrms, hprice1)
summary(white_test)

#or you can use the alternative white test 
# reg uhatsq on yhat and yhatsq and check for significance 

# C. How to deal with Heteroscedasticity
# -----------------------------------------------------------------------------------------------

# 1.Heteroscedasticity robust standard errors

# Robust standard errors for price model
coeftest(lin_model, vcov. = vcovHC(lin_model, type = "HC1"))
summary(lin_model)


# 2.Weighted Least Squares (WLS)

# When the heteroscedasticity form is known var(u|x)=(sigma^2)*(sqrft), 
# use WLS with weight=1/sqrft.

# WLS: estimate model with weight=1/sqrft 
WLS_model <- lm(price ~ lotsize + sqrft + bdrms, data = hprice1, weights = 1/sqrft)
summary(WLS_model)


# 3.Feasible GLS (FGLS)

# When the heteroscedasticity form is not known, 
# estimate hhat and use WLS with weight=1/hhat.

# Estimate heteroscedasticity form and obtain hhat
model_g <- lm(log(resid(lin_model)^2) ~ lotsize + sqrft + bdrms, data = hprice1)
hprice1 %<>% mutate(hhat = exp(fitted(model_g)))

# FGLS: estimate model using WLS with weight=1/hhat
model_FGLS <- lm(price ~ lotsize + sqrft + bdrms, data = hprice1, weights = 1/hhat)
summary(model_FGLS)



