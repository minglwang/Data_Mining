################data preparation############## 
zip.train1<-read.table("zip.train")
zip.test1<-read.table("zip.test")
zip.train<-zip.train1[(zip.train1$V1==2)|(zip.train1$V1==3)|(zip.train1$V1==5),]
zip.test<-zip.test1[(zip.test1$V1==2)|(zip.test1$V1==3)|(zip.test1$V1==5),]
install.packages(nnet)
##############multinominal logistic regression#############
library(nnet)
mnl<-multinom(V1~.,data=zip.train)
train.pred<-predict(mnl)
test.pred<-predict(mnl,zip.test)
err_mnl.train<-1-(sum(diag(table(train.pred,zip.train$V1)))/sum(table(train.pred,zip.train$V1)))
err_mnl.test<-1-(sum(diag(table(test.pred,zip.test$V1)))/sum(table(test.pred,zip.test$V1)))

#############LDA#########################
library(MASS)
library(lda)
lda_t<-lda(V1~.,data=zip.train)
train.pred.lda<-predict(lda_t,zip.train)
test.pred.lda<-predict(lda_t,zip.test)

lda_train_pred<-predict(lda_t,zip.train)$class
lda_test_pred<-predict(lda_t,zip.test)$class

err_lda.train<-1-(sum(diag(table(lda_train_pred,zip.train[,1])))/sum(table(lda_train_pred,zip.train[,1])))
err_lda.test<-1-(sum(diag(table(lda_test_pred,zip.test[,1])))/sum(table(lda_test_pred,zip.test[,1])))

##################naive bayes######################
library(e1071)
nb<-naiveBayes(factor(V1)~.,data=zip.train)

pred.train.nb<-predict(nb,zip.train)
pred.test.nb<-predict(nb,zip.test)


err_nb.train<-1-(sum(diag(table(pred.train.nb,zip.train$V1)))/sum(table(pred.train.nb,zip.train$V1)))
err_nb.test<-1-(sum(diag(table(pred.test.nb,zip.test$V1)))/sum(table(pred.test.nb,zip.test$V1)))

##########KNN############################
library(mclust)
knn.train.Y<-as.factor(zip.train$V1)
knn.test.Y<-as.factor(zip.test$V1)
kk<-c(1,5,10,20)
pre.knn.test<-sapply(kk,function(k){knn(train=zip.train,test=zip.test,cl=knn.train.Y,k=k)})
pre.knn.train<-sapply(kk,function(k){knn(train=zip.train,test=zip.train,cl=knn.train.Y,k=k)})
error<-apply(pre.knn.test,2,function(pre){classError(pre,knn.test.Y)$errorRate})
error.k1=error[1]
error.k5=error[2]
error.k10=error[3]
error.k20=error[4]
################plot#######################
error.xs <- c(1,5,10,20)
error.knn.test <- apply(pre.knn.test, 2, function(prediction){
  classError(prediction, as.factor(zip.test$V1))$errorRate
})
error.bayes.test <- sapply(error.xs, function(k){
  classError(pred.test.nb, as.factor(zip.test$V1))$errorRate
})
error.lda.test <- sapply(error.xs, function(k){
  classError(test.pred.lda$class, as.factor(zip.test$V1))$errorRate
})
error.mlr.test <- sapply(error.xs, function(k){
  classError(test.pred.mu, as.factor(zip.test$V1))$errorRate
})
errors <- data.frame ("K" = error.xs,
                      "KNN.test"=error.knn.test,
                      "Naive Bayes.test"=error.bayes.test,
                      "LDA.test"=error.lda.test,
                      "MLR.test"=error.mlr.test)  

plot.data <- melt(errors, id="K") #require package "reshape"
ggplot(data=plot.data,
       aes(x=K, y=value, colour=variable,shape=variable))+geom_line(size=0.1)+geom_point(size=4) +xlab("k")+ylab("Errors")+theme_bw()+
  ggtitle("The comparison of KNN,Naive Bayes,LDA and MLR")
scale_colour_hue(labels =c("kNN",
                           "Naive Bayes",
                           "LDA",
                           "MLR")
)

