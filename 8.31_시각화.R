# <시각화>

#plot()
  #분포도나 꺽은선을 그릴 수 있다.

#인수
  #main="메인 제목설정"
  #sub="서브 제목"
  #xlab="",ylab="" : x,y축에 사용할 문자열
  #xlim=c(), ylim=c()  
  #ann=F : x,y축 제목 사용하지 않음
  #axes=F : X,Y축을 표시하지 않음
  #axis : x,y축을 사용자의 지정값으로 표시
  #col : 컬러
  #그래프타입 : p,l,b, c, o, h, s, S, n 등등

v2=c(2,2,2)
plot(v2)

x=1:3   #1부터 3
y=3:1   #3부터 1
plot(x,y) #x와y의 갯수가 같아야함.

a=1:10
b=11:20
plot(a,b)


plot(x,y,xlim=c(1,10),ylim=c(1,5))
plot(x,y,xlim=c(1,10),ylim=c(1,5),xlab="x축값",ylab="y축값")

plot.new()
dev.new()

v1=c(100,130,120,160,150)
plot(v1,type='o',col='red',ylim=c(0,200),axes=F,ann=F)  
axis(1) #x축에 대한 표시선
axis(2) #y축에 대한 표시선
axis(1,at=1:20) #at : 길이
axis(1,at=1:5,lab=c('MON','TUE','WED','THU','FRI'))
axis(2,ylim=c(0,200))

title(main="FRUIT",col.main='red',font.main=4)
title(xlab='DAY',col.lab='black')
title(ylab='PRICE',col.lab='blue')


#par(mfrow=c(nr,nc))
  #그래프의 배치 조정
  #그래프를 행렬 형태로 배치
  #nr은 행의 개수, nc는 열의개수
v1
par(mfrow=c(1,3)) #1행3열. 한행에 3개의 그래프
plot(v1,type='o')
plot(v1,type='s')
plot(v1,type='h')

par(mfrow=c(1,1))
pie(v1)
barplot(v1)


#여백조정
#oma(outside margine) 
  #: 그래프의 전체 여백조정
  #oma(bottom,left,top,right)
#mgp=c(제목위치, 지표값위치, 지표선 위치)

a=c(1,2,3)
plot(a,xlab='x축',ylab='y축')
par(oma=c(2,1,0,0))
par(mgp=c(3,2,2))
plot(a,xlab='x축',ylab='y축')

# * 그래프 겹쳐서 그리기
par(mfrow=c(1,1))  #1행1열

v1=c(1,2,3,4,5)
v2=c(5,4,3,2,1)
v3=c(3,4,5,6,7)
plot(v1,type='s',col='red',ylim=c(1,5))
par(new=T)
plot(v2,type='o',col='blue',ylim=c(1,5))
par(new=T)
plot(v3,type='l',col='green')
#세 그래프의 x,y축의 수치,범위,이름이 달라서 겹쳐짐.

#-> 그래프를 겹쳐서 그릴때에는 lines()사용
v1=c(1,2,3,4,5)
v2=c(5,4,3,2,1)
v3=c(3,4,5,6,7)
plot(v1,type='s',col='red',ylim=c(1,10))
lines(v2,type='o',col='blue',ylim=c(1,5))
lines(v3,type='l',col='green',ylim=c(1,15))

#범례추가
#legend(x축위치,y축위치,내용,cex=글자크기,col=색상,pch=크기,lty=선모양)
legend(4,9,c('v1','v2','v3'),cex=0.9,col=c('red','blue','green'),lty=1)




# * barplot 막대그래프
x=c(1,2,3,4,5)
barplot(x,horiz=T)
  #horiz=T : 그래프가 옆으로.
x=matrix(c(5,4,3,2),2,2)  #2행2열
barplot(x,beside=T,names=c('A','B'),col=c('green','yellow'),horiz=T,xlim=c(0,9))
  #beside=T : 각각 그리기, F:합쳐서 그림



# * 데이터프레임
v1=c(100,120,140,160,180)
v2=c(120,130,150,140,180)
v3=c(140,170,120,110,160)
qty=data.frame(BANANA=v1,CHERRY=v2,ORANGE=v3)
qty
barplot(as.matrix(qty),main="과일판매량",beside=T,col=rainbow(nrow(qty)),ylim=c(0,250))
      #as.matrix(qty) :반드시 벡터 또는 행렬이어야함.
      #rainbow(nrow(qty)) : qty행의 갯수만큼 색가져오기
legend(14,300,c("MON",'TUE','WED','THU','FRI'),cex=0.8,fill=rainbow(nrow(qty)))




#t(qty)
 #전치행렬: 행과열 바꾸기
qty
t(qty)
barplot(t(qty),main="과일판매량",col=rainbow(nrow(qty)),ylim=c(0,600),names.arg=c("MON",'TUE','WED','THU','FRI'))
legend(14,800,names(qty),cex=0.8,fill=rainbow(nrow(qty)))




#문제
#peach값이 200이상일 경우는 'red', 180-199 는 'yello' 그 이하는 green색으로 출력
peach=c(180,200,250,198,170)
colors=c()
for(i in 1:length(peach)){
  if(peach[i]>200){
    colors=c(colors,'red')
  }else if(peach[i]>=180){
    colors=c(colors,'yellow')
  }else{
    clors=c(colors,'green')
  }
}
barplot(peach,main="복숭아판매량",names.arg=c('MON','TUE','WED','THU','FRI'),col=colors)




# *히스토그램 :  hist()
  #특정 데이터의 빈도수를 막대그래프로 나타낸 것

h1=c(182,175,167,172,163,178,181,166,159,155)
hist(h1,main='히스토그램')
par(mfrow=c(1,2),oma=c(2,2,0,0))  #1행2열로 그래프 배치
hist=c(1,1,2,3,3,3)
hist(hist,main='histogram')
plot(hist,main='plot')



# *파이 : pie()
  #퍼센트를 나탈낼때 유용. 전체합이 100이 되어야하는 경우
par(mfrow=c(1,1),oma=c(0.5,0.5,0.1,0.1))

p1=c(10,20,30,40)
pct=p1/sum(p1)*100   #percent
#p1=c(12,23,35,40)일경우 %가 복잡해지므로 round(p1/sum(p1)*100,1)

pie(p1)
pie(p1,radius=1)
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)))
    #radius 반지름
    #init.angle 시작방향

#label
lab1=c('1주','2주','3주','4주')
lab2=paste(lab1,"\n",pct,"%")
pie(p1,label=lab2,radius=1,init.angle=90,col=rainbow(length(p1)))




# *pie3D
  #3차원형태를 그리기 위함
install.packages('plotrix')
library(plotrix)

p1=c(10,20,30,40,50)
day=round(p1/sum(p1)*100,1)
lab1=paste(day,"%")
pie3D(p1,main="3D 파이")
pie3D(p1,main="3D 파이",labels=lab1,col=rainbow(length(p1)),cex=0.5,explode=0.05)
#explode : 3차원은 파이를 쪼갤 수 있음

#1주~4주 와 percent 라벨 함께 나타내기
lab1=c('1주','2주','3주','4주')
lab2=paste(lab1,"\n",day,"%")
pie3D(p1,main="3D 파이",labels=lab2,col=rainbow(length(p1)),cex=0.5,explode=0.05)





# * 상자차트
  #boxplot(최대,최소,중앙값) 
v1=c(10,12,15,11,20)
v2=c(5,7,15,8,9)
v3=c(11,20,15,18,13)
boxplot(v1,v2,v3)
boxplot(v2,v3,v3,col=c('red','blue','yellow'),names=c('RED','BLUE','YELLOW'),horizontal=T)



# * 관계도 그리기 : igraph()
install.packages("igraph")
library(igraph)
g1=graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6),directed=T)
plot(g1)
g1


sawon=c("홍길동사장","일지매부장",'김유신과장','손흥민대리','노홍철대리','이순신부장','유관순과장','신사임당대리','강감찬부장','광개토과장','정몽주대리')
sangsa=c('홍길동사장','홍길동사장','일지매부장','김유신과장','김유신과장','홍길동사장','이순신부장','유관순과장','홍길동사장','강감찬부장','광개토과장')
emp=data.frame(사원=sawon,상사=sangsa)
emp
g=graph.data.frame(emp,directed=F)
dev.new()
plot(g,layout=layout.fruchterman.reingold,vertex.label=NA,edge.size=0.5)

str(g)

  #r_work 에 저장
savePlot(filename="newtork_3.png",type="png")
str(g)




#조금 더 역동적인 형태로 보기

install.packages("devtools")
library(devtools)
install_github("christophergandrud/d3Network")
library(d3Network)
install.packages('RCurl')
library(RCurl)

sawon=c("홍길동사장","일지매부장",'김유신과장','손흥민대리','노홍철대리','이순신부장','유관순과장','신사임당대리','강감찬부장','광개토과장','정몽주대리')
sangsa=c('홍길동사장','홍길동사장','일지매부장','김유신과장','김유신과장','홍길동사장','이순신부장','유관순과장','홍길동사장','강감찬부장','광개토과장')
emp=data.frame(사원=sawon,상사=sangsa)
d3SimpleNetwork(emp,width=800,height =800,file="c:\\r_work\\d3.html")
    #저장할 위치