setwd("c:\\r_work")
getwd()

v1=c(1,2,3,4,5)
v2=c('a','b','c','d','e')
max(v1)
max(v2)
#max() 문자의 최댓값도 구해줌.

mean(v1) #mean(): 평균값
mean(v2) #warning

sd(v1)  #표준편차
sum(v1)
var(v1) #분산



#length()
#요소개수, 줄수
#데이터프레임의 경우 컬럼수.
a=c(1,2,3,4,5)
length(a)
Fruits
length(Fruits)  #컬럼수.
length(Fruits$Sales)  #Fruits$Sales 컬럼의 요소개수


#abs() : 절댓값
abs(1)
abs(-1)
v1=c(-1,-2,-4)
abs(v1)


#acos(), atan(), atan2(), beta()
acos(1)
acos(-1)
atan(1)
atan(-1)

#ceiling() : 올림
#해당 수보다 큰 수중에서 가장 작은 수
v3=c(1.2,1.9,2.1)
ceiling(v3)
ceiling(-3.2)      #-2가 아닌 -3

#choose() : 조합 nCr
#nCr = n!/{r!(n-r)!}
choose(5,3) # 5!/2!


#exp() : 지수함수
#factorial()
exp(5)
factorial(5)

#floor() : 버림
#해당 수보다 작은 수중에서 가장 큰 정수
floor(3.2)
trunc(3.2)  

floor(-3.2)  #-4
trunc(-3.2)  #-3 
#trunc() : 0과 해당 수 사이의 가장 큰 정수


log(5)
log2(5)
log10(5)

sqrt(2)
(cos(1)-sqrt(2))/exp(3)



