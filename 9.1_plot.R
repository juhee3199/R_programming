install.packages('plyr')
library(plyr)
install.packages('dplyr')
library(dplyr)
install.packages('reshape2')
library(reshape2)
install.packages('stringr')
library(stringr)
install.packages('sqldf')
library(sqldf)
install.packages('devtools')
library(devtools)
install.packages('christophergandrud/d3Network')
install.packages('RCurl')
library(RCurl)
library(d3Network)

#군집분석 : 데이터를 여러집단으로 나눈 후 특성 및 차이를 분석

setwd('c:\\r_work')
getwd()


# * 1. igraph()
install.packages('igraph')
library(igraph)

g=read.csv("군집분석.csv",head=T)
g1=data.frame(학생=g$학생,교수=g$교수) 
    #data.frame으로 생성
g=graph.data.frame(g1,directed=T)
    #graph.data.frame() : dataframe을 graph로.
    #directed : 화살표.진행방향 여부
plot(g,layout=layout.fruchterman.reingold,vertex.size=2,edge.arrow.size=0.5,vertex.color='green',vertex.label=NA)
  #layout은 fruchterman.reingold을 사용
  #vertex : 꼭짓점
  #edge.arrow : 화살표.

plot(g,layout=layout.kamada.kawai,vertex.size=2,edge.arrow.size=0.5,vertex.color="green",vertex.label=NA)
  #layout 바꾸기

#- 그래프의 vertex속성 변경하기
gubun1=V(g)$name  #V(그래프) : vertex 이름 가져오기
gubun1            #T:교수, S:학생
gubun=str_sub(gubun1,start=1,end=1)
    #첫글자 따오기
    #str_sub() : 특정영역 추출
gubun  #T,S 만 추출됌. 교수,학생 여부

#컬러변경. 학생red 교수green
colors=c()
for(i in 1:length(gubun)){
  if(gubun[i]=='S'){
    colors=c(colors,'red')
  }else{
    colors=c(colors,'green')
  }
}
plot(g,layout=layout.kamada.kawai,vertex.size=2,edge.arrow.size=0.5,vertex.color=colors,vertex.label=NA)

#사이즈변경. 학생2,교수6
sizes=c()
for(i in 1:length(gubun)){
  if(gubun[i]=='S'){
    sizes=c(sizes,2)
  }else{
    sizes=c(sizes,6)
  }
}
plot(g,layout=layout.kamada.kawai,vertex.size=sizes,edge.arrow.size=0,vertex.color=colors,vertex.label=NA)

#모양변경. 학생circle,교수square
shapes=c()
for(i in 1:length(gubun)){
  if(gubun[i]=='S'){
    shapes=c(shapes,'circle')
  }else{
    shapes=c(shapes,'square')
  }
}
plot(g,layout=layout.kamada.kawai,vertex.size=sizes,edge.arrow.size=0,vertex.color=colors,vertex.shape=shapes,vertex.label=NA)

#라벨. 교수만 T
labels=c()
for(i in 1:length(gubun)){
  if(gubun[i]=='S'){
    labels=c(labels,NA)
  }else{
    labels=c(labels,'T')
  }
}
plot(g,layout=layout.kamada.kawai,vertex.size=sizes,edge.arrow.sieze=0,vertex.color=colors,vertex.shape=shapes,vertex.label=labels,vertex.label.color='blue') #vertex.label.color='blue'


#저장하기
#JPEG파일로 저장
path="c:\\r_work\\군집색상.jpg"
jpeg(path)#저장안됌....

#png파일로 저장 
  #띄워서 plot띄우고 plot저장
dev.new()
plot(g,layout=layout.kamada.kawai,vertex.size=sizes,edge.arrow.sieze=0,vertex.color=colors,vertex.shape=shapes,vertex.label=labels,vertex.label.color='blue')
savePlot("군집색상.png",type="png")






# * 2. treemap
  #큰 사각형 안에 면적을 나누어 정보를 담음. 각 값의 크기를 색으로 표현.
install.packages('treemap')
library(treemap)
tot=read.csv('학생시험결과_전체점수.csv',head=T,sep=",")
tot
  #vSize : 기준 (반드시 numeric)
  #index로 나타내기
treemap(tot,vSize="점수",index=c("점수","이름"))
treemap(tot,vSize="점수",index=c("조","이름"))
    #점수를 기준으로 조별로 보여주기
treemap(tot,vSize="성취율",index=c("점수","이름"))


# * 3. stars
  # R의 기본 내장 함수. 다양한 값을 비교할 수 있는 기능을 가지고 있음

tot=read.table("학생별전체성적_new.txt",head=T,sep=",")
  #read.table : 데이터프레임형태로 불러오기
tot

row.names(tot)=tot$이름 
  #각 행의 이름을 tot$이름으로. 
  #실질적인 이름아니고 열이 추가됌. 번호가 아닌 이름으로 불러오기 위해 사용
tot
tot=tot[,2:7] #첫열인 이름빼고 다 가져옴.
tot

stars(tot,flip.labels=FALSE,draw.segments = FALSE,full=TRUE,frame.plot=TRUE,main="학생별 성적분석")
  #flip.labels : FALSE는 동일한 방향에 출력. TRUE 라벨이 겹치지 않도록 함. 
  #draw.segments : TRUE일때 segment그림
  #full : segment일때 원 또는 반원
  #frame.plot : frame여부

stars(tot,flip.labels = FALSE,draw.segments=TRUE,full=TRUE,frame.plot=FALSE,main="학생별 성적분석")

stars(tot,flip.labels = FALSE,draw.segments=TRUE,full=FALSE,main="학생별 성적분석")  #full=FALSE


stars(tot,flip.labels = FALSE,draw.segments = FALSE,frame.plot=TRUE,full=TRUE,main="학생별 성적분석",key.loc=c(2,9))
  #key.loc=() : key를 그릴 좌표지정.

#
lab=names(tot)  #라벨명.각 열이름
lab
value=table(lab)
value  
pie(value,labels(lab,radius=0.1,cex=0.1,col=NA))
  #cex글자크기,col색상



# * 4. radar 차트
  #방사형 모양
  #어느 영역이 점수가 더 높은지를 보여줌
  #ex) 선수들의 경기력.
#- 시나리오 필요
  #1)샘들데이터 만들기
  #2) 최댓값,최솟값 지정
  #3) radar차트 함수 이용

install.packages("fmsb")
library(fmsb)

#1) 샘플데이터 : 어떤 영역을 사용할지 지정. 최대최솟값 지정

layout=data.frame(
  분석력=c(5,1),창의력=c(15,3),
  판단력=c(3,0),리더쉽=c(5,1),
  사교성=c(5,1))
layout

set.seed(123)#난수 생성. 동일한 난수를 생성.

#runif(n,min,max) : uniform(균등)분포에서 랜덤하게 값 추출
#rnorm(n,mean(),sd()) : 정규분포에서 추출

data1=data.frame(
분석력=runif(3,1,5),창의력=rnorm(3,10,2),판단력=c(0.5,NA,3),리더쉽=runif(3,1,5),사교성=c(5,2.5,4))
data2=rbind(layout,data1) #layout 밑으로 data1붙이기
data2

op=par(mar=c(1,0.5,3,1),mfrow=c(2,2))
  #mar: 여백
  #mfrow 차트들을 2행2열로 배치
radarchart(data2,axistype=1,plty=1,title="1st")
radarchart(data2,axistype=2,plty=1,title="2nd",pcol=topo.colors(3))
radarchart(data2,axistype=3,plty=1,title="3rd",axislabcol="grey",na.itp=FALSE)
  #axistype : 표시선 타입.
  #axislabcol : 표시선 라벨 색상
  #plty : 각 선들의 모양 설정
  #na.itp : na값이 있으면 이웃한 값 찍기
radarchart(data2,axistype=0,title="4th",plwd=1:5,pcol=1)
  #plwd : 선의 두께




# * 사용자가 그림을 그림. 
#점대점으로 선을 그리기, 화살표그리기.

plot.new()
plot(1:15)
abline(h=8)
rect(1,6,3,8) #사각형
arrows(1,1,5,5)
text(8,9,"TEXT")
title("THIS IS TEST","SUB")



# * ggplot2
  #ggplot이 plot보다 사용하기 쉬움
  #ggplot 하나씩 붙이면 됌.
  #범례 자동 생성됌.
  #plot은 그린 후에 lines로 추가, legend함수 사용 해야함.

install.packages("ggplot2")
library(ggplot2)

#ggplot(dataframe,aes(x=x축,y=y축데이터))+geom_함수
  #aes(): 점. 점의 모양,색 등
  #geom_함수: 어떤 걸로 찍을지 함수사용. ex)geom_point:점으로 찍음
#geom함수의 설정 값
  #1. stat: 주어진 데이터에서 geom에 필요한 데이터를 생성
  #2. stat_bin: dataframe출력
  #3. count: 각 항목의 빈도수
  #4. density: 각 항목의 밀도수
  #5. ncount: count와 같으나 값의 범위가 (0,1)로 스케일링
  #6. 위 설정값을 지정하지 않으면 기본값은 count

kor=read.table("학생별국어성적_new.txt",head=T,sep=",")
kor
ggplot(kor,aes(x=이름,y=점수))+geom_point()
#geom_point: point로 찍기.
gg=ggplot(kor,aes(x=이름,y=점수))+geom_bar(stat="identity")
  #geom_bar안에는 반드시 stat="identity"
  #stat : x값과 y값이 존재한다.
gg=ggplot(kor,aes(x=이름,y=점수))+geom_bar(stat="identity",fill="green",color="red")
  #fill 막대색, color외곽선색

#theme : ggpot2에서 주로 글자와 관련된 기능 담당
gg=gg+theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1,color="blue",size=10))
  #axis.text.x : x축에 대한 text


#ggplot 심화예제
kem=read.csv("학생별과목별성적_국영수_new.csv",head=T)
kem
library(plyr) #arrange함수 사용을 위해
s_kem=arrange(kem,이름,과목)
s_kem
s_kem2=ddply(s_kem,"이름",transform,누적합계=cumsum(점수)) #cumsum:누적합계
s_kem2
###  #summarise : 동일한 값의 연산수행
  #transform : 각 행별로 연산 수행
s_kem3=ddply(s_kem,"이름",transform,누적합계=cumsum(점수),label=cumsum(점수)-0.5*점수)
s_kem3
  #label=cumsum(점수)-0.5*점 : 점수의 50%가 되는 위치를 잡아주기 위해서

gg=ggplot(s_kem3,aes(x=이름,y=점수,fill=과목))+geom_bar(stat='identity')
gg
gg+geom_text(aes(y=label,label=paste(점수,"점")),color="black",size=2)
  #text설정. 점수와"점"을 복사해서 y에
#그래프와 라벨이 잘못 찍힘. stack의 문제로.
  #stack에서 국어가 먼저들어가서 맨 밑에 있기때문에
#->position=position_stack(reverse=T) 추가.

gg=ggplot(s_kem3,aes(x=이름,y=점수,fill=과목))+geom_bar(stat="identity",position=position_stack(reverse=T))+geom_text(aes(y=label,label=paste(점수,"점")),color="black",size=2)
gg 
#범례순서와 막대순서가 맞지 않음
#->범례 순서 변경.reverse
gg+guides(fill=guide_legend(reverse=T))

# * 6-2. geom_segment() /ggplot2
  #클리블랜드점 그래프로 알려진 데이터를 표현
  #점 (x, y)와 (xend, yend) 사이에 직선을 그린다.
score=read.table("학생별전체성적_new.txt",head=T,sep=",")
score
score[,c("이름","영어")]
gg=ggplot(score,aes(x=영어,y=reorder(이름,영어)))
  #reorder(): 첫 번째 인수를 범주 형 변수로 취급하고, 두 번째 변수(숫자)의 값에 따라 레벨을 재정렬한다.
gg=gg+geom_point(size=4)+theme_bw()+theme(panel.grid.major.x=element_line(color='blue',linetype = 'dashed'),panel.grid.minor.x=element_line(color='blue',linetype='dashed'),panel.grid.major.y=element_line(color='red',linetype='dashed'))
gg
  #theme_bw() : 배경을 화이트로.
    #스타일() : 기존테마의 표시를 조정
  #panel.grid.major.x : x축의 주눈금선 조정
  #panel.grid.minor.x : 보조 눈금선
  #element_line() : 그려지는 방법의 표시를 지정.(dashed=점선)

gg+geom_segment(aes(yend=이름,xend=0,colour='blue'))
  #y~yend=reorder~이름. 빨간 점선이 직선으로 그어짐.
  #x~xend=영어~0 : 선x
  #colour=color


# ggplot2 예제2)
install.packages("gridExtra")
library(gridExtra)
mt=mtcars #미국차량 연비 등의 데이터를 정리
mt
g1=ggplot(mt,aes(x=hp,y=mpg))
g1+geom_point(color='blue')
g1+geom_point(aes(color=factor(am)),size=5)
  #color=factor(am): factor am을 기준으로 색 다르게
g1+geom_point(aes(color=factor(am),size=wt))
  #각 값별로 wt주기
g1+geom_point(aes(color=factor(am),size=wt,shape=factor(am)))
  #모양변화
g1+geom_point(aes(color=factor(am),size=wt,shape=factor(am)))+scale_color_manual(values=c('red','green'))
  #각 값마다 색 다르게

g1+geom_point(aes(color=factor(am),size=wt,shape=factor(am)))+scale_color_manual(values=c('red','green'))+geom_line()
  #geom_line() : 각 값을 선으로 잇기

g1+geom_point(aes(color=factor(am),size=wt,shape=factor(am)))+scale_color_manual(values=c('red','green'))+geom_line()+labs(x="마력",y="연비(mile/gallon)")
  #라벨 지정.


# ggplot2 예제3)
kem=read.csv("학생별과목별성적_3기_3명.csv",head=T)
kem
score=arrange(kem,이름,과목)
score

ggplot(score,aes(x=과목,y=점수,color=이름,group=이름))+geom_line()
ggplot(score,aes(x=과목,y=점수,color=이름,group=이름))+geom_line()+geom_point(size=5,shape=5)




# ggplot2 예제4)
dis=read.csv("1군전염병발병현황_년도별.csv",stringsAsFactors=F)
  #stringsAsFactors=F : factor로 되어있는 것은 가져오지 않기
dis
ggplot(dis,aes(x=년도별,y=장티푸스,group=1))+geom_line()
ggplot(dis,aes(x=년도별,y=장티푸스,group=1))+geom_line()+geom_area(fill='cyan',alpha=0.5)
  #geom_area : x값에 대한 y=0과 ymax의 간격. 
  #alpha 투명도





