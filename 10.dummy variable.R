# 10. dummy variable
# ==================================================================================================


# regression with one dummy variable 
# -----------------------------------------------------------------------------------------------

# Clear the environment
rm(list = ls())

# Install and load necessary packages
required_packages <- c("tidyverse", "stargazer", "magrittr",  "wooldridge")
lapply(required_packages, library, character.only = TRUE)

# Import data
data("wage1")

# Prepare the data set by selecting relevant variables
wage1 %<>% select(wage, educ, exper, tenure, female, married)
summary(wage1)


# Calculate mean wage
mean_wage_model <- lm(wage ~ 1, data = wage1)
summary(mean_wage_model)
# or
mean_all <- mean(wage1$wage)

mean_f <- mean(wage1$wage[wage1$female == 1])
mean_m <- mean(wage1$wage[wage1$female == 0])

# Regression analysis
female_wage_model <- lm(wage ~ female, data = wage1)
summary(female_wage_model)

# Add male indicator variable
wage1 <- wage1 %>% mutate(male = 1 - female)

# Compare regression coefficients
female_model <- lm(wage ~ female, data = wage1)
male_model <- lm(wage ~ male, data = wage1)

stargazer(female_model, male_model, type = "text")

# T-test for wage differences by gender
t.test(wage ~ female, data = wage1)
t.test(wage ~ male, data = wage1)


# Collinearity check
collinearity_model <- lm(wage ~ female + male, data = wage1)
summary(collinearity_model)

# Adding more dummy variables
# -----------------------------------------------------------------------------------------------

# Interaction terms with marital status
wage1 %<>% mutate(single = 1 - married)

wage1 %<>% mutate(
  female_single = female * single,
  male_single = male * single,
  female_married = female * married,
  male_married = male * married
)

wage1 %>%
  select(female, male, single, married, female_single, male_single, female_married, male_married) %>%
  head(10)

interaction_model <- lm(wage ~ female_single + male_single + female_married + male_married, data = wage1)
summary(interaction_model)

reference_model <- lm(wage ~ female_single + female_married + male_married, data = wage1)
summary(reference_model)

mean_male_single <- mean(wage1$wage[wage1$male_single == 1])
mean_female_single <- mean(wage1$wage[wage1$female_single  == 1])
mean_female_married <- mean(wage1$wage[wage1$female_married == 1])

coef_female_married <- coef(reference_model)['female_married']
coef_female_single <-coef(reference_model)['female_single']

coef_female_married + mean_male_single
coef_female_single + mean_male_single

# Alternative interaction models
wage1 %<>% mutate(femaleXmarried = female * married)

alternative_model <- lm(wage ~ female + married + femaleXmarried, data = wage1)
summary(alternative_model)

coef(alternative_model)['female']
coef(alternative_model)['female'] + coef(alternative_model)['married'] + coef(alternative_model)['femaleXmarried']



# Adding other variables
# -----------------------------------------------------------------------------------------------
educ_model <- lm(wage ~ educ, data = wage1)
summary(educ_model)


# Wage regression with gender 
gender_model <- lm(wage ~ educ + female, data = wage1)
summary(gender_model)
wage1 %<>% mutate(wagehat = fitted(gender_model))

# Male wage regression 
male_educ_model <- lm(wage ~ educ + male, data = wage1)
summary(male_educ_model)

# Gender interaction with education 
wage1 %<>% mutate(gender = factor(female, levels = c(1, 0), labels = c('female', 'male')))



female_educ_model <- lm(wage ~ educ, data = wage1, subset = (female == 1))
summary(female_educ_model)

male_educ_model_subset <- lm(wage ~ educ, data = wage1, subset = (female == 0))
summary(male_educ_model_subset)

gendered_education_plot <- ggplot(wage1, aes(x = educ, y = wage, color = gender, group = gender)) +
  theme_bw() +
  geom_point() +
  geom_smooth(method = lm, se = FALSE, lwd = 0.5) +
  guides(color = guide_legend("gender"))
gendered_education_plot

wage1 %<>% mutate(femaleXeduc = female * educ)

interaction_model_educ <- lm(wage ~ educ + female + femaleXeduc, data = wage1)
summary(interaction_model_educ)

coefficients <- coef(interaction_model_educ)
male_Intercept <- coefficients['(Intercept)']
female_Intercept <-  coefficients['(Intercept)'] + coefficients['female']
coefficients['educ']    # Marginal effect of education on wage for males
coefficients['educ'] + coefficients['femaleXeduc'] #Marginal effect of education on wage for females

# Joint significance F-test

# Assuming wage1 is your data frame
wage1 <- wage1 %<>% mutate(
  femaleXeduc = female * educ,
  femaleXexper = female * exper,
  femaleXtenure = female * tenure
)

# Fit the unrestricted model
unrestricted_model <- lm(wage ~ educ + exper + tenure + female + femaleXeduc + femaleXexper + femaleXtenure, data = wage1)

# Conduct the F-test using linearHypothesis
linearHypothesis(unrestricted_model, c('female = 0', 'femaleXeduc = 0', 'femaleXexper = 0', 'femaleXtenure = 0'))


#alternative
chow_test

