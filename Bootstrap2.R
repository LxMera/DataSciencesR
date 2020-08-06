library(dslabs)
library(caret)
data(mnist_27)
set.seed(1995) # if R 3.5 or earlier
#set.seed(1995, sample.kind="Rounding") # if R 3.6 or later
indexes <- createResample(mnist_27$train$y, 10)

sum(indexes[["Resample01"]]==3)

y <- rnorm(100, 0, 1)
qnorm(0.75)
quantile(y, 0.75)

set.seed(1)

B <- 10^4
M_star <- replicate(B, {
  y <- rnorm(100, 0, 1)
  quantile(y, 0.75)
})

mean(M_star)
sd(M_star)

set.seed(1) # # if R 3.5 or earlier
#set.seed(1, sample.kind = "Rounding") # if R 3.6 or later
y <- rnorm(100, 0, 1)
set.seed(1) 

indexes <- createResample(y, 10000)

M_star <- sapply(names(indexes), function(k){
  quantile(y[indexes[[k]]], 0.75)
})


mean(M_star)
sd(M_star)
