#R의 데이터 타입
v1="a"
class(v1)
v1=1
class(v1)
v1=Sys.Date()
v1


#변수
v3=v2=v1
v3
v3->v4->v5
v5


comp=c(1,1,2,3)
comp
comp=c(1,2,3,4,"5")  #숫자와 문자가 함께
comp                 #모두 문자로 출력

seq1=1:5
seq1
seq2="a":"f"  #문자는 연속 불가.
seq2


objects()   #현재 변수들
str1="안녕"
objects()
rm(str1)    #remove
objects()


ls()
rm(list=ls()) #변수리스트 remove
ls()



#데이터 처리 객체

#1-2)벡터: 1차원 배열

v1=c(1,2,3,4,5)
v1[3]
v1[-3]          #3번째값 빼기.
v1[1:(length(v1)-2)]
v1[-1:-3]
v1[2:4]


v1[2]=9
v1
v1=c(v1,7)
v1

v1[9]=10  #빈공간에 NA가 채워짐. NOT NULL
v1


#append()
append(v1,11,after=3)   #v1의 3번째뒤에 11을 붙이기
v2=append(v1,11,after=3)
v3=append(v1,c(10,11),after=3)
v3
                                #배열 1부터 시작
v3=append(v1,c(10,11),after=0)  #after=0 : 맨앞.
v3


#벡터간의 산술연산
#1)벡터값이 숫자일 때 +연산: 각 자리수끼리 +

c(1,2,3)+c(4,5,6,7)   #error 자리수가 다르므로
c(1,2,3)+1            #각자리수에 1씩+

v1=c(1,2,3)
v2=c(2,3,4)
v1+v2


#2) 벡터값이 문자 일때 +연산: 문자 이어붙이기.
v2=c(1,2,'3')
v2

v1=c(1,2,3)
v3=c('3','4','5')
v1+v3             #error
union(v1,v3)      #union() : 합집합.
                  #v1이 문자로 변형되고 문자이어붙이기
                  #"1" "2" "3" "4" "5" 출력.


#집합.
v1=c(1,2,3)
v2=c(3,4,5)
union(v1,v2)        #합집합
setdiff(v1,v2)      #차집합. v1-v2
setdiff(v2,v1)      #        v2-v1
intersect(v1,v2)    #교집합.


fruits=c(10,20,30)
fruits
names(fruits)=c("apple","banana","peach")
fruits

#wordcloud 예시
install.packages("wordcloud")     #단어를 구름처럼 보여준다
install.packages("RColorBrewer")  #색상을 나타내는 피키지
library(wordcloud)
library(RColorBrewer)

pal=brewer.pal(8,"Dark2")   #색상개수와 팔레트
x=c("a","b","c")
y=c(5,6,4)
wordcloud(x,y,colors=pal)


#seq(시작,끝,증가)
v1=seq(1,5)
v1
v1=seq(2,10,2)    #2~10 2씩증가
v1
v1=seq(1,9,3)
v1

v1=rep(1:3,each=2) #repeat 1~3 두번씩
v1

#길이
length(v1)
NROW(v1)

# %in%  : 원소를 가지고 있는지 여부.
v2=c(1,3,5,7,9)
v2
3 %in% v2
4 %in% v2


#벡터형 연습문제1
date4=seq(as.Date("2015/01/01"),as.Date("2015/01/31"),1)
date4

#벡터형 연습문제2
vec1=c("사과","배","감","버섯","고구마")
vec1
vec2=vec1[-3]
vec2

#벡터형 연습문제3
vec1=c('봄','여름','가을','겨울')
vec2=c('봄','여름','늦여름','초가을')

union(vec1,vec2)
setdiff(vec1,vec2)
setdiff(vec2,vec1)
intersect(vec1,vec2)




#matrix
#벡터를 여러개 합친 것.


m1=matrix(c(1,2,3,4),nrow=2,byrow=T)
m1
m1[1,1]
m1[2,1]
m1[1,]
m1[,1]

#새로운 행과 열 추가.  
#rbind():행  cbind():열
#부족한 만큼은 data의 앞에서부터 순서대로 채운다

m2=matrix(c(1,2,3,
            4,5,6,
            7,8,9),nrow=3,byrow=T)
m2
m2=rbind(m2,c(11,12,13)) #4행3열
m2
m2=cbind(m2,c(25,26,27)) #4행4열이 비므로 error메세지가 뜨지만 
m2                       #첫번째숫자 25로 채워져서 생성.

#행과 열이름 설정
#rownames():행    colnames():열
#벡터의 길이가 행/열 갯수와 같지 않으면 에러발생

rownames(m2)=c('a','b','c','d')
colnames(m2)=c("First","second","third","fourth")
m2


m1=matrix(1:8,nrow=2,byrow=T)
m1
t(m1)    #행과열이 서로 바뀜.


#matrix를 만드는 다른 방법. cbind로 묶어주기
no=c(1,2,3,4)
name=c('apple','banana','peach','grape')
price=c(50,20,30,40)
qty=c(4,2,6,9)
m1=cbind(no,name,price,qty)
m1
m1[3,3]
m1[m1[,"name"]=='peach','price'] #m1이 가지고 있는 모든 행중에 peach를 가진 행에서 price
m1




#array
#3차원 배열 (가로세로높이)

arr1=array((1:24),c(4,3,2))
arr1

arr1=array(c(1:12),dim=c(2,2,3),T)
arr1
arr1[1,1,3]   #3층의 1행 1열


  x=1:12
y=1:24
dim(x)=c(3,2,2)
x
dim(y)=c(4,3,2)
y




#list
# 서로 다른 데이터 유형 저장 가능.
#벡터와 비슷하지만, (키,값) 형태로 저장


list1=list(name="james",
           addr="서울",
           tel="010",
           pay=500)   
#앞에 3개는 문자, 마지막은 숫자지만 저장 가능.

list1$tel                 # $를 통해 특정 키값을 가져옴
list1$birth="2019-08-11"   #새로운 키값 추가
list1

list1$name=c("kim","lee") #키값 변경. 두개의 키값을 넣음.
list1

list1$birth=NULL  #키와 값을 지움.
list1
