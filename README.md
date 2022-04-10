# 2022 SOA Research Case Study: Rarita FSA League Team

By Team VFS: Adam Moon, Cameron Ning, Ishaan Pandey, Tejaswi Netrapalli and Wesley Guan

---

![](footballgif.gif)
  
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
The data sources used consist of the three provided excel files:
* [Economic Data](https://github.com/ACTL4001-T1-2022/github-showcase-page-vfs/blob/main/2022-student-research-case-study-economic-data.xlsx)
* [Football Data](https://github.com/ACTL4001-T1-2022/github-showcase-page-vfs/blob/main/2022-student-research-case-study-football-soccer-data.xlsx)
* [Player Data](https://github.com/ACTL4001-T1-2022/github-showcase-page-vfs/blob/main/2022-student-research-case-study-player-data.xlsx)

The excel files contain data on:
* Shooting, passing, defense and goalkeeping statistics for individual players. 
* Tournament results for both 2020 and 2021. 
* Salary data for players in both 2020 and 2021. 
* Various Raritan economic data. 
* 2022 Revenue and expense data from football-soccer. 
* 2022 Attendance and social media data. 

## Data Limitations
![](Data%20Limitations.png)


## Data Preparation
Through a preliminary analysis of the football players dataset, two main issues were identified:  

* Large amounts of missing values. 
* Highly correlated variables. 

The columns with < 25% missing values were imputed using predictive mean modelling and the columns with excessive amounts of missing values (> 25%) were removed frm the dataset. Furthermore, predictors that provided the same information as other predicters in the dataset were also dropped, for instance "Standard SoT%” and “Standard SoT” both constitute the same variable of shots on target. 

Correlation heat maps were then used to determine predictors with high correlations with one another. These variables were dropped from each dataset to avoid multicollinearity and provide a more accurate estimation of the coefficients when regressing. A subset of the best predictors for each skillset was combined to create a final player dataset. 

### Shooting Correlation Plot
![](Shooting%20Correlation%20Plot.png)

### Passing Correlation Plot
![](Passing%20Correlation%20Plot.png)

### Defending Correlation Plot
![](Defending%20Correlation%20Plot.png)

### Goalkeeping Correlation Plot
![](Goalkeeping%20Correlation%20Plot.png)

---

## Team Selection Process

A team of 23 Raritan football players were then selected consisting of 11 players in the standing lineup and 12 substitute playeers in the event of any injuries or operational risks. Note that an all-Rarita team was chosen to guarantee team cohesiveness and seamless communication between players. 

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
![](Forwards%20Models.png)

### Midfielder Model
![](Midfielders%20Models.png)

### Defender Model
![](Defenders%20Models.png)

### Goalkeeper Model
![](Goalkeepers%20Models.png)

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

## Implementation Plan

Now that the competitive team has been chosen, our implementation plan for the Rarita team involves 3 main steps: 
1. Team implementation into FSA league. 
2. Funding team with sources of revenue. 
3. Key metric monitoring team at mid-season break and at end of season. 

## Implementation Timeline 

![](Timeline_2022.JPG)

![](Timeline_2023.JPG)

## 1. Team implementation into FSA league

The chosen Rarita Football Team (with substitute players) are shown below: 

![](Players.JPG)



The overall team wage is 260,930,000∂ and it is entirely homegrown, avoiding borrowing expenses and currency risk. As a result, to ensure the team's success during the implementation process, general cohesion must be assessed to ensure a high level of team synergy. 

## 2. Funding plan (Revenue and Player Salary)

### Sources of Revenue

VFS Actuarial Consulting has summarised the main sources of revenue for Rarita’s National Team: 
* Broadcasting Revenue: TV advertising and deals
* Commercial Revenue and Merchandise: Selling jerseys, scarfs etc. for Rarita Fans
* Matchday Revenue: Ticket Sales and Stadium loaning
* Sponsorships
* Prize Pool of FSA League 
* Loaning players: 10% Salary loan premium when loaning out Rarita players

### Revenue and Profit Projections 

The projected revenue, expenses, profit, and salary values are shown in the graph below:

![](Rarita%20Financials.png)

Rarita must ensure that sufficient private cash is supplied to the team salary, as shown in the Total Profit and Total Salaries estimate. Sponsorships, loaning players, merchandise, and leveraging the exposure obtained through adopting this squad are all possible sources of funding. 

### Usage of Revenue

![](Revenue%20Usage.png)

Rarita should use their revenue wisely to ensure a bright future for football rookies entering the league, such as: 
* Funding developmental programs and grants for successful rookies in local clubs  
* Researching optimized fitness training to ensure that players are technically skilled and fit giving them an edge over competitors 
* Ensuring players and staff are well compensated through higher salary payouts  
* Investing into the future of Rarita through capital expenditure (e.g., building stadiums) 

## 3. Monitoring and key metrics

Over the next 10 years, Rarita’s team must be monitored to ensure the greatest chance of international success in the FSA league. Our monitoring plan involves observing 2 main stages: 
* Comparison of Rarita player statistics with rest of FSA League 
* Financials and Popularity  

### Comparison of Rarita Players

The general performance of the Rarita team in the league must be monitored twice a year: once during the mid-season break and again at the end of the FSA season. The Win-Loss ratio and the team's ultimate ranking are the two most important critical indicators in assessing overall season performance. However, to establish a good training program, it is necessary to understand the performance of specific players. 

### Establishing a Successful Football Player Profile

By exploring the variable importance plots for the 4 main positions modelled: Forwards (FW), Midfielders (MF), Defenders (DF) and Goalkeepers (GK), a competent player can be explained through their statistics over the league. The key metrics for each position are summarised in the table below.

![](Key%20Metrics.png)

These figures should be compared to those of higher-ranked teams to identify areas for improvement. Alternatively, by analysing crucial statistics and their qualitative impact on their squad, fresh players can be sought out at the conclusion of the year. Rarita will be able to work on their weaknesses during the off-season, ensuring long-term success and a good likelihood of winning a title. 

### Financials

> Attendance, GDP, and income are all financial variables that should be tracked on a yearly basis. 

A successful football club will result in increased tourism-related GDP and overall economic growth. The football team's GDP growth rate and revenue should be evaluated to verify that it is performing its economic purpose, and if it isn't, the team's focus should be modified. This might include things like marketing and consulting with the FSA to conduct more home matches for a bigger matchday and merch revenue to help the economy.

---

## Economic Impact
The provided economic data was then used to forecast the revenues and expenses for the next 10 years. This involved estimating: 
* Population growth rate as the average growth rate from 2011-2020 of 0.44%. 
* Total revenue per capita as the average growth rate from 2016-2020 of 8% which increases to 9% in 2025 to account for the growing popularity of the team resulting in higher attendance and online viewership. 
* Total expense per capita as the average growth rate from 2016-2020 of 6% which increases to 7% to account for increased staffing for tournaments and other costs. 2 

The average growth rate calculation excluded the following outliers: 
* Significant decrease in 2020 likely due to a systematic factor as almost all nations experienced negative growth that year. 
* Unexplained increase in 2017-2018.  

### Forecasts for Population, Total Revenue, Total Expenses and Profit
![](Economic%20Impact%20Table.png)

## Impact on GDP and Economic Indices 
Intuitively, high performing teams should result in a snowballing effect for attendance and online viewership. However, this relationship is too difficult to model due to the lack of data and mismatched time frames – attendance and social media data is given for 2022 whereas revenue and expenses needed to be forecasted from 2020. We can conclude that our recommended football team is likely to positively impact GDP due to the high long-term profits generated. Overall, the team’s success will raise Rarita’s global visibility resulting in more opportunities for investments and tourism. This directly causes: 
* Employment levels to increase (e.g., more sport fields and stadiums constructed to accommodate for the increasing popularity of football).  
* Increased staffing to assist the team handle higher online viewership and optimising team training. 
* Fluctuations in inflation and interest rates as Rarita’s economy develops however this is heavily reliant on government policies regarding cash rate management. 

## Non-economic Impacts and Rarita Provinces 
Extending out from economics, the success of the Raritan football team will have a huge effect in the nation building process for Rarita. These effects include: 
* Creating a sense of national identity, which can bridge the financial and social gap between provinces. This is particularly important for West Rarita who has: 
  * One of the poorest economies – consistently ranking in the bottom five of GDP per capita. 
  * Less than half of East Rarita’s Gross National Income (GNI) per capita. 
  * Lowest Raritan household saving rates and healthcare expenditure. 
* Football players serving as role models for Raritans, inspiring people to participate in sports, whether professionally or recreationally. This is especially essential for younger Raritans, as athletics have been shown to have a significant impact on preventing juvenile criminality, which is good for both society and the economy in terms of promoting long-term growth. 
* Excess funds to for building infrastructure in rural or poorer areas within Rarita.  
* Rising healthcare spending as the government's budget grows 
* Rising household savings rates due to Rarita's improved economic prospects.

---
## Risk and Risk Mitigation

Now that the economic impacts have been addressed, to ensure the successful implementation of the team we identified the key risks involved and provided mitigation strategies.

### Risk Heat Map
![](Risk%20Matrix.png)

As seen in the risk heat map above, building a competitive national team with the goal of having a
favourable economic impact on the country entails several financial and non-financial risks that have an
indirect impact on Rarita's economy, politics, and reputation. 

## Financial Risks

### Exchange Rate Risk
If the value of Doubloons (∂) increases, it becomes more expensive for tourists to visit causing less demand
for tourism in Rarita. Additionally, significant changes in exchange rate can lead to termination of
investments as it becomes unprofitable.

**Mitigation:** Reduce the risk by hedging against the Raritan currency. 

![](Exchange%20Rate%20Sensitivity.png)

The table above quantifies the effects of exchange rate changes on 10% of player loan revenue. If the value of
Doubloons (∂) increases or decreases in the optimistic and pessimistic case, there is a potential gain or loss
of approximately €300,000 or (€272,000). 

### Market Risk
The football market may perform poorly due to the shifting trends of consumers. Reduced interestsin soccer
will directly lead to a decrease in tourism and investments for Rarita, negatively impacting economic
activity and growth.

**Mitigation:** Reduce the risk through active advertisement of the team and positive media outlet. Carefully
monitor consumer interests within soccer.

## Non-Financial Risks
### Operational Risk:
As soccer is a contact sport, injuries and accidents are always a possibility, resulting in poor performance.
Poor performances can damage Rarita's popularity resulting in reduced viewership and attendance.

**Mitigation:** Employ physiotherapists, expert coaches, and trainers to physically condition athletes,
lowering the risk of injury and poor performance. Monitor player performance and performance statistics,
altering the squad as needed to maximise competitiveness.

### Sensitivity Impact of Player Injuries & Accidents

![](Operational%20Risk%20Sensitivity.png)

The table above shows the extensive damage caused by injuries and accidents to the team’s ability to win
championships. In the pessimistic case, the mean value drops by 6 championships, illustrating the effect on
team performance. Again, this likely results in economic losses and a lack of fan interest causing decreased
tourism and investment. 

### Pandemic Outbreak:
On multiple fronts, health issues are a serious concern. Players will not be allowed to compete in the FSA
tournament due to COVID-19 regulations. Restrictions on spectators and overseas travel will also be
reinstated, depending on the severity of the outbreak. This can potentially stunt the positive effects of
Rarita’s team.

**Mitigation:** Enforce vaccination requirements and ensure outbreaks are closely monitored and controlled.
Maintain social distancing rules at physical venues. 

---

## Key Assumptions

Throughout the entire project several assumptions were made including the following:

* Revenue and Expenses 
    * Used the average Rarita revenue and expenses growth rates as the expected growth in forecasting next 10 years. 
    * Assumed growth would be constant and without fluctuations. 
* Population 
    * Use the average Rarita population growth during 2011-2020 as the expected constant growth in forecasting next 10 years. 
* Nation Rank Modelling 
    * The lower estimated nation rank is used for players who play in multiple positions resulting with different ranks for each position. 
    * Assumed that a team’s estimated nation rank is equal to the average of the player’s estimated nation ranks. 
* Assumptions for Simulation 
    * Win and loss probability was based off a fitted normal distribution of estimation rank differences. 
    * Probability of drawing calculated by taking 10% of loss probability. 
    * Each team goes head-to-head once per league season. 

---

## Conclusion

Therefore it is clear that through the project we identified the problem provided to us by Hammessi Bayes and designed a solution in the form of a competitive national Rarita team. This solution includes not only the players within the team but also describes the implementation plan and the various economic impacts. Several risks have also been considered and while the provided data was very raw, the necessary assumptions were made when reaching conclusions or applying models. Through our analysis the chosen team is anticipated to bring a great positive impact to the Raritan economy under the right guidance and further monitoring.

![](Thank%20You.gif)


--- 

## References

* Yadav, M. L., & Roychoudhury, B. 2018. Handling missing values: A study of popular imputation packages in R. Knowledge-Based Systems, accessed 14th March 2022 <doi:10.1016/j.knosys.2018.06.012>
* He H. & Garcia A. E., 2009. Learning from Imbalanced Data., IEEE Transactions on Knowledge and Data Engineering. NewJersey, United States: IEEE, accessed 15th March 2022 <doi:10.1109/TKDE.2008.239>
* Allison P., 2015, Imputation by Predictive Mean Matching: Promise & Peril, Statistical Horizons, accessed 15th March 2022. https://statisticalhorizons.com/predictive-mean-matching
* James G., Witten D., Hastie T & Tibshirani R., 2013. An Introduction To Statistical Learning: with application in R, 2nd ed. NewYork: Springer





