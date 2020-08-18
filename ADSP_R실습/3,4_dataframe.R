# 3. 입력과 출력
num=4
print(pi,digits=num)  #3.142
cat(format(pi,digits=num),"000")  
options(digits=num)

cat("출력할 내용", num, "\n",append=T)

list.files()
list.files(recursive = T, all.files=T)

#cat("출력할 내용", num, "\n", file="유치원_현황.csv",append=T)
#sink("유치원_현황.csv")
#sink()



# 4. 데이터 구조와 데이터프레임-1
# 1) 벡터
V<-c(10,20,30)
names(V)=c("Moe","Larry","Curly")
V
V["Larry"]

V[c(2,3)]

# 2) 리스트
list1=list(name="juhee",addr="서울",num="1")
list1
list1$addr
list1[["addr"]]
list1[[2]]
list1[c(2,3)]


c(2,3,4,5,5)
factor(c("A","B","C"))
list("Tom","Yoon","Kim")

# 4) 데이터 프레임
b=data.frame(x=1:3,y=c("Tom","Yoon","Kim"))
b
b[1]
b[2]
b["y"]
b[[2]]
b$y


# 5) 그 밖의 데이터 구조들
# 행렬 matrix
a<-1:9
dim(a)<-c(3,3)
a
# 배열 array
b<-1:12
dim(b)<-c(2,3,2)
b



# 6) 벡터다루기
# matrix의 재활용 규칙
a<-seq(1,6)
b<-seq(7,9)
a
b
a+b
cbind(a,b)

# 벡터
append(a,2,after=3)

comb=stack(list(v1=a,v2=b))
comb
comb2=stack(list(v2=b,v1=a))
comb2


# 리스트
list1
list1[sapply(list1,is.null)]=NULL
list1
list1[list1$num==1]=NULL
list1

# 행렬
e=matrix(1:20,4,5)
e
d=matrix(2,4,4)
d
dim(e)
diag(e)
t(e)
solve(e)

e%*%t(e)

vec=e[1,]
vec


# 4. 데이터프레임 -2
new<-data.frame(a=1,b=2,c=3)
new

v1=c(1:5)
v2=c(6:10)
v3=c(11:15)
dfm1=data.frame(v1=v1,v2=v2,v3=v3)
dfm1
dfm2=data.frame(v3=v3,v2=v2,v1=v1)
dfm2

rbind(dfm1,dfm2)
cbind(dfm1,dfm2)

N=10
dtfm=data.frame(dosage=numeric(N))
dtfm

dfm2
dfm2[[2]]
dfm2[2]
dfm2[2,]

merge(dfm1,dfm2,by="v1")
colnames(dfm1)

merge(dfm1,dfm2,by='v1',all=T)

cbind(dfm1,dfm2)


# 2) 자료형 데이터 구조 변환

# https://rfriend.tistory.com/22
dfm1
with(dfm1,v2-v1/v3)
attach(dfm1)
v2-v1
v3-v1
detach(dfm1)
v2-v1

# 3) 데이터 구조 변경
# 데이터 프레임 -> 리스트
as.list(dfm1)

# 리스트 -> 데이터프레임
list1
as.data.frame(list1)  # 목록 원소들이 데이터의 열.

rbind(list1[[1]],list1[[2]]) #데이터의 행행



# 5. 데이터 변형
v=c(24,23,52,46,75,25)
v
f<-factor(c("A","A","B","B","c","A"))
f

groups<-split(v,f)
groups

data.frame(v,f)
groups<-unstack(data.frame(v,f))
groups


library(MASS)
head(Cars93)
Cars93$Origin
sp<-split(Cars93$MPG.city, Cars93$Origin)
sp
median(sp[[1]])
sp[[1]]

v
nchar(v)
length(V)

# 2) 문자열, 날짜 다루기
substr("statistics",1,4)


Sys.Date()
d<-as.Date("2020-08-18")
d

format(Sys.Date(),format="%m/%d/%y")

p<-as.POSIXlt(d)
p
p$yday

start<-as.Date("2020-08-01")
end<-as.Date("2020-08-30")
seq(from=start,to=end,by=1)
