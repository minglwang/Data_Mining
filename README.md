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
The procedures for data preparation is demonstrated in the following Figure 1. In the first step, we need to identify what data is needed to get the bussiness metric e.g. the click-through rate and extract the data from our database. In the next step, we need to aggregate different type of data and cleanse the data by dealing with the miss values and outliers. Finally, we divided the "clean" data in to two groups: one for modeling (discovery) and one for modeling evaluation.
<p align="center">
    <img width="800" height="300" src="https://user-images.githubusercontent.com/45757826/57309772-ed737080-70e8-11e9-92bb-5334476f37ab.png">
    
Figure 1. Procedures for data preparation
</p>
Now, how we evaluate the data from the 

<img src="http://latex.codecogs.com/svg.latex?p" border="0"/>-variate normal distribution, that is <img src="http://latex.codecogs.com/svg.latex?X_1, \cdots, X_n" border="0"/>, i.i.d., with distribution <img src="http://latex.codecogs.com/svg.latex?\mathcal{N}(\mu,\Sigma)" border="0"/>. According to distribution theory, the Mahalanobis distance <img src="http://latex.codecogs.com/svg.latex?D^2 = (x-\bar{x})^{T}S^{-1}(x-\bar{x})\sim\chi^2(p)" border="0"/>$$$$
where $x$ are one of the samples of <img src="http://latex.codecogs.com/svg.latex?X_1, \cdots, X_n" border="0"/> is the sample mean, <img src="http://latex.codecogs.com/svg.latex?S" border="0"/> is the sample covariance. If the observation with <img src="http://latex.codecogs.com/svg.latex?D^2" border="0"/> greater than a pre-assigned level (say 99%) of a Chi-square distribution with $p$ degrees of freedom, then this observation is an outlier.


#### Missing Values

- Technology 1
- Technology 2

#### Outliers

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
