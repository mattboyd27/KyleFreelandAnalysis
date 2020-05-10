library(baseballr)
library(tidyverse)

### 2018 and 2019 scrape of Baseball Savant to collect all data from both years
kyle18=scrape_statcast_savant_pitcher(start_date = "2018-01-06", end_date = "2018-12-15", pitcherid = 607536)
kyle19=scrape_statcast_savant_pitcher(start_date = "2019-01-06", end_date = "2019-12-15", pitcherid = 607536)

### This takes in 2018 data but only the data where NA is not a value in the woba_value column
woba18=subset(kyle18,!is.na(woba_value))
### Same for 2019
woba19=subset(kyle19,!is.na(woba_value))

### Now we seperate each dataset by pitch type in order to analyze the wOBA value for each of his pitches
woba.ff.18=woba18%>%
  filter(pitch_type=="FF")

woba.ft.18=woba18%>%
  filter(pitch_type=="FT")

woba.ch.18=woba18%>%
  filter(pitch_type=="CH")

woba.cu.18=woba18%>%
  filter(pitch_type=="CU")

woba.sl.18=woba18%>%
  filter(pitch_type=="SL")


### Same for 2019 pitches
woba.ff.19=woba19%>%
  filter(pitch_type=="FF")

woba.ft.19=woba19%>%
  filter(pitch_type=="FT")

woba.ch.19=woba19%>%
  filter(pitch_type=="CH")

woba.cu.19=woba19%>%
  filter(pitch_type=="CU")

woba.sl.19=woba19%>%
  filter(pitch_type=="SL")


### Now we can easily see each mean wOBA for each pitch
mean(woba.ff.18$woba_value)
mean(woba.ft.18$woba_value)
mean(woba.ch.18$woba_value)
mean(woba.cu.18$woba_value)
mean(woba.sl.18$woba_value)

mean(woba.ff.19$woba_value)
mean(woba.ft.19$woba_value)
mean(woba.ch.19$woba_value)
mean(woba.cu.19$woba_value)
mean(woba.sl.19$woba_value)