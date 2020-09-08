setwd("c:\\r_work")
getwd()
install.packages('plyr')
library(plyr)
install.packages('dplyr')
library(dplyr)
install.packages('reshpe2')
library(reshape2)
install.packages('stringr')
library(stringr)
install.packages('sqldf')
library(sqldf)

#if조건문
#단일 조건문
f1=function(x){
  if(x<0){
    return(-x)
  }else{
    return(x)
  }
}               #절댓값 출력하기
f1(34)
f1(-34)

#예제문제
#입력된 숫자가 양수이면 제곱으로 만들어 출력
#숫자가 0보다 작거나 같으면 0으로 만들어 결과 출력

f2=function(x){
  if(x>0){
    return(x=x^2)
  }else{
    return(x=0)
  }
}
f2(2)
f2(-2)

#조건문이 여러개인 경우

f3=function(x){
  if(x>0){
    return(x=x^2)
  }else if(x==0){
    return(x=0)
  }else{
    return(-x)
  }
}
f3(3)
f3(0)
f3(-3)


#ifelse(a,b,c) : a가 참이면 b를 출력. 거짓이면 c를 출력
no=scan()
ifelse(no%%2==0,"짝수","홀수")  # %%:나머지연산자

#문제  
#서로다른 두개의 숫자를 입력받아서 두 숫자 사이에 존재하는 숫자의 갯수를 구하여라
x=scan()
y=scan()
ifelse(x>y,x-y-1,y-x-1)

#배열처리
no=scan()  #10,5
ifelse(no[1]>no[2],no[1]-no[2]-1,no[2]-no[1]-1)




# * 반복문
# 1) while문

#초기값
#while(조건식){
  #실행문
  #증감문
#}

no=0
while(no<5){
  print(no)
  no=no+1
}

x=1
while(x<5){
  x=x+1
  if(x==4)break
  print(x)
}


#반복문 제어
#1) break
#해당 반복문을 아예 종료
#2) next
#현재 위치에서 빠져나와서 반복문의 조건식으로 돌아가기

x=1
while(x<5){
  x=x+1
  if(x==4)next
  print(x)
}

#2) for문
for1=function(x){
  i=0
  for(j in 1:x){   #vector는 범위를 나타내줌
    i=i+j
  }
  print(i)
}
for1(10)
#1~10 까지 +



#여러가지 조건들을 동시에 지정
# !(부정) &&(and)  ||(or)

#문제
my1=function(a,b){
  if(a>1 && b<1){
    return(a*b)
  }else{
    return(a+b)
  }
}
my1(2,3)
my1(-2,3)



