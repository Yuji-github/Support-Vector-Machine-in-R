# simple  multiple Linear Regression 

# install.packages('caTools')
library(caTools)

# import data 
dataset = read.csv('Data.csv')

# encoding categorical to numerical 
# data$State = factor(data$State, 
#                    levels = c('naem here', 'naem here', 'naem here'), 
#                    labels = c(1, 2, 3))

# split dataset into train and test *must have 'caTools' from library
set.seed(123)
split = sample.split(dataset$PE, SplitRatio = 0.8)
train = subset(dataset, split == TRUE)
test = subset(dataset, split == FALSE)

# training dataset with regressor 
regressor = lm(formula = PE ~ ., data = train)
summary(regressor)

# prediction 
y_pred = predict(regressor, newdata = test)