# Ironhack data analytics bootcamp mid-term project

Class: data-ft-ber-10-20

## Project Description

This project focuses on predicting the selling price of houses using machine learning techniques. 

The dataset was further explored using MySQL and Tableau to find out what features contribute to a higher selling price. 

## Objective

The project have to main goals: 

1. Create a machine learning model to predict the selling price of a house
2. Find out which property features that contribute to a higher selling price (above $650K)

## Files in this repo

Jupyter notebook: unit-5-project-final-iteration.ipynb
MySQL queries: SQL-query.sql
Tableau queries: Tableau-query.twb
Folder 'earlier-iterations-jupyter-notebook': Archived notebooks from previous iterations

## Data

The dataset regression_data_clean.csv include information of 21,597 properties 
from 70 different postcodes in Washington, US, that was sold between May 2014 and May 2015. 

Following definitions of data points was provided:

**Id**: Unique identification number for the property
**date**: date of sale
**price**: the selling price
**waterfront**: house with a waterfront view
**condition**: How good the condition is (overall). **1** indicates worn out property and **5** excellent.
**grade**: Overall grade given to the housing unit, based on King County grading system. 1 poor ,13 excellent.
**Sqft_above**: square footage of house apart from basement.
**Sqft_living15**: Living room area in 2015(implies - some renovations). This might or might not have affected the lotsize area.
**Sqft_lot15**: lotSize area in 2015(implies - some renovations).

## Project process

Exploration: Exploring data points using pandas and numpy. Visualisations with matplotlib and seaborn.

Data cleaning/wrangling: Bucketing and encoding using pandas getdummies. Outlier removal using the interquartile range method.

Feature extraction: Correlations analysis using correlations matrix and heatmap. Multicollinearity analysis using VIF test. 

Pre-processing: Reduce skewness of numerical variables using numpy.log() and standardisation using StandardScaler()

## Method:

**Linear Regression**

Linear regression is a predictive statistical analysis method used to predict the value of a varible based on the value of another variable. 
In this project a multiple linear regression has been used to predict the outcome of the response variable, selling price. 

The result from the model is evaluated using an OLS Regression Statement in addition to evaluation using R-square score, MSE, RMSE and MAE.

**K-Nearest Neighbors (KNN)**

KNN is a machine learning algorithm that can be used for both regression and classification. It uses feature similarities to predict values of new data points. When used to predict the outcome of continuous variables the algorithm uses a weighted average of k nearest neighbours and computes the Euclidean distance from the input value to labelled value. KNN was used in addition to the Linear Regression to further explore the result of the model.

## Outcome

The objective of the project was to create a machine learning model to predict the selling price of houses. The results from the OLS regression indicates a p-value of 0.00 which indicate that the predictor variables are statistically significant and that there is an association between changes in the indipendent variables and the response variable. However, the R2 score from the linear regression is low (0.56) which means that only 56% of the target variable 'selling price' can be explained by the model. In addition the VIF score is higher than recommended which suggests that there is some multicollinearity.

In the future, further analysis and improvements of the model to achieve an R2-score of at least 0.70 would be preferred.
