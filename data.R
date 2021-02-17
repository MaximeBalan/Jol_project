library(rstatix)
library(dplyr)
library(ggpubr)
getwd()
setwd(dir = "D:/STAGE")

## Import data
data <- read.csv("pre_data.csv")

## Score at each trail sort by participant
qplot(data = data, y = score, x = trial, geom = c("line", "point"),xlim = c(0, 58)) + 
  facet_wrap(~ participant)

## Score mean of each participant
data %>%
  group_by(participant) %>%
  get_summary_stats(score, type = "mean_sd")

## Score with 2*time_trial
qplot(data = data, y = scoret2, x = trial, geom = c("line", "point"),xlim = c(0, 58)) + 
  facet_wrap(~ participant)

data %>%
  group_by(participant) %>%
  get_summary_stats(scoret2, type = "mean_sd")

## Score with 10*time_trial
qplot(data = data, y = scoret3, x = trial, geom = c("line", "point"),xlim = c(0, 58)) + 
  facet_wrap(~ participant)

data %>%
  group_by(participant) %>%
  get_summary_stats(scoret3, type = "mean_sd")
 

