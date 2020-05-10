library(baseballr)
library(tidyverse)

### 2018 and 2019 scrape of Baseball Savant to collect all data from both years
kyle18=scrape_statcast_savant_pitcher(start_date = "2018-01-06", end_date = "2018-12-15", pitcherid = 607536)
kyle19=scrape_statcast_savant_pitcher(start_date = "2019-01-06", end_date = "2019-12-15", pitcherid = 607536)


### 2018 average release point on x and y cooridnates for each pitch

ch18x=kyle18%>%
  filter(pitch_type=="CH")%>%
  summarize(mean(release_pos_x))

ch18y=kyle18%>%
  filter(pitch_type=="CH")%>%
  summarize(mean(release_pos_z))

cu18x=kyle19%>%
  filter(pitch_type=="CU")%>%
  summarize(mean(release_pos_x))

cu18x=kyle18%>%
  filter(pitch_type=="CU")%>%
  summarize(mean(release_pos_x))

cu18y=kyle18%>%
  filter(pitch_type=="CU")%>%
  summarize(mean(release_pos_z))

ff18y=kyle18%>%
  filter(pitch_type=="FF")%>%
  summarize(mean(release_pos_z))

ff18x=kyle18%>%
  filter(pitch_type=="FF")%>%
  summarize(mean(release_pos_x))

### For some reason there is an NA in one data point of the Two-Seam for release point in the X and Y coordinate so we have to take a 
different route to finding the mean 
what=kyle18%>%
  filter(pitch_type=="FT")%>%
  select(release_pos_x)

hello=what%>%
  drop_na()

ft18x=sum(hello)/419


#Same thing for Two-Seam in the Y coordinates
wait=kyle18%>%
  filter(pitch_type=="FT")%>%
  select(release_pos_z)

hi=wait%>%
  drop_na()

ft18y=sum(hi)/419

sl18y=kyle18%>%
  filter(pitch_type=="SL")%>%
  summarize(mean(release_pos_z))

sl18x=kyle18%>%
  filter(pitch_type=="SL")%>%
  summarize(mean(release_pos_x))




### 2019 average release point on x and y cooridnates for each pitch

ch19x=kyle19%>%
  filter(pitch_type=="CH")%>%
  summarize(mean(release_pos_x))

ch19y=kyle19%>%
  filter(pitch_type=="CH")%>%
  summarize(mean(release_pos_z))

### NA has shown up for 2019 Cutter, so we use the same process as what we did with the Two-Seam Fastball from 2018 
sup=kyle19%>%
  filter(pitch_type=="CU")%>%
  select(release_pos_x)

snow=sup%>%
  drop_na()

cu19x=sum(snow)/108

wassup=kyle19%>%
  filter(pitch_type=="CU")%>%
  select(release_pos_z)

rain=wassup%>%
  drop_na()

cu19y=sum(rain)/108

ff19y=kyle19%>%
  filter(pitch_type=="FF")%>%
  summarize(mean(release_pos_z))

ff19x=kyle19%>%
  filter(pitch_type=="FF")%>%
  summarize(mean(release_pos_x))

ft19x=kyle19%>%
  filter(pitch_type=="FT")%>%
  summarize(mean(release_pos_x))

ft19y=kyle19%>%
  filter(pitch_type=="FT")%>%
  summarize(mean(release_pos_z))

sl19y=kyle19%>%
  filter(pitch_type=="SL")%>%
  summarize(mean(release_pos_z))

sl19x=kyle19%>%
  filter(pitch_type=="SL")%>%
  summarize(mean(release_pos_x))


### Now we combine each pitch to make a data frame
CH18=data.frame(ch18x,ch18y)

CU18=data.frame(cu18x,cu18y)

FF18=data.frame(ff18x,ff18y)

FT18=data.frame(x=ft18x,y=ft18y)

SL18=data.frame(sl18x,sl18y)

### Same for 2019 pitches
CH19=data.frame(ch19x,ch19y)

CU19=data.frame(x=cu19x,y=cu19y)

FF19=data.frame(ff19x,ff19y)

FT19=data.frame(ft19x,ft19y)

SL19=data.frame(sl19x,sl19y)

### Strike zone in ggplot2
x=c(-0.95,0.95,0.95,-0.95,-0.95)
y=c(1.6,1.6,3.5,3.5,1.6)
sz=data.frame(x,y)

### Home plate for ggplot2
x=c(-.95,-.95,0,.95,.95,-.95)
y=c(0.8,0.5,0.15,0.5,0.8,0.8)
plate=data.frame(x,y)


FF18$Pitch="Four-Seam"
FT18$Pitch="Two-Seam"
CH18$Pitch="Changeup"
CU18$Pitch="Cutter"
SL18$Pitch="Slider"

FF19$Pitch="Four-Seam"
FT19$Pitch="Two-Seam"
CH19$Pitch="Changeup"
CU19$Pitch="Cutter"
SL19$Pitch="Slider"


###Kyle Freeland 2018 graph with average release point for each of his 5 pitches
ggplot()+geom_path(data=sz, aes(x=x,y=y))+
  geom_point(data=CH18, aes(x=mean.release_pos_x.,y=mean.release_pos_z.,color=Pitch),size=3)+
  xlim(-5,5)+ylim(0,7)+
  geom_point(data=CU18,aes(x=mean.release_pos_x.,y=mean.release_pos_z.,color=Pitch),size=3)+
  geom_path(data=plate,aes(x=x,y=y))+
  geom_point(data=FT18,aes(x=x,y=y,color=Pitch),size=3)+
  geom_point(data=FF18,aes(x=mean.release_pos_x.,y=mean.release_pos_z.,color=Pitch),size=3)+
  geom_point(data=SL18,aes(x=mean.release_pos_x.,y=mean.release_pos_z.,color=Pitch),size=3)+
  theme_bw()+scale_color_manual(values=c("green4","skyblue","yellow","purple","orange"))+
  theme(legend.key = element_rect(fill = "white", colour = "black"))+
  theme(legend.title = element_text(face = "bold"))+
  theme(legend.position = c(0.3, .95),
        legend.justification = c("right", "top"),
        legend.box.just = "right",
        legend.margin = margin(6, 6, 6, 6))+
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())+
  ggtitle("Freeland 2018 Release Points")+labs(x="Catcher's View")

###2019 release points for all 5 pitches
ggplot()+geom_path(data=sz, aes(x=x,y=y))+
  geom_point(data=FF19,aes(x=mean.release_pos_x.,y=mean.release_pos_z.,color=Pitch),size=3)+
  geom_point(data=FT19,aes(x=mean.release_pos_x.,y=mean.release_pos_z.,color=Pitch),size=3)+
  geom_point(data=CH19, aes(x=mean.release_pos_x.,y=mean.release_pos_z.,color=Pitch),size=3)+
  xlim(-5,5)+ylim(0,7)+
  geom_point(data=CU19,aes(x=x,y=y,color=Pitch),size=3)+
  geom_path(data=plate,aes(x=x,y=y))+
  geom_point(data=SL19,aes(x=mean.release_pos_x.,y=mean.release_pos_z.,color=Pitch),size=3)+
  theme_bw()+scale_color_manual(values=c("green4","skyblue","yellow","purple","orange"))+
  theme(legend.key = element_rect(fill = "white", colour = "black"))+
  theme(legend.title = element_text(face = "bold"))+
  theme(legend.position = c(0.3, .95),
        legend.justification = c("right", "top"),
        legend.box.just = "right",
        legend.margin = margin(6, 6, 6, 6))+
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())+
  ggtitle("Freeland 2019 Release Points")+labs(x="Catcher's View")