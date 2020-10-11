library(baseballr)
library(tidyverse)

### 2018 and 2019 scrape of Baseball Savant to collect all data from both years
kyle18=scrape_statcast_savant_pitcher(start_date = "2018-01-06", end_date = "2018-12-15", pitcherid = 607536)
kyle19=scrape_statcast_savant_pitcher(start_date = "2019-01-06", end_date = "2019-12-15", pitcherid = 607536)

### Remove NAs in release point
kyle18=subset(kyle18,!is.na(release_pos_x)|!is.na(release_pos_z))
kyle19=subset(kyle19,!is.na(release_pos_x)|!is.na(release_pos_z))

### Remove null pitch types
kyle18=subset(kyle18,pitch_type!="null")
kyle19=subset(kyle19,pitch_type!="null")

### Strike zone 
x=c(-0.95,0.95,0.95,-0.95,-0.95)
y=c(1.5,1.5,3.5,3.5,1.5)
sz=data.frame(x,y)

### Home plate for ggplot2
x=c(-.95,-.95,0,.95,.95,-.95)
y=c(0.8,0.5,0.15,0.5,0.8,0.8)
plate=data.frame(x,y)

### Visualize
# 2018
kyle18%>%
  group_by(pitch_type)%>%
  summarize(x=mean(release_pos_x),
            y=mean(release_pos_z))%>%
  ggplot()+geom_point(aes(x=x,y=y,color=pitch_type),size=3)+xlim(-5,5)+ylim(0,7)+
  geom_path(data=sz,aes(x=x,y=y))+geom_path(data=plate,aes(x=x,y=y))+
  scale_color_manual(values=c("green4","skyblue","yellow","purple","orange"))+theme_bw()+
  theme(legend.key = element_rect(fill = "white", colour = "black"))+
  theme(legend.title = element_text(face = "bold"))+
  theme(legend.position = c(0.3, .95),
        legend.justification = c("right", "top"),
        legend.box.just = "right",
        legend.margin = margin(6, 6, 6, 6),axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())+
  ggtitle("Freeland 2018 Release Points")+labs(x="Catcher's View")+labs(color="Pitch Type")
# 2019
kyle19%>%
  group_by(pitch_type)%>%
  summarize(x=mean(release_pos_x),
            y=mean(release_pos_z))%>%
  ggplot()+geom_point(aes(x=x,y=y,color=pitch_type),size=3)+xlim(-5,5)+ylim(0,7)+
  geom_path(data=sz,aes(x=x,y=y))+geom_path(data=plate,aes(x=x,y=y))+
  scale_color_manual(values=c("green4","skyblue","yellow","purple","orange"))+theme_bw()+
  theme(legend.key = element_rect(fill = "white", colour = "black"))+
  theme(legend.title = element_text(face = "bold"))+
  theme(legend.position = c(0.3, .95),
        legend.justification = c("right", "top"),
        legend.box.just = "right",
        legend.margin = margin(6, 6, 6, 6),axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())+
  ggtitle("Freeland 2019 Release Points")+labs(x="Catcher's View")+labs(color="Pitch Type")
