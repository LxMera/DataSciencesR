library(dslabs)
data("heights")

set.seed(1)

y <- heights$sex
test_index <- createDataPartition(y, times = 1, p = 0.5, list = FALSE)
train_set <- heights %>% slice(-test_index)
test_set <- heights %>% slice(test_index)

k <- seq(1, 101, 3)
output <- sapply(k, function(k){ 
  fit <- knn3(sex ~ height, data = train_set, k = k)
  y_hat <- predict(fit, test_set, type = "class")
  #confusionMatrix(data=y_hat, reference=test_set$sex)$byClass["F1"]
  f_1 <- F_meas(y_hat,test_set$sex, estimator = "Female" )
})

qplot(k,output)
max(output)
k[which.max(output)]


library(tidyverse)
library(caret)
data(heights)

set.seed(1)

test_split <- createDataPartition(heights$sex, times = 1, p = 0.5, list = F)

train_set <- heights[-test_split,]
test_set <- heights[test_split,]

k <- seq(1, 101, 3)
output <- sapply(k, function(k){
  fit <- knn3(sex ~ height, data = train_set, k = k)
  y_hat <- predict(fit, test_set, type = "class")
  #confusionMatrix(data=y_hat, reference=test_set$sex)$byClass["F1"]
  f_1 <- F_meas(y_hat,test_set$sex, estimator = "Female")
})

qplot(k,output)
max(output)
k[which.max(output)]
