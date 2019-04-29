
## 1. Download data:  set the working space to where the csv stores, e.g. "D:/data mining"

d<-read.csv("hmeq.csv",na.strings="")
dim(d)

## 2. Remove cases with missing data
dc<-d[complete.cases(d),]
dim(dc)
names(dc)


## 3. Remove the outliers

# 3.a Separate the data into two groups
d1<-dc[(dc$BAD==1),]
dim(d1)
d0<-dc[(dc$BAD==0),]
dim(d0)

# 3.b Compute Mahalanobis distance for each group
mdist<-function(x){t<-as.matrix(x)
p<-dim(t)[2]
m<-apply(t,2,mean)
s<-var(t)
mahalanobis(t,m,s)}

md0<-mdist(d0[,-c(1,5,6)]) # remove column (1,5,6)
md1<-mdist(d1[,-c(1,5,6)]) # remove column (1,5,6)

# 3c. Remove outliers in each of the two groups:
c<-qchisq(0.99,df=10) # Critical value for Mahalanobis distance
## delect the one greater than the critical value
x0<-d0[md0<c,] 
x1<-d1[md1<c,]

# 3d. Combine the two groups of data & write to file
x<-rbind(x0,x1)
write.table(x,file="hmql.csv",sep=",",row.names=F)



par(mfrow=c(1,2))
plot(md0,type="p",col="red",main=" BAD = 0")
plot(md1,type="p",col="red",main=" BAD = 1")

