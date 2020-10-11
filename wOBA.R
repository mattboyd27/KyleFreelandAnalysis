library(baseballr)
library(tidyverse)

### 2018 and 2019 scrape of Baseball Savant to collect all data from both years
kyle18=scrape_statcast_savant_pitcher(start_date = "2018-01-06", end_date = "2018-12-15", pitcherid = 607536)
kyle19=scrape_statcast_savant_pitcher(start_date = "2019-01-06", end_date = "2019-12-15", pitcherid = 607536)

### This takes in 2018 data but only the data where NA is not a value in the woba_value column
woba18=subset(kyle18,woba_value!="null")
### Same for 2019
woba19=subset(kyle19,woba_value!="null")

### Make wOBA a numeric value
woba18$woba_value=as.numeric(woba18$woba_value)
woba19$woba_value=as.numeric(woba19$woba_value)

### Now we group each dataset by pitch type in order to analyze the wOBA value for each of his pitches
woba18%>%
  group_by(pitch_type)%>%
  summarize("wOBA Value"=mean(woba_value))%>%
  select("Pitch Type"=pitch_type,"wOBA Value")

woba19%>%
  group_by(pitch_type)%>%
  summarize("wOBA Value"=mean(woba_value))%>%
  select("Pitch Type"=pitch_type,"wOBA Value")
