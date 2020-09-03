setwd("c:\\r_work")
getwd()
list.files()

#파일을 읽어서
#기본적으로 배열형태로 저장됌

#1.파일 불러들이기
#1) scan("파일이름")
  #배열형태로 저장
  #문자, 실수일 경우 주의
  #문자,실수를 반영하기 위해서는 what=""을 사용

s1=scan('scan_1.txt')
s1

s2=scan("scan_2.txt")  #1.00 2.00 등의 실수이지만
s2                     #정수값 출력

#what=""
s2=scan('scan_2.txt',what="") #실수
s2

s3=scan('scan_3.txt',what="") #문자
s3
s4=scan('scan_4.txt',what="") #문자와 실수
s4


#2.사용자로부터 키보드 입력받기

#2-1) scan() 
  #입력시에도 실수와 문자는 what=""사용
  #엔터, 스페이스, 탭 모두 구분자로 받아들임.
input=scan()  #4 3 2 1
input
input=scan()  #a b c  문자입력 불가.
input         #error

#what=""
input=scan(what="")  #a b c d 정상출력
input

input=scan(what="")  #1: a b c 한 줄에 입력
input   #3items로 들어옴. 

#엔터,스페이스 탭 모두 구분자로 받아들이기 때문에
#-> readline() 사용

#2-2) readline() 
  #한 줄 읽어들이기
in2=readline() #서울 강남 압구정
in2
in2=readline("당신의 주소는?")
in2



#1.파일 읽기

#1-2) readLines('파일명')
  # 파일을 읽어 들여서 배열에 담기
  # what옵션 없이도 문자, 실수 읽어들임.
in3=readLines('scan_4.txt')
in3    #배열
in3[2]


#1-3) read.table('파일명')
  #dataframe 형태로 들어옴
  #header 를 꼭 명시  #(텍스트 파일의 컬럼명을 인식하지 못하므로)
  #공백과 주석 자동 제거
  #header, skip, nrows, sep 옵션.

fruits=read.table('fruits.txt')
fruits     #v1,v2...의컬러명이 생김. 텍스트파일의 컬럼명 인식X
fruits1=read.table("fruits.txt",header=T)
fruits1

f2=read.table('fruits_2.txt') 
f2    #공백과 주석 자동 제거됌

#skip=  : 해당 줄까지 skip하고 이후부터 출력
#주석과 공백도 줄수에 포함.
f2=read.table('fruits.txt',skip=3)  #skip이후 부터 출력
f2

f2=read.table('fruits_2.txt',skip=3) #주석과 공백도 줄수에 포함
f2  #주석포함 3번째 줄 인 banana까지 skip      
    #출력 시, 4번째 줄 주석 자동제거로
    #peach부터 출력됌.

#nrows : 특정 행까지 가져오기
#공백,주석 자동제거. 무시.
f2=read.table('fruits_2.txt',nrows=2)
f2   #주석제외하고 2줄(행) 가져오기

#종합
read.table('fruits.txt')
read.table('fruits.txt',header=T)
f3=read.table('fruits.txt',header=T,nrows=2)
f3

read.table('fruits.txt',header=T,skip=2)  #header=T일때 컬럼명이 이상함.
f3=read.table('fruits.txt',header=F,skip=2)
f3   #skip 사용시, header는 F !!




#csv파일
  #각각의 데이터가 구분자로 ,(쉼표)를 이용
  #컬럼명이 없을 경우를 주의!
  #반드시 컬럼명 여부를 명시해주어야 함. header
f3=read.csv('fruits_4.csv',header=F)
f3

#col.names : 라벨명 수동 저장.
label=c("NO","NAME",'PRICE','QTY')
f4=read.csv('fruits_4.csv',header=F,col.names=label)
f4

#csv_test.txt 텍스트파일이지만 csv형태
txt1=read.csv('csv_test.txt')  #warning이 뜨지만 출력가능
txt1
txt2=readLines('csv_test.txt')  #readLines 배열형태로 저장
txt2
txt2[4]

txt3=read.table('csv_test.txt')  #sep와 header를 지정해주지 않아서 이상한 값이 출력됌
txt3
txt3=read.table('csv_test.txt',sep = ',',header=T) #sep 구분자 지정.
txt3




# * 읽어들인 데이터를 저장
#write(작성할 데이터(읽어들일 데이터),'데이터를 저장할 파일')
  #저장할 파일을 생성,수정 가능.

#1) txt 읽어들이고 txt에 저장
txt1=readLines('write_test.txt')        #배열형태로 읽어들이기
txt1
write(txt1,'write_test2.txt')           #write_test2파일을 생성하여 해당 파일에 txt1을 작성
txt2=readLines('write_test2.txt')
txt2


txt1=read.table('table_test.txt',header=T)  #테이블 형태로 읽어들이기
txt1
write.table(txt1,'table_test2.txt')
txt2=read.table('table_test2.txt',header=T)
txt2


#2) csv파일 읽고 csv파일에 저장하기
txt1=read.csv(file='csv_test.csv')
txt1
#write(txt1,file='csv_test2.csv') #입력불가능
write.table(txt1,'csv_test2.csv')
txt2=read.csv('csv_test2.csv')
txt2  #새로운 번호와 . 이 추가됌.


write.csv(txt1,'csv_test3.csv')
txt3=read.csv('csv_test3.csv')
txt3  #새로운 번호가 추가됌.

#정상으로 읽고 출력하는 방법은???