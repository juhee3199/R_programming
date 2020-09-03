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



# * plyr패키지
setwd("c:\\r_work")
getwd()
install.packages('plyr')
library(plyr)

#plyr ()
  #원본 데이터를 분석하기 쉬운 형태로 나눠서 다시 새로운 형태로 만들어주는 패키지
  #apply() 함수를 확장한것.
  #ply() 함수 앞에 데이터 유형 2글자를 적어줌. 
    #(입력될 데이터 유형과 출력될 데이터 유형)
#summarise() : 기준 컬럼의 데이터끼리 모은 후 함수를 적용해서 출력
  #그룹별로 묶음. 엑셀의 그룹합계와 유사
  #plyr 내부함수

fruits=read.csv("fruits_10.csv",header=T)
fruits
ddply(fruits,'name',summarise,sum_qty=sum(qty),sum_price=sum(price))
#ddply() : dataframe으로 입력, dataframe으로 출력. 
#ddply(데이터,그룹지을 변수명,summarise,summarise그룹)\





# * dplyr 패키지
  #R을 사용시 무조건 기본적으로 있어야하는 패키지
  # 5가지 주요함수
  # filter(), select() arrange() mutate8() summarise()
  # 여러 옵션을 조합해서 사용하는 방법 : %>%
install.packages("dplyr")
library(dplyr)

data1=read.csv('2013년_프로야구선수_성적.csv')
data1

#filter() 
  #조건을 주어서 필터링
data2=filter(data1,경기>120)
data2
d3=filter(data1,경기>120&득점>80)
d3
d4=filter(data1,포지션 %in% c("1루수","3루수"))
d4

#select()
  #여러 컬럼이 있는 데이터셋에서 특정 컬럼만 선택해서 사용
select(data1,선수명,포지션,팀)
select(data1,순위:타수)
select(data1,-홈런,-타점,-도루,-안타)

#여러 문장을 조합해서 사용하는 방법 : %>%
data1 %>% select(선수명,팀,경기,타수) %>% filter(타수>400) %>% arrange(desc(타수))
#data1에서 select컬럼 중 타수가 400이상인 선수를 내림차순으로 정렬

#mutate()
  #기존 컬럼을 이용해서 새로운 컬럼을 추가
data1 %>% select(선수명,팀,경기,타수) %>% mutate(경기x타수=경기*타수) %>% arrange(경기x타수)

data1 %>% select(선수명,타수,안타) %>% mutate(안타율=round(안타/타수,3)) %>% arrange(안타율)


#summarise 와 group by
data1 %>% group_by(팀) %>% summarise(average=mean(경기,na.rm=T))
    #각 팀별 경기횟수 평균.
    #na.rm : NA 지움.결측치 제거
data1 %>% group_by(팀) %>% summarise_each(funs(mean),경기,타수)
    #각팀별  경기와 타수의 평균값을 각각 구하기
    #funs함수 내에 개수 출력 n
data1 %>% group_by(팀) %>% summarise_each(funs(mean,n()),경기,타수)
    #경기와 타수의 평균값과 개수 각각 구하기






# * reshape2 패키지
  #옆으로 컬럼이 많은 형태(wide), 긴 형태(long)
  #melt() : wide->long
  #cast() : 이전에 melt()를 통해 long형태가 된 것을 wide 로 변경??
            #dcast()

install.packages("reshape2")
library(reshape2)
fruits=read.csv("fruits_10.csv",header=T)
fruits

melt(fruits,id="year")  #연도를 기준으로 나머지 컬럼들이 long형태로 나열됌
melt(fruits,id=c('year','name'))
mtest=melt(fruits,id=c('year','name'),variable.name='var_name',value.name='val_name')
      #melt()사용으로 생성된 variable과 value의 컬럼명 바꾸기
mtest


#dcast(data,기준컬럼~대상컬럼,적용함수)
  #기준컬럼 == 반드시 melt했던 기준컬럼
dcast(mtest,year~var_name)
    #year를 기준으로 var_name(qty와 price 값)을 wide형태로.
    #기준이었던 name이 없어서 기존과 다른 값이 나옴.
dcast(mtest,year+name~var_name) 
    #year와 name을 기준으로 var_name이었던 qty와 price값을 wide형태로
dcast(mtest,name~var_name,sum)

#apple만 가지고 오고 싶을때 코드??




#stringr: 작업할 대상데이터가 문자열인 경우
  #문자조작

install.packages('stringr')
library(stringr)

#str_detect() : 특정문자가 포함되어있는지 여부
fruits=c('apple','Apple','banana','pineapple')
str_detect(fruits,'A')  #대소문자 구분해야함
str_detect(fruits,'a')
str_detect(fruits,'^a') # ^: 첫글자
str_detect(fruits,'a$') # $: 마지막 글자
str_detect(fruits,'[aA]') #a와A가 포함되어있는지
str_detect(fruits,'^[aA]')

p='a.b'
s=c('abb','a.b')
str_detect(s,p)   #abb에는 .이 없지만  True True
  
#fixed와 coll : 정규식표현 무시.
  #정확하게 일치하는 경우에만 True
str_detect(s,fixed(p)) #False True
str_detect(s,coll(p))  #False True

#ignore_case() : 대소문자 무시.
str_detect(fruits,fixed('a',ignore_case = T))

#str_count() : 해당 문자와 매칭되는 개수       
fruits
str_count(fruits,'a')
str_count(fruits,fixed('A',ignore_case=T))

#str_c() :문자열 합치기
str_c("apple",'pen')
str_c('Fruits :',fruits)
str_c('Fruits ','name is',fruits)
str_c(fruits,collapse=" ") #collpase: 구분자지정
str_c(fruits,collapse="/")

#str_dup() : 복사. 각 요소들을 n번 복사
str_dup(fruits,3) #fruits 각각의 요소들을 3번 복사
length(fruits)  #요소개수
str_length(fruits)  #각 요소의 문자열길이
str_length('apple')

#str_locate()
  #특정문자의 위치값 찾기
  #문자열에서 특정문자가 처음나오는 위치와 마지막 위치
str_locate(fruits,'a')

#replace() : 해당 문자로 대체하기
  #replace(대상,바꾸고자하는 문자,대체될 문자)
str_replace('apple','p','*')   #하나만 바뀜
str_replace_all('apple','p','*')  #전체

#str_split() :지정된 기호로 분리
fruits=str_c('apple','/','orange','/','banana')
fruits
str_split(fruits,'/')

#str_sub() : 지정된 길이만큼 잘라주기
str_sub(fruits,start=1,end=3)
str_sub(fruits,start=6,end=9)
str_sub(fruits,start=-5)

#str_trim() : 앞뒤 공백제거. 중간은 제거되지 않음
str_trim('           apple  banana  berry    ')






install.packages('googleVis')
library(googleVis)

# * sqldf
#sql문법을 알고 있어야만 함.
  # Select 컬럼명 from 테이블명	: 조회
  # update ~			: 삽입
  # delete ~			: 갱신
  # insert into ~		: 제거
      #where 이후 조건

install.packages("sqldf")
library(sqldf)
Fruits
sqldf('select *from Fruits')  # * :'모든' 을 의미
sqldf('select Date,Year from Fruits')

sqldf('select *from Fruits where Fruit="Apples"')

#limit=n : 출력되는 행수 제어
sqldf('select * from Fruits limit 5') #5번째줄까지 출력
sqldf('select * from Fruits limit 3')

#order by : 순서의 기준 결정
sqldf('select * from Fruits order by Year')
sqldf('select * from Fruits order by Year Desc')
      #Desc : 반대로 출력


#집계함수 사용 가능
sqldf('select count(Sales) from Fruits')
sqldf('select avg(Sales) from Fruits')

sqldf('select Fruit, sum(Sales) from Fruits')
    # xxx 각 Fruit이 기준이 아닌...
    # Sales의 전체합계가 출력됌.

#Group by 기준.
sqldf('select Fruit, sum(Sales) from Fruits Group by Fruit')
    #각 Fruit의 sum(Sales) 출력
sqldf('select Fruit, sum(Sales) from Fruits Group by Fruit order by Sales')
    #판매합계를 오름차순 정렬. 판매개수가 적은 것부터.

sqldf('select count(*) from Fruits')
    #요소개수 출력

#단일 쿼리문
sqldf('select Fruit, Sales from Fruits where expenses=78')

#select문이 여러 개인 경우: 쿼리안에 쿼리
sqldf('select *from Fruits where Sales>(select Sales from Fruits where expenses=78)')


#update
  #profit을 갱신.
sqldf(c("update Fruits set Profit=50 where Fruit='Apples' and Year=2008","select *from Fruits"))
sqldf(c("update Fruits set profit=100 where Fruit='Oranges'","select *from Fruits"))

#delete
sqldf(c("delete from Fruits where Fruit='Apples'","select *from Fruits"))
