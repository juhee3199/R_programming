install.packages("dplyr")

setwd("c:\\r_work")   #작업환경 설정
getwd()               #작업환경 가져오기

print(1+2)     #숫자 연산 가능
print("1+2")   #error 문자
'2'            #print함수 없이도 출력가능
print(pi)      #7자리 float형
print(pi,digits=3)   #digits 3자리만 출력

#cat() 함수
print(3,4)      #error   3
print("a","b")  #error
cat(3,4)        # 3 4
cat("a","b")    # a b

cat(1,":","a",2)  

# ; 를 이용해 각 문자를 new line에 출력
1;2;3;4;5
1+2;2*3;4/2

# 나누기 연산
5/2     
5%/%2
5%%2

# 승수 구하기 ^, **
3^2
3**2

# 지수표현. 
10000
100000
100000000
3e2
3e-2


#강제 형변환
'1'+'2'
as.numeric('1')+as.numeric('2')


#변수. 문자를 따옴표없이 처리할 경우 변수로 처리
'first'
first
first=1
first

#class() : 타입반환
class('1')
class(first)

#& or 연산자
3&0
3|0
0|0
0&0
!0
!!0
!3
2&1
2|1


# NA 와 NULL

NA
NULL

cat(1,NA,2)
cat(1,NULL,2)
sum(1,NA,2)
sum(1,NA,2,na.rm=1)
sum(1,NULL,2)



#스칼라

v1=NULL
v1

#벡터
v2=c(1,2,3,4,NULL)
v2
v3=c(1,2,3,4,NA)
v3

is.na(v3)
is.na(v1)
is.na(v2)

#factor

gender=factor("m",c("m","f"))
gender

v1="a"
factor(v1,c('a','b','c'))

v1=c('남','여','여','남')
factor(v1)

txt1=read.csv("factor_test.txt")
txt1
factor1=factor(txt1$blood)
factor1
summary(factor1)

sex1=factor(txt1$sex)
summary(sex1)

is.factor(v1)
is.factor(sex1)