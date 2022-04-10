# 2022 SOA Research Case Study: Rarita FSA League Team

By Team VFS: Adam Moon, Cameron Ning, Ishaan Pandey, Tejaswi Netrapalli and Wesley Guan

---

## Project Summary

This page outlines the plan and analysis performed to build a "competitive" football club that will play in the FSA League. Our team compared various supervised and unsupervised predictive modelling techniques to construct a team of 23 Rarita players based on an estimated nation rank metric. In order to determine the team's competitiveness, simulations of the league results for the next ten years were forecasted. The effects of the team's performance were then translated into various economic impacts and risks. 

## Project Objectives

The objectives of the project are to construct a "competitive" football club given a budget restraint and to analyse the impact of implementing the team through key economic indices and risk analysis for the Commissioner of Sport for Rarita, Hammessi Bayes.

The definition of "competitive" involves:
* A top ten ranking in the FSA league within five years.
* A high probability of winning an FSA championship within ten years.

---

## Data Sources
The data sources used consist of the three provided excel files containing data on: 

* Shooting, passing, defense and goalkeeping statistics for individual players. 

* Tournament results for both 2020 and 2021. 

* Salary data for players in both 2020 and 2021. 

* Various Raritan economic data. 

* 2022 Revenue and Expense data from football-soccer. 

* 2022 attendance and social media data. 

## Data Limitations


## Data Preparation


---

## Team Selection Process

A team of 23 Raritan football players were selected consisting of 11 players in the standing lineup and 12 substitute playeers in the event of any injuries or operational risks. Note that an all-Rarita team was chosen to guarantee team cohesiveness and seamless communication between players. 

The general team selection process involves:
* Splitting the data into training and test subsets with a 7:3 ratio.
* Splitting the data into the main individual positions on the field: Forwards, Midfielders, Defenders and Goalkeepers.
* Fitting various supervised and unsupervised models that predicted an estimated nation rank.
* Selecting the most optimal model for each position using various evaluation metrics.
* Predicting an estimated nation rank for each player in the league dataset using the most optimal model.
* Taking the players with the lowest estimated nation rank for each position.

> The R code related to team selection can be found [here](https://github.com/ACTL4001-T1-2022/github-showcase-page-vfs/blob/main/R%20Code.R).

The supervised and unsupervised learning techniques used include:
* **Supervised models**: Multiple Linear Regression, Lasso Regression, Ridge Regression, Decision Trees, Random Forests, Bagging and Boosting.
* **Unsupervised models**: K-Nearest Neighbours and Linear Discriminant Analysis

## Model Evaluation

The evaluation metrics used include the R-squared, mean squared error, root mean squared error and mean absolute error statistics. These statistics were calculated using the test subset formed earlier in the model fitting process.

### Forward Model
![](https://github.com/ACTL4001-T1-2022/github-showcase-page-vfs/blob/main/Forwards%20Models.png)

### Midfielder Model
![](https://github.com/ACTL4001-T1-2022/github-showcase-page-vfs/blob/main/Midfielders%20Models.png)

### Defender Model
![](https://github.com/ACTL4001-T1-2022/github-showcase-page-vfs/blob/main/Defenders%20Models.png)

### Goalkeeper Model
![](https://github.com/ACTL4001-T1-2022/github-showcase-page-vfs/blob/main/Goalkeepers%20Models.png)

We want the highest R-squared value and the lowest error for our chosen models. Therefore, the best models for the forward, midfielder, defender and goalkeeper positions are Boosting, Random Forests, Bagging and Boosting respectively. 

## Simulations

Monte Carlo simulations of the league are used to calculate the probability ranges for achieving an FSA championship within the next five to ten years. It is assumed that in a league season, each team can play against another only once and the scoring system is as follows:

* Win: 2 points
* Draw: 1 point
* Loss: 0 points

In order to perform the simulations we require the probability of a team beating another. This is based off the differences in the average estimated nation ranks for the two teams. A preliminary analysis of the differences between the average estimated nation ranks for each combination of teams indicate that it is normally distributed. Kolmogorov-Smirnov and Anderson Darling Goodness-Of-Fit tests were performed using a significance level of 5% which further supported the fitting of the normal distribution.

> The results of the KS and AD tests can be found [here](https://github.com/ACTL4001-T1-2022/github-showcase-page-vfs/blob/main/Difference%20Data%20GOF%20Tests.png).

The probability of a team beating another is then determined by the p-value corresponding to the difference. After extensive analysis and research, the drawing probability was chosen to be 10% of the losing probability taken equally from the winning and losing probabilities. While the results do not account for external factors such as the team improving or gaining experience over time, the results of the simulations indicate that:

* Within the next ten years, the Rarita team wins on average 8.102 out of 10 FSA championships with a lower and upper bound of 3 and 10 respectively.
* The Rarita team has a 0.807 probability of winning any particular FSA championship.

---
## Economic Impact












































































































































































































