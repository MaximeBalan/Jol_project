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
mean_score <- data %>%
  group_by(participant) %>%
  get_summary_stats(score, type = "mean_sd")

bar_plot1 <- ggplot(data=mean_score, aes(x=participant, y=mean)) +
  geom_bar(stat="identity")+
  geom_text(aes(label=mean), vjust=-0.3, size=3.5)+
  theme_minimal()

barplot(mean_score$mean, names.arg=mean_score$participant)

## Score with 2*time_trial
qplot(data = data, y = scoret2, x = trial, geom = c("line", "point"),xlim = c(0, 58)) + 
  facet_wrap(~ participant)

mean_scoret2 <- data %>%
  group_by(participant) %>%
  get_summary_stats(scoret2, type = "mean_sd")

bar_plot2 <-ggplot(data=mean_scoret2, aes(x=participant, y=mean)) +
  geom_bar(stat="identity")+
  geom_text(aes(label=mean), vjust=-0.3, size=3.5)+
  theme_minimal()

## Score with 10*time_trial
qplot(data = data, y = scoret3, x = trial, geom = c("line", "point"),xlim = c(0, 58)) + 
  facet_wrap(~ participant)

mean_scoret3 <- data %>%
  group_by(participant) %>%
  get_summary_stats(scoret3, type = "mean_sd")

bar_plot3 <-ggplot(data=mean_scoret3, aes(x=participant, y=mean)) +
  geom_bar(stat="identity")+
  geom_text(aes(label=mean), vjust=-0.3, size=3.5)+
  theme_minimal()

require(gridExtra)
grid.arrange(bar_plot1, bar_plot2,bar_plot3, ncol=3)

