
library(class)
library(reshape)
library(mclust)
library(ggplot2)

#setwd("D:/data mining")
zip.train1<-read.table("zip.train")
zip.test1<-read.table("zip.test")
zip.train<-zip.train1[(zip.train1$V1==2)|(zip.train1$V1==3),]
zip.test<-zip.test1[(zip.test1$V1==2)|(zip.test1$V1==3),]
dim(zip.train)
dim(zip.test)

##Linear Regression

mod_lm<-lm(V1~.,data=zip.train)
category_f <- function (x) {if(x > 2.5) 3 else 2 }
predictions.lm.train <- as.character(sapply(predict(mod_lm,zip.train),category_f))
predictions.lm.test <- as.character(sapply(predict(mod_lm,zip.test),category_f ))


##KNN
knn.train<-zip.train[,2:257]
knn.test<-zip.test[,2:257]
knn.train.Y<-as.factor(zip.train$V1)
knn.test.Y<-as.factor(zip.test$V1)

##KNN Prediction
kk<-c(1,3,5,7,15)
predictions.knn.test<-sapply(kk,function(k){knn(train=knn.train,test=knn.test,cl=knn.train.Y,k=k)})
predictions.knn.train<-sapply(kk,function(k){knn(train=knn.train,test=knn.train,cl=knn.train.Y,k=k)})

errors.xs<-kk
errors.knn.test<-apply(predictions.knn.test,2,function(prediction){classError(prediction,as.factor(zip.test$V1))$errorRate})
errors.knn.train<-apply(predictions.knn.train,2,function(prediction){classError(prediction,as.factor(zip.train$V1))$errorRate})
errors.lm.test<-sapply(errors.xs,function(k){classError(predictions.lm.test,as.factor(zip.test$V1))$errorRate})
errors.lm.train<-sapply(errors.xs,function(k){classError(predictions.lm.train,as.factor(zip.train$V1))$errorRate})
errors <- data.frame ("K"= errors.xs,"KNN.Train"= errors.knn.train,"KNN.Test"= errors.knn.test ,"LR.Train"= errors.lm.train,"LR.Test"= errors.lm.test )

plot.data <-melt(errors,id ="K")
ggplot(data=plot.data,aes(x=K, y=value,linetype=variable, color = variable))+geom_line()+geom_point(size=5)+xlab ("k")+ylab("Classification Error")
scale_colour_hue(name ="Classification Method",labels = c("k-NN (Train)","k-NN (Test)","Linear Regression (Train)","Linear Regression (Test)"))

#ggsave(file.path ('graphs','knn_vs_ls.png'))

