### We are going to take the graph of both 2018 and 2019 for Freeland's Horizontal and Vertical Movement
### This is very easy because the baseballR package has this stored under 'pfx_x' and 'pfx_z'

x=c(0,0)
y=c(2,-2)
vert.line=data.frame(x,y)
x=c(-2,2)
y=c(0,0)
horz.line=data.frame(x,y)

### Data used from wOBA 
### 2018
ggplot()+geom_point(data=sl18,aes(x=pfx_x,y=pfx_z,color=pitch_type))+
  geom_point(data=ff18,aes(x=pfx_x,y=pfx_z,color=pitch_type))+
  geom_point(data=ft18,aes(x=pfx_x,y=pfx_z,color=pitch_type))+
  geom_point(data=ch18,aes(x=pfx_x,y=pfx_z,color=pitch_type))+
  geom_point(data=cu18,aes(x=pfx_x,y=pfx_z,color=pitch_type))+
  geom_path(data=vert.line,aes(x=x,y=y))+
  geom_path(data=horz.line,aes(x=x,y=y))+labs(color="Pitch",x="Horizontal Movement",
                                              y="Vertical Movement")+
  theme_bw()+scale_color_manual(values=c("green4","skyblue","yellow","orange","purple"))+
  theme(legend.key = element_rect(fill = "white", colour = "black"))+
  theme(legend.title = element_text(face = "bold"))+
  ggtitle("Freeland 2018 Horizontal & Vertical Movement")

### 2019
ggplot()+geom_point(data=sl19,aes(x=pfx_x,y=pfx_z,color=pitch_type))+
  geom_point(data=ff19,aes(x=pfx_x,y=pfx_z,color=pitch_type))+
  geom_point(data=ft19,aes(x=pfx_x,y=pfx_z,color=pitch_type))+
  geom_point(data=ch19,aes(x=pfx_x,y=pfx_z,color=pitch_type))+
  geom_point(data=cu19,aes(x=pfx_x,y=pfx_z,color=pitch_type))+
  geom_path(data=vert.line,aes(x=x,y=y))+
  geom_path(data=horz.line,aes(x=x,y=y))+labs(color="Pitch",x="Horizontal Movement",
                                              y="Vertical Movement")+
  theme_bw()+scale_color_manual(values=c("green4","skyblue","yellow","orange","purple"))+
  theme(legend.key = element_rect(fill = "white", colour = "black"))+
  theme(legend.title = element_text(face = "bold"))+
  ggtitle("Freeland 2019 Horizontal & Vertical Movement")