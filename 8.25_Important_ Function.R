setwd("c:\\r_work")
getwd()


install.packages("googleVis")
library(googleVis)

#aggregate() : 계산 결과 출력
#데이터 프레임을 상대로 주어진 함수값을 구함
#aggregate(계산될 컬럼~기준될컬럼, 데이터, 함수)


Fruits
aggregate(Sales~Year,Fruits,sum)
aggregate(Sales~Fruit,Fruits,sum)
aggregate(Sales~Fruit,Fruits,max)

#기준컬럼이 두개 일 경우, + 사용
aggregate(Sales~Fruit+Year,Fruits,max)

a1=aggregate(Sales~Fruit+Year,Fruits,max)
plot(a1) #plot() 그래프함수




#apply() :
  #matrix에서 유용
  #행이나 열을 대상으로 작업
  #apply(대상,행/열,적용함수)
  #1 : 행에 대한 matrix
  #2 : 열에 대한 matrix

m1=matrix(c(1,2,3,4,5,6),nrow=2,byrow=T)
m1
apply(m1,1,sum) #각 행끼리 +
apply(m1,2,sum)
apply(m1[,c(2,3)],2,sum) #모든행의 2,3열을 각 열끼리 +
apply(m1[,c(2,3)],2,max) #모든행의 2,3열을 대상으로 각 열의 최댓값




install.packages('googleVis')
library(googleVis)


#lapply(), sapply() : 리스트를 처리

#lapply(대상,적용함수)
Fruits
l1=list(Fruits$Sales)
l1
lapply(l1,min)
l2=list(Fruits$Profit)
l2
lapply(l2,min)

lapply(c(l1,l2),max)  #각 변수에 대한 max값
                      #lapply는 리스트형태로 출력
sapply(c(l1,l2),max)  #sapply는 한 행에 출력

lapply(Fruits[,c(4,5)],max)  #모든 행의 4,5열
sapply(Fruits[,c(4,5)],max)


# * 데이터셋의 특정요소(Factor)를 처리
#tapply(), mapply()

#tapply(출력값,기준컬럼,함수) : 
  #데이터셋의 특정요소(factor)를 처리

Fruits
tapply(Sales,Fruit,sum) #error
#팩터를 사용하기 때문에 바로 컬럼명을 사용할 수 없음

attach(Fruits)  #attach():변수를 직접 사용하기 위한 함수
tapply(Sales,Fruit,sum)
tapply(Sales,Year,sum)  #연도를 기준으로 Sales를 sum


#mapply(함수,벡터1,벡터2....)   : 
  #벡터나 리스트를 데이터프레임처럼 처리
  #바로 적용하기 위해서는 mapply() 사용
 
v1=c(1,2,3,4,5)
v2=c(10,20,30,40,50)
v3=c(100,200,300,400,500)  
mapply(sum,v1,v2,v3)  
#데이터프레임처럼 연산 = 테이블형태로 집어넣음
#각 열의 sum을 구함.




#sweep()
#일괄 적용, 일괄기준으로 차이 구하기 (-)
#1: 열, 2:행  <->apply()
m1
a=c(1,1,1)
sweep(m1,2,a) #m1의 각 행을 a의 요소값으로 빼기.
a=c(1,1)
sweep(m1,1,a)


# * 사용자 정의 함수

# 1) 입력값이 없는 경우
myfunc=function(){
  return(10)
}
myfunc    #함수명을 찍으면 함수형태를 출력
myfunc()  #함수를 호출하면 반환값 출력

# 2) 입력값이 있는 경우
myfunc2=function(a){
  b=a^2
  return(b)
}
myfunc2(2)


myfunc3=function(a,b){
  c=a*b
  return(c)
}
myfunc3(2,3)


#sort() : 데이터 정렬. 오름차순
#decreasing=T 옵션: 내림차순
Fruits
s1=Fruits$Sales
s1
sort(s1)  
sort(s1,decreasing=T)