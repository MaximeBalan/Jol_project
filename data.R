library(rstatix)
library(dplyr)
library(ggpubr)
getwd()
setwd(dir = "D:/STAGE")
data <- read.csv("interface_app.jold_ll_trial.2.csv")
dist <- abs(data$init_dist - data$end_dist)
dist

data <- cbind(data,dist)
data
score <- (data$dist + data$time_trial)
data <- cbind(data,score)
data
??ggqqplot
plot(data$trial,data$score)

ggqqplot(data, x = "score", facet.by = "session")
ggplot(data, aes(x = trial,y=score), facet.by = "session")+
  geom_bar(position="stack", stat="identity")

ggplot()+
  geom_point(data,aes(x=trial, y=score))
?aes
?ggplot
?geom_bar
session1 <- subset(data, session =="jold_ll.1.0")
session2 <- subset(data, session =="jold_ll.2.0")
session3 <- subset(data, session =="jold_ll.5.0")

ggplot(data, aes(fill=trial, y=score, x=session)) + 
  geom_bar(position="dodge", stat="identity")

