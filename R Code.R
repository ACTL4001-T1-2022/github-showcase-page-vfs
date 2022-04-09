#ACTL4001 SOA Assignment

#Setting up required packages for analysis
{
  library(readxl)
  library(fpp3)
  library(corrplot)
  library(mice)
  library(leaps)
  library(MASS)
  library(class)
  library(glmnet)
  library(rpart)
  library(randomForest)
  library(gbm)
  library(rpart.plot)
  library(vip)
  library(caret)
  library(janitor)
  library(tidyverse)
  library(fitdistrplus)
  library(goftest)
  library(actuar)
  library(qqplotr)
}

#Importing excel sheets with variable names

#Rarita Information
{
  excel_sheets("2022-student-research-case-study-economic-data.xlsx")
  
  rarita_gdp = read_excel("2022-student-research-case-study-economic-data.xlsx",
                           sheet = 2,
                           range = "B12:F22")
  
  rarita_gni = read_excel("2022-student-research-case-study-economic-data.xlsx",
                           sheet = 2,
                           range = "H12:L22")
  
  rarita_pop = read_excel("2022-student-research-case-study-economic-data.xlsx",
                           sheet = 2,
                           range = "B26:F36")
  
  rarita_pop_dens = read_excel("2022-student-research-case-study-economic-data.xlsx",
                                sheet = 2,
                                range = "H26:L36")
  
  rarita_healthc_spend = read_excel("2022-student-research-case-study-economic-data.xlsx",
                                     sheet = 2,
                                     range = "B40:F50")
  
  rarita_hhsavrate = read_excel("2022-student-research-case-study-economic-data.xlsx",
                                 sheet = 2,
                                 range = "H40:L50")
  
  rarita_eurotodoub = read_excel("2022-student-research-case-study-economic-data.xlsx",
                                  sheet = 2,
                                  range = "B54:D59")
  
  # Data is in MM/DD/YYYY
  rarita_spot = read_excel("2022-student-research-case-study-economic-data.xlsx",
                            sheet = 3,
                            range = "B12:P72")
  
  rarita_inf = read_excel("2022-student-research-case-study-economic-data.xlsx",
                           sheet = 4,
                           range = "B11:C41")
  
  rarita_other_GDP = read_excel("2022-student-research-case-study-economic-data.xlsx",
                                 sheet = 5,
                                 range = "B12:G32")
}

#Soccer Statistics Information
{
  excel_sheets("2022-student-research-case-study-football-soccer-data.xlsx")
  
  soccer_rev_2020 = read_excel("2022-student-research-case-study-football-soccer-data.xlsx",
                                sheet = 2,
                                range = "B13:F34",)
  
  soccer_rev_2019 = read_excel("2022-student-research-case-study-football-soccer-data.xlsx",
                                sheet = 2,
                                range = "G13:J34")
  soccer_rev_2019 = cbind(soccer_rev_2020[,1], soccer_rev_2019)
  
  soccer_rev_2018 = read_excel("2022-student-research-case-study-football-soccer-data.xlsx",
                                sheet = 2,
                                range = "K13:N34")
  soccer_rev_2018 = cbind(soccer_rev_2020[,1], soccer_rev_2018)
  
  soccer_rev_2017 = read_excel("2022-student-research-case-study-football-soccer-data.xlsx",
                                sheet = 2,
                                range = "O13:R34")
  soccer_rev_2017 = cbind(soccer_rev_2020[,1], soccer_rev_2017)
  
  soccer_rev_2016 = read_excel("2022-student-research-case-study-football-soccer-data.xlsx",
                                sheet = 2,
                                range = "S13:V34")
  soccer_rev_2016 = cbind(soccer_rev_2020[,1], soccer_rev_2016)
  
  soccer_exp_2020 = read_excel("2022-student-research-case-study-football-soccer-data.xlsx",
                                sheet = 3,
                                range = "B13:E34")
  
  soccer_exp_2019 = read_excel("2022-student-research-case-study-football-soccer-data.xlsx",
                                sheet = 3,
                                range = "F13:H34")
  soccer_exp_2019 = cbind(soccer_exp_2020[,1], soccer_exp_2019)
  
  soccer_exp_2018 = read_excel("2022-student-research-case-study-football-soccer-data.xlsx",
                                sheet = 3,
                                range = "I13:K34")
  soccer_exp_2018 = cbind(soccer_exp_2020[,1], soccer_exp_2018)
  
  soccer_exp_2017 = read_excel("2022-student-research-case-study-football-soccer-data.xlsx",
                                sheet = 3,
                                range = "L13:N34")
  soccer_exp_2017 = cbind(soccer_exp_2020[,1], soccer_exp_2017)
  
  soccer_exp_2016 = read_excel("2022-student-research-case-study-football-soccer-data.xlsx",
                                sheet = 3,
                                range = "O13:Q34")
  soccer_exp_2016 = cbind(soccer_exp_2020[,1], soccer_exp_2016)
  
  soccer_attend = read_excel("2022-student-research-case-study-football-soccer-data.xlsx",
                              sheet = 4,
                              range = "B13:C34")
  
  soccer_media = read_excel("2022-student-research-case-study-football-soccer-data.xlsx",
                             sheet = 5,
                             range = "B13:G34")
}

#Player Data Information
{
  excel_sheets("2022-student-research-case-study-player-data.xlsx")
  
  leag_shoot = read_excel("2022-student-research-case-study-player-data.xlsx",
                           sheet = 2,
                           skip = 11)
  
  leag_pass = read_excel("2022-student-research-case-study-player-data.xlsx",
                          sheet = 3,
                          skip = 11)
  
  leag_def = read_excel("2022-student-research-case-study-player-data.xlsx",
                         sheet = 4,
                         skip = 11)
  
  
  leag_goalk = read_excel("2022-student-research-case-study-player-data.xlsx",
                           sheet = 5,
                           skip = 11,)
  
  
  tourn_result_2020 = read_excel("2022-student-research-case-study-player-data.xlsx",
                                  sheet = 6,
                                  range = "B11:C27")
  
  tourn_result_2021 = read_excel("2022-student-research-case-study-player-data.xlsx",
                                  sheet = 6,
                                  range = "E11:F35")
  
  tourn_shoot = read_excel("2022-student-research-case-study-player-data.xlsx",
                            sheet = 7,
                            skip = 11,
                            guess_max = 5000)
  
  tourn_pass = read_excel("2022-student-research-case-study-player-data.xlsx",
                           sheet = 8,
                           skip = 11,
                           guess_max = 5000)
  
  tourn_def = read_excel("2022-student-research-case-study-player-data.xlsx",
                          sheet = 9,
                          skip = 11,
                          guess_max = 5000)
  
  tourn_goalk = read_excel("2022-student-research-case-study-player-data.xlsx",
                            sheet = 10,
                            skip = 11)
  
  salary_2020 = read_excel("2022-student-research-case-study-player-data.xlsx",
                            sheet = 11,
                            skip=11)
  
  salary_2021 = read_excel("2022-student-research-case-study-player-data.xlsx",
                            sheet = 12,
                            skip=11)
}


################################################################################
############################### TEAM SELECTION #################################
################################################################################

# Splitting the data into 2020 and 2021
{
  tourn_shoot_2020 = tourn_shoot %>% filter( Year == "2020")
  tourn_shoot_2021 = tourn_shoot %>% filter( Year == "2021")
  tourn_pass_2020 = tourn_pass %>% filter(Year == "2020")
  tourn_pass_2021 = tourn_pass %>% filter(Year == "2021")
  tourn_def_2020 = tourn_def %>% filter(Year == "2020")
  tourn_def_2021 = tourn_def %>% filter(Year == "2021")
  tourn_goalk_2020 = tourn_goalk %>% filter(Year == "2020")
  tourn_goalk_2021 = tourn_goalk %>% filter(Year =="2021")
}

# defining the imputation function and preparing the data
impute_function = function(data, cols) {
  na.data = data %>% dplyr::select(all_of(cols))
  tempcolnames = colnames(na.data)
  colnames(na.data) = make.names(colnames(na.data))
  imp.data = mice(na.data, m=10, method='pmm', maxit=10, seed=0)
  newdata = cbind(complete(imp.data,1), dplyr::select(data, -all_of(cols)))
  colnames(newdata)[1:length(na.data)] = tempcolnames
  newdata
}

# Removing the columns with 100+ N/A entries and overlapping columns
tourn_shoot_2021 = (tourn_shoot_2021[,7:length(tourn_shoot_2021)] %>%
                      dplyr::select(-c("Standard SoT%",
                                       "Standard G/Sh",
                                       "Standard G/SoT",
                                       "Standard Dist",
                                       "Expected npxG/Sh",
                                       "League",
                                       "Year")))

tourn_pass_2021 = tourn_pass_2021[,7:length(tourn_pass_2021)] %>%
  dplyr::select(-c("League", 
                   "Year"))

tourn_def_2021 = tourn_def_2021[,7:length(tourn_def_2021)] %>%
  dplyr::select(-c("Vs Dribbles Tkl%",
                   "League",
                   "Year"))

tourn_goalk_2021 = tourn_goalk_2021 %>% 
  dplyr::select(-c("Penalty Kicks Save%",
                   "League",
                   "Year",
                   "Born"))

# Imputing columns with <100 N/A entries
tourn_pass_2021 = impute_function(tourn_pass_2021,
                                  c("Total Cmp%", "Short Cmp%", "Medium Cmp%", "Long Cmp%"))
tourn_def_2021 = impute_function(tourn_def_2021,
                                 c("Pressures %", "Tackles Tkl"))
tourn_goalk_2021 = impute_function(tourn_goalk_2021,
                                   c("Performance Save%", "Performance CS%"))

# Removing highly correlated columns after looking at the correlation plot
tourn_shoot_2021 = tourn_shoot_2021 %>% 
  dplyr::select(-c("Standard Sh/90",
                   "Standard SoT/90",
                   "Expected xG",
                   "Expected npxG",
                   "Expected np:G-xG"))

tourn_pass_2021 = tourn_pass_2021 %>%
  dplyr::select(-c("Total Cmp%",
                   "Total Cmp",
                   "Total Att",
                   "Total TotDist",
                   "Total PrgDist",
                   "Short Att",
                   "Medium Att",
                   "Long Att",
                   "A-xA"))

tourn_def_2021 = tourn_def_2021 %>% 
  dplyr::select(-c("Tackles Tkl",
                   "Tackles TklW",
                   "Tkl+Int",
                   "Vs Dribbles Att",
                   "Vs Dribbles Tkl",
                   "Pressures Press",
                   "Blocks Blocks"))

tourn_goalk_2021 = tourn_goalk_2021 %>%
  dplyr::select(-c("Playing Time MP",
                   "Playing Time Starts",
                   "Performance GA90",
                   "Performance SoTA",
                   "Playing Time 90s",
                   "Performance GA",
                   "Performance CS"))

# Correlation plots for separated data
corrplot.mixed(cor(tourn_shoot_2021, use = 'complete.obs'), 
               lower = "circle", 
               upper = "number", 
               tl.pos = "lt", 
               diag = "u")

corrplot.mixed(cor(tourn_pass_2021, use = 'complete.obs'), 
               lower = "circle", 
               upper = "number", 
               tl.pos = "lt", 
               diag = "u")

corrplot.mixed(cor(tourn_def_2021, use = 'complete.obs'), 
               lower = "circle", 
               upper = "number", 
               tl.pos = "lt", 
               diag = "u")

corrplot.mixed(cor(tourn_goalk_2021[,-3:-5], use = 'complete.obs'), 
               lower = "circle", 
               upper = "number", 
               tl.pos = "lt", 
               diag = "u")

# Combining all shooting, passing and defense data into one table
tourn_data = cbind((tourn_shoot %>% filter(Year=="2021"))[,1:6],
                   tourn_shoot_2021,
                   tourn_pass_2021,
                   tourn_def_2021)

# Correlation plot for combined data
corrplot.mixed(cor(tourn_data[,6:length(tourn_data)], use = 'complete.obs'), 
               lower = "circle", 
               upper = "number", 
               tl.pos = "lt", 
               diag = "u")

# Formatting the combined data
tourn_data = left_join(tourn_data, tourn_result_2021, by = c("Nation" = "Country"))
tourn_data = tourn_data %>% dplyr::select(-"Born")
tourn_data$Nation = as.factor(tourn_data$Nation)
tourn_data$Pos = as.factor(tourn_data$Pos)
colnames(tourn_data) = make.names(colnames(tourn_data))
colnames(tourn_data)[41] = "NationRank"
summary(tourn_data)

tourn_goalk_2021 = left_join(tourn_goalk_2021, tourn_result_2021, by = c("Nation" = "Country"))
tourn_goalk_2021$Nation = as.factor(tourn_goalk_2021$Nation)
tourn_goalk_2021$Pos = as.factor(tourn_goalk_2021$Pos)
colnames(tourn_goalk_2021) = make.names(colnames(tourn_goalk_2021))
colnames(tourn_goalk_2021)[16] = "NationRank"
summary(tourn_goalk_2021)

################################################################################
################################### FOWARDS ####################################
################################################################################

# Filtering out the forwards
summary(tourn_data$Pos)
fw_2021 = tourn_data %>% filter(Pos %in% c("FW", "FWDF", "FWMF", "MFFW"))

# Splitting training and test subsets (70/30 split)
set.seed(0)
index = sample(2, nrow(fw_2021), replace = TRUE, prob=c(0.7,0.3))
fw_2021_train = fw_2021[index==1,]
fw_2021_test = fw_2021[index==2,]


################################## MODELLING ###################################

# Multiple Linear Regression
fw_lreg = glm(NationRank~ ., data = fw_2021_train[,-1:-3], family="gaussian")
coef(fw_lreg)
summary(fw_lreg)
pred_fw_lreg = predict(fw_lreg, newdata = fw_2021_test[,-1:-3])

# Linear Discriminant Analysis
fw_lda = lda(NationRank~ ., data = fw_2021_train[,-1:-3])
coef(fw_lda)
pred_fw_lda = predict(fw_lda, newdata = fw_2021_test[,-1:-3])$class
pred_fw_lda = as.numeric(as.vector(pred_fw_lda))

# K Nearest Neighbours
fw_knn = knnreg(fw_2021_train[,c(-1:-3, -41)], fw_2021_train[,41])
str(fw_knn)
pred_fw_knn = predict(fw_knn, newdata = fw_2021_test[,c(-1:-3, -41)])

# Lasso Regression
set.seed(0)
fw_cvlasso = cv.glmnet(model.matrix(NationRank~., data=fw_2021_train[,-1:-3])[,-1], 
                       fw_2021_train[,-1:-3]$NationRank, 
                       alpha = 1)
coef(fw_cvlasso)

{
  par(mar=c(3,3,6,1))
  plot(fw_cvlasso)
  title("Lasso Regression Cross Validation", adj = 0, line=3)
}

pred_fw_lasso = predict(fw_cvlasso, 
                        newx = model.matrix(NationRank~., data=fw_2021_test[,-1:-3])[,-1], 
                        s = fw_cvlasso$lambda.min)

# Ridge Regression
set.seed(0)
fw_cvridge = cv.glmnet(model.matrix(NationRank~., data=fw_2021_train[,-1:-3])[,-1], 
                       fw_2021_train[,-1:-3]$NationRank, 
                       alpha = 0)
coef(fw_cvridge)

{
  par(mar=c(3,3,6,1))
  plot(fw_cvridge)
  title("Ridge Regression Cross Validation", adj = 0, line=3)
}

pred_fw_ridge = predict(fw_cvridge, 
                        newx = model.matrix(NationRank~., data=fw_2021_test[,-1:-3])[,-1], 
                        s = fw_cvridge$lambda.min)

# Decision Tree
set.seed(0)
fw_tree = rpart(NationRank~., 
                data=fw_2021_train[,-1:-3], 
                method="anova", 
                cp=0.002)
fw_tree

rpart.plot(fw_tree)
pred_fw_tree = predict(fw_tree, newdata = fw_2021_test[,-1:-3])

# Random Forest
set.seed(0)
fw_rf = randomForest(NationRank~., 
                     data=fw_2021_train[,-1:-3], 
                     importance = T)
importance(fw_rf)

plot(fw_rf, main="Number of Trees vs Error Rate for Random Forests")
pred_fw_rf = predict(fw_rf, newdata = fw_2021_test[,-1:-3])

# Bagging
set.seed(0)
fw_bag = randomForest(NationRank~., 
                      data=fw_2021_train[,-1:-3], 
                      seed = 1, 
                      mtry = (ncol(fw_2021_train[,-1:-3])-1), 
                      importance = T)
importance(fw_bag)

plot(fw_bag, main="Number of Trees vs Error Rate for Bagging")
pred_fw_bag = predict(fw_bag, newdata = fw_2021_test[,-1:-3])

# Boosting
set.seed(0)
fw_boost = gbm(NationRank~., 
               data=fw_2021_train[,-1:-3], 
               distribution = "gaussian", 
               n.trees = 5000, 
               interaction.depth = 5, 
               shrinkage = 0.1, 
               cv.folds=10)

vip(fw_boost, num_features = ncol(fw_2021_train[,-1:-3]) - 1, 
    aesthetics = list(fill = "darkblue")) +
  scale_y_continuous(breaks = seq(0, 60, 5)) +
  labs(title = "Variable Importance Plot for Boosting Method", x = "Relative Influence")

gbm.perf(fw_boost, method="cv")

pred_fw_boost = predict(fw_boost, newdata = fw_2021_test[,-1:-3])

################################# EVALUATING ###################################

# Creating a function to calculate evaluation criterion
eval_crit = function(true, predicted) {
  RSQ = cor(true, predicted)^2
  MSE = mean((true-predicted)^2)
  RMSE = sqrt(MSE)
  MAE = mean(abs(true-predicted))
  
  crit = data.frame(RSQ, MSE, RMSE, MAE)
  colnames(crit) = c("R Squared", "MSE", "RMSE", "MAE")
  crit
}

{
  fw_models = bind_rows(eval_crit(fw_2021_test$NationRank, pred_fw_lreg),
                        eval_crit(fw_2021_test$NationRank, pred_fw_lda),
                        eval_crit(fw_2021_test$NationRank, pred_fw_knn),
                        eval_crit(fw_2021_test$NationRank, pred_fw_lasso),
                        eval_crit(fw_2021_test$NationRank, pred_fw_ridge),
                        eval_crit(fw_2021_test$NationRank, pred_fw_tree),
                        eval_crit(fw_2021_test$NationRank, pred_fw_rf),
                        eval_crit(fw_2021_test$NationRank, pred_fw_bag),
                        eval_crit(fw_2021_test$NationRank, pred_fw_boost))
  rownames(fw_models) = c("Logistic Regression",
                          "Linear Discriminant Analysis",
                          "KNN",
                          "Lasso Regression",
                          "Ridge Regression",
                          "Decision Tree",
                          "Random Forests",
                          "Bagging",
                          "Boosting")
  fw_models
}

################################################################################
################################# MIDFIELDERS ##################################
################################################################################

# Filtering out the forwards
summary(tourn_data$Pos)
mf_2021 = tourn_data %>% filter(Pos %in% c("MF", "MFDF", "MFFW", "FWMF", "DFMF"))

# Splitting training and test subsets (70/30 split)
set.seed(0)
index = sample(2, nrow(mf_2021), replace = TRUE, prob=c(0.7,0.3))
mf_2021_train = mf_2021[index==1,]
mf_2021_test = mf_2021[index==2,]


################################## MODELLING ###################################

# Multiple Linear Regression
mf_lreg = glm(NationRank~ ., data = mf_2021_train[,-1:-3], family="gaussian")
coef(mf_lreg)
summary(mf_lreg)
pred_mf_lreg = predict(mf_lreg, newdata = mf_2021_test[,-1:-3])

# Linear Discriminant Analysis
mf_lda = lda(NationRank~ ., data = mf_2021_train[,-1:-3])
coef(mf_lda)
pred_mf_lda = predict(mf_lda, newdata = mf_2021_test[,-1:-3])$class
pred_mf_lda = as.numeric(as.vector(pred_mf_lda))

# K Nearest Neighbours
mf_knn = knnreg(mf_2021_train[,c(-1:-3, -41)], mf_2021_train[,41])
str(mf_knn)
pred_mf_knn = predict(mf_knn, newdata = mf_2021_test[,c(-1:-3, -41)])

# Lasso Regression
set.seed(0)
mf_cvlasso = cv.glmnet(model.matrix(NationRank~., data=mf_2021_train[,-1:-3])[,-1], 
                       mf_2021_train[,-1:-3]$NationRank, 
                       alpha = 1)
coef(mf_cvlasso)

{
  par(mar=c(3,3,6,1))
  plot(mf_cvlasso)
  title("Lasso Regression Cross Validation", adj = 0, line=3)
}

pred_mf_lasso = predict(mf_cvlasso, 
                        newx = model.matrix(NationRank~., data=mf_2021_test[,-1:-3])[,-1], 
                        s = mf_cvlasso$lambda.min)

# Ridge Regression
set.seed(0)
mf_cvridge = cv.glmnet(model.matrix(NationRank~., data=mf_2021_train[,-1:-3])[,-1], 
                       mf_2021_train[,-1:-3]$NationRank, 
                       alpha = 0)
coef(mf_cvridge)

{
  par(mar=c(3,3,6,1))
  plot(mf_cvridge)
  title("Ridge Regression Cross Validation", adj = 0, line=3)
}

pred_mf_ridge = predict(mf_cvridge, 
                        newx = model.matrix(NationRank~., data=mf_2021_test[,-1:-3])[,-1], 
                        s = mf_cvridge$lambda.min)

# Decision Tree
set.seed(0)
mf_tree = rpart(NationRank~., 
                data=mf_2021_train[,-1:-3], 
                method="anova", 
                cp=0.002)
mf_tree

rpart.plot(mf_tree)
pred_mf_tree = predict(mf_tree, newdata = mf_2021_test[,-1:-3])

# Random Forest
set.seed(0)
mf_rf = randomForest(NationRank~., 
                     data=mf_2021_train[,-1:-3], 
                     importance = T)
importance(mf_rf)

plot(mf_rf, main="Number of Trees vs Error Rate for Random Forests")
pred_mf_rf = predict(mf_rf, newdata = mf_2021_test[,-1:-3])

# Bagging
set.seed(0)
mf_bag = randomForest(NationRank~., 
                      data=mf_2021_train[,-1:-3], 
                      seed = 1, 
                      mtry = (ncol(mf_2021_train[,-1:-3])-1), 
                      importance = T)
importance(mf_bag)

plot(mf_bag, main="Number of Trees vs Error Rate for Bagging")
pred_mf_bag = predict(mf_bag, newdata = mf_2021_test[,-1:-3])

# Boosting
set.seed(0)
mf_boost = gbm(NationRank~., 
               data=mf_2021_train[,-1:-3], 
               distribution = "gaussian", 
               n.trees = 5000, 
               interaction.depth = 5, 
               shrinkage = 0.1, 
               cv.folds=10)

vip(mf_boost, num_features = ncol(mf_2021_train[,-1:-3]) - 1, 
    aesthetics = list(fill = "darkblue")) +
  scale_y_continuous(breaks = seq(0, 60, 5)) +
  labs(title = "Variable Importance Plot for Boosting Method", x = "Relative Influence")

gbm.perf(mf_boost, method="cv")

pred_mf_boost = predict(mf_boost, newdata = mf_2021_test[,-1:-3])

################################# EVALUATING ###################################

# Creating a function to calculate evaluation criterion
eval_crit = function(true, predicted) {
  RSQ = cor(true, predicted)^2
  MSE = mean((true-predicted)^2)
  RMSE = sqrt(MSE)
  MAE = mean(abs(true-predicted))
  
  crit = data.frame(RSQ, MSE, RMSE, MAE)
  colnames(crit) = c("R Squared", "MSE", "RMSE", "MAE")
  crit
}

{
  mf_models = bind_rows(eval_crit(mf_2021_test$NationRank, pred_mf_lreg),
                        eval_crit(mf_2021_test$NationRank, pred_mf_lda),
                        eval_crit(mf_2021_test$NationRank, pred_mf_knn),
                        eval_crit(mf_2021_test$NationRank, pred_mf_lasso),
                        eval_crit(mf_2021_test$NationRank, pred_mf_ridge),
                        eval_crit(mf_2021_test$NationRank, pred_mf_tree),
                        eval_crit(mf_2021_test$NationRank, pred_mf_rf),
                        eval_crit(mf_2021_test$NationRank, pred_mf_bag),
                        eval_crit(mf_2021_test$NationRank, pred_mf_boost))
  rownames(mf_models) = c("Logistic Regression",
                          "Linear Discriminant Analysis",
                          "KNN",
                          "Lasso Regression",
                          "Ridge Regression",
                          "Decision Tree",
                          "Random Forests",
                          "Bagging",
                          "Boosting")
  mf_models
}

################################################################################
################################## DEFENDERS ###################################
################################################################################

# Filtering out the forwards
summary(tourn_data$Pos)
def_2021 = tourn_data %>% filter(Pos %in% c("DF", "DFFW", "DFMF", "FWDF", "MFDF"))

# Splitting training and test subsets (70/30 split)
set.seed(0)
index = sample(2, nrow(def_2021), replace = TRUE, prob=c(0.7,0.3))
def_2021_train = def_2021[index==1,]
def_2021_test = def_2021[index==2,]


################################## MODELLING ###################################

# Multiple Linear Regression
def_lreg = glm(NationRank~ ., data = def_2021_train[,-1:-3], family="gaussian")
coef(def_lreg)
summary(def_lreg)
pred_def_lreg = predict(def_lreg, newdata = def_2021_test[,-1:-3])

# Linear Discriminant Analysis
def_lda = lda(NationRank~ ., data = def_2021_train[,-1:-3])
coef(def_lda)
pred_def_lda = predict(def_lda, newdata = def_2021_test[,-1:-3])$class
pred_def_lda = as.numeric(as.vector(pred_def_lda))

# K Nearest Neighbours
def_knn = knnreg(def_2021_train[,c(-1:-3, -41)], def_2021_train[,41])
str(def_knn)
pred_def_knn = predict(def_knn, newdata = def_2021_test[,c(-1:-3, -41)])

# Lasso Regression
set.seed(0)
def_cvlasso = cv.glmnet(model.matrix(NationRank~., data=def_2021_train[,-1:-3])[,-1], 
                        def_2021_train[,-1:-3]$NationRank, 
                        alpha = 1)
coef(def_cvlasso)

{
  par(mar=c(3,3,6,1))
  plot(def_cvlasso)
  title("Lasso Regression Cross Validation", adj = 0, line=3)
}

pred_def_lasso = predict(def_cvlasso, 
                         newx = model.matrix(NationRank~., data=def_2021_test[,-1:-3])[,-1], 
                         s = def_cvlasso$lambda.min)

# Ridge Regression
set.seed(0)
def_cvridge = cv.glmnet(model.matrix(NationRank~., data=def_2021_train[,-1:-3])[,-1], 
                        def_2021_train[,-1:-3]$NationRank, 
                        alpha = 0)
coef(def_cvridge)

{
  par(mar=c(3,3,6,1))
  plot(def_cvridge)
  title("Ridge Regression Cross Validation", adj = 0, line=3)
}

pred_def_ridge = predict(def_cvridge, 
                         newx = model.matrix(NationRank~., data=def_2021_test[,-1:-3])[,-1], 
                         s = def_cvridge$lambda.min)

# Decision Tree
set.seed(0)
def_tree = rpart(NationRank~., 
                 data=def_2021_train[,-1:-3], 
                 method="anova", 
                 cp=0.002)
def_tree

rpart.plot(def_tree)
pred_def_tree = predict(def_tree, newdata = def_2021_test[,-1:-3])

# Random Forest
set.seed(0)
def_rf = randomForest(NationRank~., 
                      data=def_2021_train[,-1:-3], 
                      importance = T)
importance(def_rf)

plot(def_rf, main="Number of Trees vs Error Rate for Random Forests")
pred_def_rf = predict(def_rf, newdata = def_2021_test[,-1:-3])

# Bagging
set.seed(0)
def_bag = randomForest(NationRank~., 
                       data=def_2021_train[,-1:-3], 
                       seed = 1, 
                       mtry = (ncol(def_2021_train[,-1:-3])-1), 
                       importance = T)
importance(def_bag)

plot(def_bag, main="Number of Trees vs Error Rate for Bagging")
pred_def_bag = predict(def_bag, newdata = def_2021_test[,-1:-3])

# Boosting
set.seed(0)
def_boost = gbm(NationRank~., 
                data=def_2021_train[,-1:-3], 
                distribution = "gaussian", 
                n.trees = 5000, 
                interaction.depth = 5, 
                shrinkage = 0.1, 
                cv.folds=10)

vip(def_boost, num_features = ncol(def_2021_train[,-1:-3]) - 1, 
    aesthetics = list(fill = "darkblue")) +
  scale_y_continuous(breaks = seq(0, 60, 5)) +
  labs(title = "Variable Importance Plot for Boosting Method", x = "Relative Influence")

gbm.perf(def_boost, method="cv")

pred_def_boost = predict(def_boost, newdata = def_2021_test[,-1:-3])

################################# EVALUATING ###################################

# Creating a function to calculate evaluation criterion
eval_crit = function(true, predicted) {
  RSQ = cor(true, predicted)^2
  MSE = mean((true-predicted)^2)
  RMSE = sqrt(MSE)
  MAE = mean(abs(true-predicted))
  
  crit = data.frame(RSQ, MSE, RMSE, MAE)
  colnames(crit) = c("R Squared", "MSE", "RMSE", "MAE")
  crit
}

{
  def_models = bind_rows(eval_crit(def_2021_test$NationRank, pred_def_lreg),
                         eval_crit(def_2021_test$NationRank, pred_def_lda),
                         eval_crit(def_2021_test$NationRank, pred_def_knn),
                         eval_crit(def_2021_test$NationRank, pred_def_lasso),
                         eval_crit(def_2021_test$NationRank, pred_def_ridge),
                         eval_crit(def_2021_test$NationRank, pred_def_tree),
                         eval_crit(def_2021_test$NationRank, pred_def_rf),
                         eval_crit(def_2021_test$NationRank, pred_def_bag),
                         eval_crit(def_2021_test$NationRank, pred_def_boost))
  rownames(def_models) = c("Logistic Regression",
                           "Linear Discriminant Analysis",
                           "KNN",
                           "Lasso Regression",
                           "Ridge Regression",
                           "Decision Tree",
                           "Random Forests",
                           "Bagging",
                           "Boosting")
  def_models
}

################################################################################
################################# GOALKEEPERS ##################################
################################################################################

gk_2021 = tourn_goalk_2021

# Splitting training and test subsets (70/30 split)
set.seed(0)
index = sample(2, nrow(gk_2021), replace = TRUE, prob=c(0.7,0.3))
gk_2021_train = gk_2021[index==1,]
gk_2021_test = gk_2021[index==2,]


################################## MODELLING ###################################

# Multiple Linear Regression
gk_lreg = glm(NationRank~ ., data = gk_2021_train[,-3:-5], family="gaussian")
coef(gk_lreg)
summary(gk_lreg)
pred_gk_lreg = predict(gk_lreg, newdata = gk_2021_test[,-3:-5])

# K Nearest Neighbours
gk_knn = knnreg(gk_2021_train[,c(-3:-5, -16)], gk_2021_train[,16])
str(gk_knn)
pred_gk_knn = predict(gk_knn, newdata = gk_2021_test[,c(-3:-5, -16)])

# Lasso Regression
set.seed(0)
gk_cvlasso = cv.glmnet(model.matrix(NationRank~., data=gk_2021_train[,-3:-5])[,-1], 
                       gk_2021_train[,-3:-5]$NationRank, 
                       alpha = 1,
                       grouped=FALSE)
coef(gk_cvlasso)

{
  par(mar=c(3,3,6,1))
  plot(gk_cvlasso)
  title("Lasso Regression Cross Validation", adj = 0, line=3)
}

pred_gk_lasso = predict(gk_cvlasso, 
                        newx = model.matrix(NationRank~., data=gk_2021_test[,-3:-5])[,-1], 
                        s = gk_cvlasso$lambda.min)

# Ridge Regression
set.seed(0)
gk_cvridge = cv.glmnet(model.matrix(NationRank~., data=gk_2021_train[,-3:-5])[,-1], 
                       gk_2021_train[,-3:-5]$NationRank, 
                       alpha = 0,
                       grouped=FALSE)
coef(gk_cvridge)

{
  par(mar=c(3,3,6,1))
  plot(gk_cvridge)
  title("Ridge Regression Cross Validation", adj = 0, line=3)
}

pred_gk_ridge = predict(gk_cvridge, 
                        newx = model.matrix(NationRank~., data=gk_2021_test[,-3:-5])[,-1], 
                        s = gk_cvridge$lambda.min)

# Decision Tree
set.seed(0)
gk_tree = rpart(NationRank~., 
                data=gk_2021_train[,-3:-5], 
                method="anova", 
                cp=0.001)
gk_tree

rpart.plot(gk_tree)
pred_gk_tree = predict(gk_tree, newdata = gk_2021_test[,-3:-5])

# Random Forest
set.seed(0)
gk_rf = randomForest(NationRank~., 
                     data=gk_2021_train[,-3:-5], 
                     importance = T)
importance(gk_rf)

plot(gk_rf, main="Number of Trees vs Error Rate for Random Forests")
pred_gk_rf = predict(gk_rf, newdata = gk_2021_test[,-3:-5])

# Bagging
set.seed(0)
gk_bag = randomForest(NationRank~., 
                      data=gk_2021_train[,-3:-5], 
                      seed = 1, 
                      mtry = (ncol(gk_2021_train[,-3:-5])-1), 
                      importance = T)
importance(gk_bag)

plot(gk_bag, main="Number of Trees vs Error Rate for Bagging")
pred_gk_bag = predict(gk_bag, newdata = gk_2021_test[,-3:-5])

# Boosting
set.seed(0)
gk_boost = gbm(NationRank~., 
               data=gk_2021_train[,-3:-5], 
               distribution = "gaussian", 
               n.trees = 5000, 
               interaction.depth = 5, 
               shrinkage = 0.1, 
               bag.fraction = 1.4)

vip(gk_boost, num_features = ncol(gk_2021_train[,-3:-5]) - 1, 
    aesthetics = list(fill = "darkblue")) +
  scale_y_continuous(breaks = seq(0, 60, 5)) +
  labs(title = "Variable Importance Plot for Boosting Method", x = "Relative Influence")

pred_gk_boost = predict(gk_boost, newdata = gk_2021_test[,-3:-5])

################################# EVALUATING ###################################

# Creating a function to calculate evaluation criterion
eval_crit = function(true, predicted) {
  RSQ = cor(true, predicted)^2
  MSE = mean((true-predicted)^2)
  RMSE = sqrt(MSE)
  MAE = mean(abs(true-predicted))
  
  crit = data.frame(RSQ, MSE, RMSE, MAE)
  colnames(crit) = c("R Squared", "MSE", "RMSE", "MAE")
  crit
}

{
  gk_models = bind_rows(eval_crit(gk_2021_test$NationRank, pred_gk_lreg),
                        eval_crit(gk_2021_test$NationRank, pred_gk_knn),
                        eval_crit(gk_2021_test$NationRank, pred_gk_lasso),
                        eval_crit(gk_2021_test$NationRank, pred_gk_ridge),
                        eval_crit(gk_2021_test$NationRank, pred_gk_tree),
                        eval_crit(gk_2021_test$NationRank, pred_gk_rf),
                        eval_crit(gk_2021_test$NationRank, pred_gk_bag),
                        eval_crit(gk_2021_test$NationRank, pred_gk_boost))
  rownames(gk_models) = c("Logistic Regression",
                          "KNN",
                          "Lasso Regression",
                          "Ridge Regression",
                          "Decision Tree",
                          "Random Forests",
                          "Bagging",
                          "Boosting")
  gk_models
}

################################################################################
######################## PREDICTION AND TEAM SELECTION #########################
################################################################################

# Splitting the data into 2020 and 2021
{
  leag_shoot_2020 = leag_shoot %>% filter( Year == "2020")
  leag_shoot_2021 = leag_shoot %>% filter( Year == "2021")
  leag_pass_2020 = leag_pass %>% filter(Year == "2020")
  leag_pass_2021 = leag_pass %>% filter(Year == "2021")
  leag_def_2020 = leag_def %>% filter(Year == "2020")
  leag_def_2021 = leag_def %>% filter(Year == "2021")
  leag_goalk_2020 = leag_goalk %>% filter(Year == "2020")
  leag_goalk_2021 = leag_goalk %>% filter(Year =="2021")
}

# Extracting the columns required for input in the model
leag_shoot_2021 = leag_shoot_2021[,colnames(leag_shoot_2021) %in% colnames(tourn_shoot_2021)]
leag_pass_2021 = leag_pass_2021[,colnames(leag_pass_2021) %in% colnames(tourn_pass_2021)]
leag_def_2021 = leag_def_2021[,colnames(leag_def_2021) %in% colnames(tourn_def_2021)]
leag_goalk_2021 = leag_goalk_2021[,make.names(colnames(leag_goalk_2021)) %in% make.names(colnames(tourn_goalk_2021))]

# Imputing the N/A columns 
leag_pass_2021 = impute_function(leag_pass_2021, 
                                 c("Short Cmp%", "Medium Cmp%", "Long Cmp%"))
leag_def_2021 = impute_function(leag_def_2021, 
                                c("Pressures %", "Int"))
leag_goalk_2021 = impute_function(leag_goalk_2021,
                                  c("Performance Save%", "Performance CS%"))

# Combining all shooting, passing and defense data into one table
leag_data = cbind((leag_shoot %>% filter(Year=="2021"))[,c(1:5,7)],
                  leag_shoot_2021,
                  leag_pass_2021,
                  leag_def_2021)

leag_data$Nation = as.factor(leag_data$Nation)
leag_data$Pos = as.factor(leag_data$Pos)
leag_data$Squad = as.factor(leag_data$Squad)
colnames(leag_data) = make.names(colnames(leag_data))
summary(leag_data)

leag_goalk_2021 = cbind((leag_goalk %>% filter(Year =="2021"))[,4], leag_goalk_2021)

leag_goalk_2021$Nation = as.factor(leag_goalk_2021$Nation)
leag_goalk_2021$Pos = as.factor(leag_goalk_2021$Pos)
leag_goalk_2021$Squad = as.factor(leag_goalk_2021$Squad)
colnames(leag_goalk_2021) = make.names(colnames(leag_goalk_2021))
summary(leag_goalk_2021)


################################################################################
############################### TEAM SELECTION #################################
################################################################################

# Predicting the nation rank for each league player
fw_eval_2021 = leag_data %>% filter(Pos %in% c("FW", "FWDF", "FWMF", "MFFW"))
fw_eval = predict(fw_boost, newdata = fw_eval_2021)
fw_eval_2021 = cbind(fw_eval_2021, EstNationRank = fw_eval)

mf_eval_2021 = leag_data %>% filter(Pos %in% c("MF", "MFDF", "MFFW", "FWMF", "DFMF"))
mf_eval = predict(mf_rf, newdata = mf_eval_2021)
mf_eval_2021 = cbind(mf_eval_2021, EstNationRank = mf_eval)

def_eval_2021 = leag_data %>% filter(Pos %in% c("DF", "DFFW", "DFMF", "FWDF", "MFDF"))
def_eval = predict(def_bag, newdata = def_eval_2021)
def_eval_2021 = cbind(def_eval_2021, EstNationRank = def_eval)

gk_eval_2021 = leag_goalk_2021
gk_eval = predict(gk_boost, newdata = gk_eval_2021)
gk_eval_2021 = cbind(gk_eval_2021, EstNationRank = gk_eval)

# Filtering out by the top 50 players for each position
fw_players = fw_eval_2021[order(fw_eval, decreasing = FALSE)[1:50], ]
mf_players = mf_eval_2021[order(mf_eval, decreasing = FALSE)[1:50], ]
def_players = def_eval_2021[order(def_eval, decreasing = FALSE)[1:50], ]
gk_players = gk_eval_2021[order(gk_eval, decreasing = FALSE)[1:50],]

fw_players_rarita = fw_eval_2021[order(fw_eval, decreasing = FALSE)[1:200], ] %>%
  filter(Nation == "Rarita")
mf_players_rarita = mf_eval_2021[order(mf_eval, decreasing = FALSE)[1:200], ] %>%
  filter(Nation == "Rarita")
def_players_rarita = def_eval_2021[order(def_eval, decreasing = FALSE)[1:200], ] %>%
  filter(Nation == "Rarita")
gk_players_rarita = gk_eval_2021[order(gk_eval, decreasing = FALSE)[1:200],] %>%
  filter(Nation == "Rarita")

################################################################################
################################ SIMULATIONS ###################################
################################################################################

# Combining forward, midfielder and defender data for simulation
sim_data = rbind(fw_eval_2021, mf_eval_2021, def_eval_2021)

# Removing the duplicate players by taking the lower of the two estimated nation rank
new_sim_data = sim_data 

for (i in 1:length(sim_data[duplicated(sim_data[,-42]),1])) {
  temp_player = sim_data[duplicated(sim_data[,1]),1][i]
  temp_player_rows = sim_data %>% 
    filter(Player == temp_player) %>%
    arrange(EstNationRank, decreasing = FALSE)
  updated_player_row = temp_player_rows[1,]
  
  new_sim_data = filter(new_sim_data, !Player == temp_player)
  new_sim_data = rbind(new_sim_data, updated_player_row)
}

# Selecting the players for the chosen team
rarita_players = c('R. Mensah',
                   'Z. Nassolo',
                   'R. Tsao',
                   'C. Tukamushaba',
                   'F. Yunusa',
                   'S. Szabó',
                   'T. Larsson',
                   'H. Zare',
                   'G. Namuganza',
                   'E. Nakanjako',
                   'A. Tindimwebwa',
                   'H. Tourgeman',
                   'J. López',
                   'B. Mhamid',
                   'M. Muhindo',
                   'I. Shoshan',
                   'P. Rabiu',
                   'H. Mubaiwa',
                   'Y. Torres',
                   'W. Martinez',
                   'H. Amade',
                   'W. Nasiru',
                   'Y. Acola')

# Creating two data frames containing the estimated nation ranks for all players
rarita_team = filter(new_sim_data, Player %in% rarita_players)
rarita_team = rarita_team[,c(1,42)]
rarita_team_gk = filter(gk_players, Player %in% rarita_players)
rarita_team_gk = rarita_team_gk[, c(4,17)]
rarita_team_final = rbind(rarita_team, rarita_team_gk)

non_rarita_team = filter(new_sim_data, !Player %in% rarita_players)
non_rarita_team = non_rarita_team[,c(1,4,42)]
non_rarita_team_gk = filter(gk_players, !Player %in% rarita_players)
non_rarita_team_gk = non_rarita_team_gk[,c(4,1,17)]
non_rarita_team_final = rbind(non_rarita_team, non_rarita_team_gk)

# Calculating the average estimated nation rank for each team
rarita_team_score = mean(rarita_team_final$EstNationRank)

squad_rank = matrix(rep(0,99), nrow=99, ncol=1)
for (i in c(1:98)){
  squadplayers = non_rarita_team_final %>%
    filter(Squad == unique(new_sim_data$Squad)[i])
  avgrank = mean(squadplayers$EstNationRank)
  squad_rank[i,1] = avgrank
}

squad_rank[99,1] = rarita_team_score

squad_rank = as.data.frame(squad_rank)
new_sim_data$Squad = as.character(new_sim_data$Squad)
squads = c(unique(new_sim_data$Squad), "Rarita")
squad_rank_final = cbind(squads, squad_rank)
colnames(squad_rank_final)[2] = "MeanEstNationRank"

# Calculating all the differences between estimated nation ranks for each squad
differences <- c()
for (i in c(1:98)){
  for (j in c((i+1):99)){
    diff <- squad_rank_final[i,2] - squad_rank_final[j,2]
    differences = c(differences,diff)
  }
}

# Fitting the normal distribution to the differences
norm_fit = fitdistr(differences, "normal")

# Performing the Kolmogorov-Smirnov and Anderson Darling GOF tests
set.seed(0)
ks.test(differences, pnorm)
ad.test(differences, pnorm)

# Density Plot
ggplot(data.frame(differences), mapping = aes(x=differences)) + 
  geom_histogram(aes(y=..density..), 
                 color="black", 
                 fill = "cornsilk", 
                 binwidth = 0.5) +
  stat_function(fun=dnorm, 
                args=list(mean=norm_fit$estimate[1], 
                          sd=sqrt(norm_fit$estimate[2])), 
                lwd=1.25, 
                aes(colour="Normal")) +
  labs(title = "Histogram and Normal Density Plot", 
       x = "Differences", 
       y = "Density", 
       color = "Legend")
  
# Q-Q Plot
{
ggplot(data.frame(differences), aes(sample=differences)) +
  geom_abline(slope=1, 
              intercept=0) + 
  stat_qq(distribution=qnorm, 
          dparams=list(mean = norm_fit$estimate[1], 
                       sd=sqrt(norm_fit$estimate[2])),
          aes(color="Normal")) +
  labs(title="Q-Q Plot", 
       x="Theoretical Quartiles", 
       y="Empirical Quartiles",
       color = "Legend")
}

# CDF Plot
{
ggplot(data.frame(differences), mapping = aes(x=differences)) + 
  stat_ecdf(lwd=1.25) +
  stat_function(fun=pnorm, 
                args=list(mean = norm_fit$estimate[1], 
                          sd=sqrt(norm_fit$estimate[2])), 
                lwd=1.5, 
                aes(colour="Normal")) +
  labs(title="Empirical vs Theoretical Cumulative Distributions", 
       x="Differences", 
       y="Cumulative Density", 
       color = "Legend") 
}

# P-P Plot
{
ggplot(data.frame(differences), aes(sample=differences)) + 
  geom_abline(slope=1, intercept=0) + 
  coord_flip() + 
  stat_pp_point(distribution="norm", dparams=list(mean = norm_fit$estimate[1], 
                                                   sd=sqrt(norm_fit$estimate[2])), 
                aes(colour="Normal")) +
  labs(title="Empirical vs Theoretical P-P Plots", 
       x="Empirical Probabilities", 
       y="Theoretical Probabilities",
       color = "Legend") 
}

# Simulating a league where every team plays against each other once

fsa_probability <- c()

for (l in c(1:500)) {

sim_results <- c()

for (k in c(1:10)) {
  
  scoreboard <- cbind(squad_rank_final[1], 0)
  colnames(scoreboard) = c("Squad", "Score")
  
  for (i in c(1:98)){
    for (j in c((i+1):99)){
      diff <- squad_rank_final[i,2] - squad_rank_final[j,2]
      if (diff < 0) {
      p_win <- 1-pnorm(diff, mean = 0.03057852, sd = 1.18235401)
      p_lose <- 1-p_win
      p_draw <- p_lose*0.05
      p_win <- p_win - p_draw
      p_lose <- p_lose - p_draw
      random <- runif(1,0,1)
      if (random <= p_win){
        scoreboard[i,2] = scoreboard[i,2] + 2
      } else if (p_win < random & random < p_win+p_draw*2) {
        scoreboard[i,2] = scoreboard[i,2] + 1
        scoreboard[j,2] = scoreboard[j,2] + 1
        } else {
          scoreboard[j,2] = scoreboard[j,2] + 2
          }
      } else {
        p_win <- pnorm(diff, mean= 0.03057852, sd = 1.18235401)
        p_lose <- 1-p_win
        p_draw <- p_lose * 0.05
        p_win <- p_win - p_draw
        p_lose <- p_lose - p_draw
        random <- runif(1,0,1)
        if (random <= p_win){
          scoreboard[j,2] = scoreboard[j,2] + 2
        } else if (p_win < random & random < p_win+p_draw*2) {
          scoreboard[i,2] = scoreboard[i,2] + 1
          scoreboard[j,2] = scoreboard[j,2] + 1
          } else {
            scoreboard[i,2] = scoreboard[i,2] + 2
            }
         }
    }
  }
  
sim_results = c(sim_results, (scoreboard %>% arrange(-Score))[1,1])
}

prob_win_rarita_team = sum(sim_results=="Rarita")/length(sim_results)
fsa_probability = c(fsa_probability, prob_win_rarita_team)
}






################################################################################
################################# ECONOMIC IMPACT ##############################
################################################################################

names(rarita_gdp)[5] = "GDP"
names(rarita_gni)[5] = "GNI"
names(rarita_pop)[5] = "Population"
names(rarita_pop_dens)[5] = "Population Density"
names(rarita_healthc_spend)[5] = "Healthcare Spending"
names(rarita_hhsavrate)[5] = "Household Savings Rate"

rarita_gdp = subset(rarita_gdp, select = c("Year", "GDP"))
rarita_gni = subset(rarita_gni, select = c("Year","GNI"))
rarita_pop = subset(rarita_pop, select = c("Year","Population"))

rarita_pop_dens = subset(rarita_pop_dens, select = c("Year", "Population Density"))
rarita_healthc_spend = subset(rarita_healthc_spend, select = c("Year", "Healthcare Spending"))
rarita_hhsavrate = subset(rarita_hhsavrate, select = c("Year", "Household Savings Rate"))

Rarita_eco_data = merge(rarita_gdp, rarita_gni,by = "Year")
Rarita_eco_data = merge(Rarita_eco_data, rarita_pop,by = "Year")                         
Rarita_eco_data = merge(Rarita_eco_data,  rarita_pop_dens,by = "Year")         
Rarita_eco_data = merge(Rarita_eco_data,  rarita_healthc_spend,by = "Year")   
Rarita_eco_data = merge(Rarita_eco_data,  rarita_hhsavrate,by = "Year")   

Rarita_eco_data


#ECON TESTING
soccer_rev <- read_excel("2022-student-research-case-study-football-soccer-data.xlsx",
                         sheet = 2)

tourn_result_2020_econ <- tourn_result_2020

names(tourn_result_2020_econ)[2] <- "Nation"
total_econ_data_2020 <- Reduce(merge,list(soccer_rev_2020,soccer_exp_2020,soccer_attend,soccer_media,tourn_result_2020_econ))
sapply(total_econ_data_2020, class)
correlated_df <- dplyr::select(total_econ_data_2020, -c("Nation","Tiktok"))
correlation_2020 <- apply(correlated_df, 2, cor, x = total_econ_data_2020$`2020 Tournament Place`)

corrplot.mixed(cor(correlated_df[,-2:-7], use = 'complete.obs'), 
               lower = "circle", 
               upper = "number", 
               tl.pos = "lt", 
               diag = "u")

for (i in c(1:7)) {
  colnames(correlated_df)[i] = substr(colnames(correlated_df)[i], 1, nchar(colnames(correlated_df)[i]) - 3)
}

correlated_df 


#MLR

tourn_2020_place = glm(correlated_df$`Per Capita Total Revenue`~ ., data = correlated_df[,-2:-7], family="gaussian")
coef(tourn_2020_place)
summary(tourn_2020_place)

