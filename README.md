# Data_Mining

<p align="center">
    <img width="200" height="300" src="https://user-images.githubusercontent.com/45757826/57309318-2f4fe700-70e8-11e9-992e-13d1c9b2a9a4.png">
    <img width="400" height="250" src="https://user-images.githubusercontent.com/45757826/57355421-4507ef80-716e-11e9-8eee-91021a933b13.png">
</p>

### Table of Contents
The main content of the project including are 

- [Data Preparation](#data-preparation) 
    - [Missing Values](#missing-values) 
    - [Outliers](#Outliers)
- [Mining and Modeling](#mining-and-modeling)
    - [Bayes Classfiers](#Bayes-classfiers)
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
    <img width="800" height="300" src="https://user-images.githubusercontent.com/45757826/57309772-ed737080-70e8-11e9-92bb-5334476f37ab.png">
    
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
The redundent data should handle by the problem-specific treatments, e.g. merge the data of the variable with different names in different databases (tool based duplication removal) or create unique record ID. In statistical theory, it is alway no harm to have more data for a variable in modeling and classification. The only cost is that more data need more computational resourses.  

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
Then we calculate the mean of "c1", "c2", "c3" which is shown in Figure 2.
<p align="center">
    <img width="800" height="300" src="https://user-images.githubusercontent.com/45757826/57361932-e3e81800-717d-11e9-92ba-cb3b3415d973.png">
    
Figure 2. Means of "c1", "c2", "c3" 
</p>



Another commonly used method is toto "fill in", or impute the missing data, e.g., with the sample mean values of the variable. Rubin (1987) argued that repeating imputation even a few times (5 or less) enormously improves the quality of estimation. There also other approaches, e.g. **interpolation** use the complete samples, or **generative approaches** like the expectation-maximization (**EM**) algorithm.


#### Outliers

The outliers are also a very important

[Back To The Top](#Data_Mining)


## Mining and Modeling
![mining](https://user-images.githubusercontent.com/45757826/57311249-8efbc180-70eb-11e9-85dc-d6a52805889e.png)

#### Bayes Classfiers
- naive Bayes
- K nearest neigbors
- Linear Discriminant analysis
- Quadratic Discriminant analysis

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

[Back To The Top](#Data_Mining)

---


[Back To The Top](#Data_Mining)

---

## Author Info

- Linkedin - [@Mingliang](https://www.linkedin.com/in/mingliang-wang-805127180/)
- Website - [Mingliang](https://www.kth.se/profile/miwan)

[Back To The Top](#Data_Mining)
