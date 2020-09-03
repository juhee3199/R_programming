setwd("c:\\r_work")
getwd()

#2-2) 데이터프레임
#데이터프레임 생성방법

#1) 벡터로부터 데이터 프레임 생성
no=c(1,2,3,4)
name=c('apple','peach','banana','grape')
price=c(500,200,100,50)
qty=c(5,2,4,7)
sales=data.frame(NO=no,NAME=name,PRICE=price,QTY=qty)
sales



#2) 행력(매트릭스)로부터 데이터프레임 생성
sales2=matrix(c(1,"apple",500,5,
                2,'peach',200,2,
                3,'banana',100,4,
                4,'grape',50,7),nrow=4,byrow=T)
sales2
#매트릭스는 동일 데이터만을 처리하기때문에 모두 문자 처리됌
#이를 데이터프레임으로 변경
df1=data.frame(sales2)
df1   #임의의 컬럼명이 부여됌.
#->컬럼명 생성
names(df1)=c('NO','NAME','PRICE','QTY')
df1



#데이터 타입 class()
sales         #벡터기반
class(sales)  #data.frame
class(sales$NO)   
class(sales$NAME)
class(sales$PRICE)
class(sales$QTY)
#-> NAME은 factor, 나머지는 numeric

df1              #행렬기반
class(df1)       #data.frame
class(df1$NO)    
class(df1$NAME)
class(df1$PRICE)
class(df1$QTY)
#-> 모두 factor
#매트릭스기반의 dataframe은 보기에는 문자,숫자이지만 
#사실 모두 factor(요소값)이다.
#factor는 산술 연산이 불가능하므로
#-> 데이터형을 변경해주어야한다.

#as.데이터형() : 데이터형 변경
df1$NO=as.numeric(df1$NO)
df1$PRICE=as.numeric(df1$PRICE)
df1$QTY=as.numeric(df1$QTY)
class(df1$NO)


# *데이터프레임에서 원하는 데이터 조회
#배열처럼 조회
sales
sales[1,3]
sales[1,]
sales[3,]
sales[c(1,2),]
sales[,c(1,2)]
sales[,c(1:3)]

df1
df1[1,3]
df1[c(1,2),]

#리스트처럼 조회
sales$NAME
sales$NAME[2]

df1$NAME
df1$NAME[2]


#subset() : 내가 원하는 조건 조회
sales 
subset(sales,qty<5)
subset(sales,price>=200)
subset(sales,name=='apple')

df1
subset(df1,qty<5)
subset(df1,price>=200)
subset(df1,name=='apple')



# *두개의 데이터 프레임 합치기
no=c(1,2,3)
name=c('apple','banana','peach')
price=c(100,200,300)
df1=data.frame(NO=no,NAME=name,PRICE=price)
df1

no=c(10,20,30)
name=c('train','car','ship')
price=c(1000,2000,3000)
df2=data.frame(NO=no,NAME=name,PRICE=price)
df2

#rbind(), cbind(), merge()
df3=cbind(df1,df2) #df1을 기준으로 df2가 옆으로 합쳐짐
df3

df4=rbind(df1,df2)  #컬럼명이 같을 경우, 아래로 쭉 합쳐짐
df4

#rbind() 사용시, 컬럼명이 다를 경우.
#error
df2=data.frame(NO=no,NAME=name,QTY=price)
df2
df4=rbind(df1,df2)
df4
#error가 뜨지만 아래로 합쳐짐


#merge() : 두 데이터프레임 간의 공통적인 부분을 찾아 합치기
#데이터 프레임 생성시, data.frame안에 벡터들을 나열할 수도 있음
df1=data.frame(NAME=c('apple','banana','cherry'),
               PRICE=c(300,200,100))
df1
df2=data.frame(NAME=c('apple','cherry','berry'),
               QTY=c(10,20,30))
df2               
merge(df1,df2) #df1을 기준으로 df2에서 공통적인 것을 찾아서 합쳐짐
merge(df1,df2,all=T) #all=T : 공통적이지 않은 것 까지도 전부 합치기
                     #NA가 출력됌
                    #결측치 NA를 제거해야함

#rbind(), cbind() 예제
df1
new=data.frame(NAME='mango',PRICE=400)
df1=rbind(df1,new)
df1
df1=cbind(df1,data.frame(QTY=c(10,20,30,40,50))) #error
df1=cbind(df1,data.frame(BINGO=c(4,3,2)))  #error
#error. 행의 수가 맞지 않으므로



#subset과 select 예제

no=c(1,2,3,4,5)
name=c('홍길동','이순신','유관순','강감찬','김유신')
addr=c('서울','대전','대구','부산','광주')
tel=c(111,222,333,444,555)
hobby=c('독서','미술','놀기','먹기','자기')
member=data.frame(NO=no,NAME=name,ADDR=addr,TEL=tel,HOBBY=hobby)
member

#subset() 을 이용해 조건을 줄 수 있음
#select=  선택하여 적용
#-> subset조건에서 select를 선택
member2=subset(member,select=c(NO,NAME,TEL))
member2
member3=subset(member,select=-TEL)
member3

colnames(member3)=c('번호','이름','주소','취미') #or names()
member3




#nrow() : 행의 개수
#ncol() : 열의 개수.
#names() : 열이름 출력
#rownames() : 행이름 출력
#colnames() : 열이름 출력  == names

sales
nrow(sales)
ncol(sales)
names(sales)
rownames(sales)
colnames(sales)

sales[c(2,3,1),]#출력순서가 적용됌 2 3 1 
                #2,3,1행의 모든열 가져오기. 

