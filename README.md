# Data_Mining

<p align="center">
    <img width="250" height="320" src="https://user-images.githubusercontent.com/45757826/57309318-2f4fe700-70e8-11e9-992e-13d1c9b2a9a4.png">
    <img width="420" height="280" src="https://user-images.githubusercontent.com/45757826/57355421-4507ef80-716e-11e9-8eee-91021a933b13.png">
</p>

### Table of Contents
The main content of the project including are 

- [Data Preparation](#data-preparation) 
    - [Missing Values](#missing-values) 
    - [Outliers](#Outliers)
- [Mining and Modeling](#mining-and-modeling)
    - [Bayes Classifiers](#Bayes-classfiers)
    - [Logistic Regression](#logistic-regression)
    - [Tree Models](#tree-models)
- [Model access and selection](#model-select)
    - [Information Criteria](#information-criteria)
    - [Cross Validation](#cross-validation)
    - [Confidence region](#confidence-region)
    - [Residual analysis and Correlation test](#residual-analysis)

    
## Data Preparation
The procedures for data preparation is demonstrated in the following Figure 1. In the first step, we need to identify what kind of data is needed for the bussiness metric and extract the data from our database (or do the experiments to gather the data). In the next step, we need to aggregate different types of data and cleanse the data by dealing with missing values and outliers. Finally, we divided the "clean" data in to two groups: one for modeling (discovery) and one for modeling evaluation.
<p align="center">
    <img width="600" height="250" src="https://user-images.githubusercontent.com/45757826/57309772-ed737080-70e8-11e9-92bb-5334476f37ab.png">
    
Figure 1. Procedures for data preparation
</p>

In data preparation, we have to take the data comtamination into account which means we have to identified the **source of noise**.
The possible sources of noises include：
- faulty data collection instruments, e.g. sensors
- transmission errors, e.g. intermittent errors from internet transmisssions
- data entry error
- technology limitaion error
- Naming conventions misused, e.g. some names but different meaning
- incorrect classification

The different sources of noise have different statistical natures, e.g. the noise in the sensors is often assumed to be Gaussian noise while the network delay in the internet transmissions is often assumed to be log-normal distributed.

In addition, we may have **redundent data** like
- variables have different names in different databases
- raw variable in one database is a derived variable in another
- changes in varaible over time not reflected in database

and **irrelvant data** (which requires dimension reduction)
The redundent data should be handled by the problem-specific treatments, e.g. merge the data of the variable with different names in different databases (tool based duplication removal) or create unique record ID. In statistical theory, it is alway no harm to have more data for a variable in modeling and classification. The only cost is that more data need more computational resourses.  

Finially, the missing values and outliers are also common problems which require special care using the knowledge of statistics. 

#### Missing Values
We consider the missing values sets
- maybe irrelevant to the desired result
- maybe a few in number
We need to impute missing data **manually or statistically**. The easiest way is to throw away all the incomplete observations. It can be fulfilled by the code:
```R
data_complete<-date[complete.cases(d),]
```
However, this may lead to biased sample if the values are non-random missing.
```R
set.seed(12345)
d<-matrix(rnorm(5000),ncol=10)
x1<-replace(d,d<2,NA)
x2<-replace(d,d>2,NA)
x3<-replace(d,x1>2,NA)
c1<-x1[complete.cases(x1),]
c2<-x2[complete.cases(x2),]
c3<-x3[complete.cases(x3),]
```
Then we calculate the mean of "c1", "c2", "c3" which is shown in Table 1.

 Table 1.  Means of the variable 1 in "d", "c1", "c2" and "c3". 
 
 <center>
   
| data          | variable 1    |
| ------------- |:-------------:| 
| "d"           | 0.082         |
| "c1"          | 0.1233        | 
| "c2"          | 0.038         | 
| "c3"          | 0.088         | 

</center>

Another commonly used method is toto "fill in", or impute the missing data, e.g., with the sample mean values of the variable. Rubin (1987) argued that repeating imputation even a few times (5 or less) enormously improves the quality of estimation. A better yet more complicated way is to used the available record to compute the distance bettween two records.

There also other approaches, e.g. **interpolation** use the complete samples, or **generative approaches** like the expectation-maximization (**EM**) algorithm.

[Back To The Top](#Data_Mining)

#### Outliers

The outer liers can be caused by many reasons e.g. miss entry. They are easily detect in low dimension data, e.g. using the boxplot in Figure 2. 
<p align="center">
    <img width="400" height="200" src="https://user-images.githubusercontent.com/45757826/57362948-375b6580-7180-11e9-981b-5ab7b78b321a.png">
    
Figure 2. boxplot
</p>

However, in large dataset, we may use Grubb's test (Z-score) [3] which only consider the marginal distribution of each variable. Other outlier detection methods include
- CV Rule: CV = SD/Mean, CV > Threshold => outlier
- Resistance Rule: RS = (X-median)/MAD, RS > Threshold => outlier

A better way to deal with outliers in continous variables is the Mahalanobis Distance method. The detail of the method can be found in [MD method](https://github.com/minglwang/Data_Mining/blob/master/1-data_preparation/data_preparation.pdf)   
The method is applied to the home equity loan data, the Mahalanobis distance is caculated and presented in Figure 4.

<p align="center">
    <img width="400" height="280" src="https://user-images.githubusercontent.com/45757826/57366427-3bd74c80-7187-11e9-950f-8486a7fa8287.png">

Figure 4. Mahalanobis distance of the home equity loan data.
</p>
The R code for implementing the method can be found in ["data_preparation_HMQL.R"](https://github.com/minglwang/Data_Mining/blob/master/1-data_preparation/data_preparation_HMQL.R).

[Back To The Top](#Data_Mining)


## Mining and Modeling
<p align="center">
    <img width="600" height="250" src="https://user-images.githubusercontent.com/45757826/57311249-8efbc180-70eb-11e9-85dc-d6a52805889e.png">
    
#### Bayes Classifiers
The Bayes classifiers include 
- naive Bayes
- K nearest neigbors
- Linear Discriminant analysis
- Quadratic Discriminant analysis
 The detailed derivation of these methods can be found in the "Bayes classifier.pdf". Here, we 

#### Logistic regression

#### Tree Models
- binary tree
- random forest
- Ada-boost
- XG-boost

[Back To The Top](#Data_Mining)


## Model access and selection

- Information Criteria
- Cross Validation
- Confidence region
- esidual analysis and Correlation test

---

## How To Use

#### Installation



#### API Reference

```html
    <p>dummy code</p>
```
[Back To The Top](#Data_Mining)

---

## References


1. Friedman, Jerome, Trevor Hastie, and Robert Tibshirani. The elements of statistical learning. Vol. 1. No. 10. New York:     Springer series in statistics, 2001.

2. Vapnik, Vladimir. The nature of statistical learning theory. Springer science & business media, 2013.

3. Grubbs, Frank E. (1950). "Sample criteria for testing outlying observations". Annals of Mathematical Statistics. 21 (1): 27–58. doi:10.1214/aoms/1177729885.

[Back To The Top](#Data_Mining)

---


[Back To The Top](#Data_Mining)

---

## Author Info

- Linkedin - [@Mingliang](https://www.linkedin.com/in/mingliang-wang-805127180/)
- Website - [Mingliang](https://www.kth.se/profile/miwan)

[Back To The Top](#Data_Mining)
