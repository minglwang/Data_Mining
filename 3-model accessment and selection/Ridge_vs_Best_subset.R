
library(bestglm)
library(class)
library(e1071)
library(MASS)
data(zprostate)
str(zprostate)
train<-(zprostate[zprostate[,10],])[,-10]
test<-(zprostate[zprostate$train==FALSE,])[,-10]

bstglm<-bestglm(train)

x<-cbind(1,test[,1:2])
b<-as.matrix(bstglm$BestModel$coef)
print(b)

x<-as.matrix(x)
y<-x%*%b
Ltest<-length(y)
test.error<-mean((y-test[,9])^2)
std.error<-sqrt(var((y-test[,9])^2)/Ltest)
print(test.error)
print(std.error)

#########ridge regression###########

lam=seq(0,200,by=0.1)
rig<-lm.ridge(lpsa~.,train,lambda=lam)
select(rig)
smalam<-as.numeric(names(which.min(rig$GCV)))

rig<-lm.ridge(lpsa~.,train,lambda=smalam)
x1<-as.matrix(cbind(1,test[,-9]))
b1<-as.matrix(c(rig$Inter,rig$coef))
y1<-x1%*%b1
Ltest1<-length(y1)
test.error.rg<-mean((y1-test[,9])^2)
std.error.rg<-sqrt(var((y1-test[,9])^2)/Ltest1)
print(test.error.rg)
print(std.error.rg)
