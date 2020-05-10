### We seperate each pitch into gameday zones to determine where Kyle places each pitch and how often
### data from wOBA file
### data only on pitches with a wOBA value (balls in play/walks/strikeouts)

summary(factor(woba.ff.18$zone,ordered = TRUE,levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)))
summary(factor(woba.ft.18$zone,ordered = TRUE,levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)))
summary(factor(woba.ch.18$zone,ordered = TRUE,levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)))
summary(factor(woba.cu.18$zone,ordered = TRUE,levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)))
summary(factor(woba.sl.18$zone,ordered = TRUE,levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)))

summary(factor(woba.ff.19$zone,ordered = TRUE,levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)))
summary(factor(woba.ft.19$zone,ordered = TRUE,levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)))
summary(factor(woba.ch.19$zone,ordered = TRUE,levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)))
summary(factor(woba.cu.19$zone,ordered = TRUE,levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)))
summary(factor(woba.sl.19$zone,ordered = TRUE,levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)))

### We can now visualize each pitch type in the zone with the color being the wOBA value
###Strike zone in ggplot2
x=c(-0.95,0.95,0.95,-0.95,-0.95)
y=c(1.6,1.6,3.5,3.5,1.6)
sz=data.frame(x,y)
x=c(.31666667,.31666667,-.31666667,-.316666667)
y=c(3.5,1.6,1.6,3.5)
lines.vertical=data.frame(x,y)
x=c(-.95,-.95,.95,.95,-.95)
y=c(2.86666667,2.2333333,2.2333333,2.8666667,2.86666667)
lines.horz=data.frame(x,y)

### Four-Seam 2018
ggplot()+geom_point(data=woba.ff.18,aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Four-Seam 2018")

### Two-Seam 2018
ggplot()+geom_point(data=woba.ft.18,aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Two-Seam 2018")

### Changeup 2018
ggplot()+geom_point(data=woba.ch.18,aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Changeup 2018")


### Cutter 2018
ggplot()+geom_point(data=woba.cu.18,aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Cutter 2018")


### Slider 2018
ggplot()+geom_point(data=woba.sl.18,aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Slider 2018")


### Four-Seam 2019
ggplot()+geom_point(data=woba.ff.19,aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Four-Seam 2019")


### Two-Seam 2019
ggplot()+geom_point(data=woba.ft.19,aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Two-Seam 2019")

### Changeup 2019
ggplot()+geom_point(data=woba.ch.19,aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Changeup 2019")

### Cutter 2019
ggplot()+geom_point(data=woba.cu.19,aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Cutter 2019")

### Slider 2019
ggplot()+geom_point(data=woba.sl.19,aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Slider 2019")