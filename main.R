# SVM
# install.packages('e1071')
library(caTools)
library(e1071) # for SVM classifier

# import data 
dataset = read.csv('Social_Network_Ads.csv')

#remove unnecessary data 
dataset = dataset[2:5]

# encoding gender 
dataset$Gender = factor(dataset$Gender, levels = c('Male', 'Female'), 
                        labels = c(0, 1))

# check data type 
typeof(dataset$Age)
typeof(dataset$EstimatedSalary)
typeof(dataset$Gender)
# all integers, but must convert to integer for feature scaling 
dataset$Gender = as.integer(dataset$Gender)

# splitting dataset 
seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
train = subset(dataset, split == TRUE)
test = subset(dataset, split == FALSE)

# feature scaling '-' means except 
train[-4] = scale(train[-4])
test[-4] = scale(test[-4])

# training/fit KNN and predicting the test results
classifier = svm(formula = Purchased ~., 
                 data = train, 
                 type = 'C-classification', 
                 kernel= 'linear')

# prediction NO Need for SVN
y_pred = predict(classifier, newdata=test[-4])  

# confusion matrix 
cm = table(test[, 4], y_pred)
print(cm)
