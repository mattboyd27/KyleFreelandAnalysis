
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

# make wOBA value numeric
kyle18$woba_value=as.numeric(kyle18$woba_value)
kyle19$woba_value=as.numeric(kyle19$woba_value)
### Four-Seam 2018
kyle18%>%
  filter(pitch_type=="FF",!is.na(woba_value))%>%
ggplot()+geom_point(aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Four-Seam 2018")

### Two-Seam 2018
kyle18%>%
  filter(pitch_type=="FT",!is.na(woba_value))%>%
ggplot()+geom_point(aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Two-Seam 2018")

### Changeup 2018
kyle18%>%
  filter(pitch_type=="CH",!is.na(woba_value))%>%
ggplot()+geom_point(aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Changeup 2018")


### Curveball 2018
kyle18%>%
  filter(pitch_type=="CU",!is.na(woba_value))%>%
ggplot()+geom_point(aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Curveball 2018")


### Slider 2018
kyle18%>%
  filter(pitch_type=="SL",!is.na(woba_value))%>%
ggplot()+geom_point(aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Slider 2018")


### Four-Seam 2019
kyle19%>%
  filter(pitch_type=="FF",!is.na(woba_value))%>%
ggplot()+geom_point(aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Four-Seam 2019")


### Two-Seam 2019
kyle19%>%
  filter(pitch_type=="FT",!is.na(woba_value))%>%
ggplot()+geom_point(aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Two-Seam 2019")

### Changeup 2019
kyle19%>%
  filter(pitch_type=="CH",!is.na(woba_value))%>%
ggplot()+geom_point(aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Changeup 2019")

### Curveball 2019
kyle19%>%
  filter(pitch_type=="CU",!is.na(woba_value))%>%
ggplot()+geom_point(aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Curveball 2019")

### Slider 2019
kyle19%>%
  filter(pitch_type=="SL",!is.na(woba_value))%>%
ggplot()+geom_point(aes(x=plate_x,y=plate_z,color=woba_value))+
  geom_path(data=sz,aes(x=x,y=y))+
  coord_equal()+geom_path(data=lines.vertical,aes(x=x,y=y))+
  geom_path(data=lines.horz,aes(x=x,y=y))+labs(color="wOBA Value",x="Catcher's View")+
  theme(axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank())+ggtitle("Slider 2019")
