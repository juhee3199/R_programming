#wordcloud

#워드클라우드 여러가지 사용방법이 존재.
#사용시 영어와 한국어로 하는 방법이 다름

#1. 데이터에서 단어만 추출
#2. 단어 집합생성
#3. 단어 필터링
#4. 단어 핸들링
#5.  txt파일로 저장하고 table로 읽어오면서 공백제거
#6. 단어 빈도수 저장
#7. wordcloud로 출력

#자바로딩 안될때
Sys.setenv(JAVA_HOME='c:\\Program Files\\Java\\jre1.8.0_221')

setwd("c:\\r_work")
getwd()

install.packages("KoNLP")
library(KoNLP)
install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer)

useSejongDic() #명사추출을 위한 사전

#한글파일 깨질 경우: UTF-8 -> ANSI 또는 ANSI->UTF-8
data1=readLines("BTS유엔연설_국문.txt")  #readLines():배열에 담기
data1 #파일 깨짐. ANSI로 변경.
data1=readLines("BTS유엔연설_국문-1.txt")
data1

#1.단어만 추출.
data2=sapply(data1,extractNoun,USE.NAMES=F)
  #extractNoun : 명사추출
data2
# 2.단어 집합생성. 
head(unlist(data2))
  #head() 상위 6개를 추출.
head(unlist(data2),30)
   #30개 추출.
  #unlist():순서없이 추출
data3=unlist(data2)
data3

#워드클라우드의 데이터 가공
#gsub(변경전 글자, 변경후 글자, 원본데이터)

data3=gsub("\\d+","",data3) #\\d+ : 숫자
data3=gsub("것","",data3)
data3=gsub("저","나",data3)
data3=gsub("내","나",data3)
data3=gsub(" ","",data3)
data3=gsub("-","",data3)
data3  #387

# 5. 공백을 없애기 위해 파일로 저장한 후 테이블로 불러들임.
write(unlist(data3),"BTS_국문수정-1.txt")
data4=read.table("BTS_국문수정-1.txt")
data4  

nrow(data4)  #375
wc=table(data4) #빈도수 출력
wc
head(sort(wc,decreasing=T),20)
  #빈도수가 큰 순서대로 상위 20개 정렬 후 추출.

#데이터를 한번 더 가공    #data3 -> data5 에 저장.
data3=gsub("그","",data3)
data3=gsub("한","",data3)
data3=gsub("들","",data3)
data3=gsub("무엇","",data3)

#공백을 없애기 위해 테이블로 불러오기
write(unlist(data3),"BTS_국문수정-1.txt")
data5=read.table("BTS_국문수정-1.txt")
data5
nrow(data5)

wc=table(data5)#빈도수
wc

head(sort(wc,decreasing=T),20)
pal=brewer.pal(9,"Set3")
wordcloud(names(wc),freq=wc,scale=c(5,1),rot.per=0.25,min.freq=1,random.color = T,colors=pal)
  #rot.per : 90도 회전비율
  #min.freq : 최소빈도수
