

# Going from wide to long form for Shereen data. 
require(tidyr)
require(dplyr)
require(reshape2)

getwd()
datawide = read.csv("C:/Users/Faizan/OneDrive/OneDrive/Statistical Cnslt and Tutoring/Shereen/TangData.csv", header = T)
summary(datawide)
str(datawide)
head(datawide)

datawide$id = factor(datawide$id)
str(datawide)

cesdata = select(datawide, 1:11) %>% gather(test, ces_score, 10:11) %>% 
  separate(test,  c("testType", "pre_or_post"), sep = "_") %>% select(-testType)
cesdata

digfwddata = select(datawide, c(1:9, 12, 13)) %>% 
  gather(test, digfwd_score, 10:11) %>% 
  separate(test,  c("testType", "pre_or_post"), sep = "_") %>% 
  select(id, pre_or_post, digfwd_score)


digbwddata = select(datawide, c(1:9, 14, 15)) %>% 
  gather(test, digbwd_score, 10:11) %>% 
  separate(test,  c("testType", "pre_or_post"), sep = "_") %>% 
  select(id, pre_or_post, digbwd_score)


stroopCWdata = select(datawide, c(1:9, 16, 17)) %>% 
  gather(test, stroopCW_score, 10:11) %>% 
  separate(test,  c("testType", "pre_or_post"), sep = "_") %>% 
  select(id, pre_or_post, stroopCW_score)


traildata = select(datawide, c(1:9, 18, 19)) %>% 
  gather(test, trail_score, 10:11) %>% 
  separate(test,  c("testType", "pre_or_post"), sep = "_") %>% 
  select(id, pre_or_post, trail_score)

str(datawide)

datalong = merge(datalong, traildata, by = c("id", "pre_or_post"))





write.csv(tangdata_long, "C:/Users/Faizan/OneDrive/OneDrive/Statistical Cnslt and Tutoring/Shereen/tangdata_long.csv")
