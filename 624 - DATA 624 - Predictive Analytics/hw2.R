library(AppliedPredictiveModeling)
library(caret)
data(ChemicalManufacturingProcess)

df = ChemicalManufacturingProcess

summary(df)

dim(df)

a) 

library(missForest)

df_imp1 = missForest(df)

df_imp = df_imp1$ximp

summary(df_imp)

b) 

colSums(is.na(dfBevMod))


data = df_imp[,2:58]
target = df_imp[,1]


training = createDataPartition( target, p=0.75 )


predictor_training = data[training$Resample1,]
target_training = target[training$Resample]

predictor_testing = data[-training$Resample1,]
target_testing = target[-training$Resample1]





(c) Split the data into a training and a test set, pre-process the data, and
tune a model of your choice from this chapter. What is the optimal value
of the performance metric?


set.seed(100)
ctrl <- trainControl(method = "cv", number = 10)

plsTune <- train(predictor_training, target_training,
                   method = "pls",
                   tuneLength = 20,
                   trControl = ctrl,
                   preProc = c("center", "scale"))


(d) Predict the response for the test set.What is the value of the performance
metric and how does this compare with the resampled performance metric
on the training set?


pred_test = predict(plsTune, predictor_testing)
#pred_train = predict(plsTune, predictor_training)

pred_df <- data.frame(obs = target_testing, pred = pred_test)
defaultSummary(pred_df)


(e) Which predictors are most important in the model you have trained? Do
either the biological or process predictors dominate the list?

plot(varImp(plsTune))

(f) Explore the relationships between each of the top predictors and the response.
How could this information be helpful in improving yield in future
runs of the manufacturing process?

plot(data$ManufacturingProcess32, target)
abline(lm(target~data$ManufacturingProcess32),col="red",lwd=1.5)

plot(data$ManufacturingProcess17, target)
abline(lm(target~data$ManufacturingProcess17),col="red",lwd=1.5)

plot(data$ManufacturingProcess36, target)
abline(lm(target~data$ManufacturingProcess36),col="red",lwd=1.5)





pplot(data$)