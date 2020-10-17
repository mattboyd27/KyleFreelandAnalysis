### We are going to take the graph of both 2018 and 2019 for Freeland's Horizontal and Vertical Movement
### This is very easy because the baseballR package has this stored under 'pfx_x' and 'pfx_z'

#Libraries
library(ggalt)
#delete 
kyle18=scrape_statcast_savant_pitcher(start_date = "2018-01-06", end_date = "2018-12-15", pitcherid = 607536)
kyle19=scrape_statcast_savant_pitcher(start_date = "2019-01-06", end_date = "2019-12-15", pitcherid = 607536)

#filter data
kyle18=subset(kyle18,!is.na(pfx_x))
kyle18=subset(kyle18, pitch_type!="null")
kyle19=subset(kyle19!is.na(pfx_x))
kyle19=subset(kyle19, pitch_type!="null")

# create line for movement visualization
x=c(0,0)
y=c(2,-2)
vert.line=data.frame(x,y)
x=c(-2,2)
y=c(0,0)
horz.line=data.frame(x,y)

### Data used from wOBA 
### 2018
ggplot(data=kyle18,aes(x=pfx_x,y=pfx_z))+
  geom_encircle(aes(group=pitch_type,fill=pitch_type),alpha=0.2)+
  geom_jitter(aes(col=pitch_type))+
  geom_path(data=vert.line,aes(x=x,y=y))+
  geom_path(data=horz.line,aes(x=x,y=y))+
  theme_bw()+
  theme(legend.key = element_rect(fill = "white", colour = "black"),
        legend.title = element_text(face = "bold"))+
  ggtitle("Freeland Horizontal & Vertical Movement",subtitle="2018 Season")+
  scale_color_manual(values=c("FF"="yellow","CH"="green4",
                              "CU"="skyblue","SL"="purple",
                              "FT"="orange"))+
  scale_fill_manual(values=c("FF"="yellow","CH"="green4",
                             "CU"="skyblue","SL"="purple",
                             "FT"="orange"))+
  labs(color="Pitch",x="Horizontal Movement",
  y="Vertical Movement",fill="Pitch")


### 2019
ggplot(data=kyle19,aes(x=pfx_x,y=pfx_z))+
  geom_encircle(aes(group=pitch_type,fill=pitch_type),alpha=0.2)+
  geom_jitter(aes(col=pitch_type))+
  geom_path(data=vert.line,aes(x=x,y=y))+
  geom_path(data=horz.line,aes(x=x,y=y))+
  theme_bw()+
  theme(legend.key = element_rect(fill = "white", colour = "black"),
        legend.title = element_text(face = "bold"))+
  ggtitle("Freeland Horizontal & Vertical Movement",subtitle="2019 Season")+
  scale_color_manual(values=c("FF"="yellow","CH"="green4",
                              "CU"="skyblue","SL"="purple",
                              "FT"="orange"))+
  scale_fill_manual(values=c("FF"="yellow","CH"="green4",
                             "CU"="skyblue","SL"="purple",
                             "FT"="orange"))+
  labs(color="Pitch",x="Horizontal Movement",
       y="Vertical Movement",fill="Pitch")
