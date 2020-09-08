# <특정패턴만 골라내기>

#grep(pattern,a)
#벡터a에서 특정패턴을 찾아 그 위치 출력

char1=c('apple','Apple','APPLE','banana','grape')
grep('a',char1)
grep('A',char1)
grep('e$',char1)

#value=T : 값을 가져옴 (위치가 아닌)
grep('^A',char1,value=T)
grep('e$',char1,value=T)

#벡터char2에서 char1 찾기
char2=c('apple','banana')
grep(char2,char1) #error. 

paste(char2,collapse = '|')
#paste():char2복사 구분자 or로 나누기
grep(paste(char2,collapse='|'),char1)
#char1에서 apple 또는 banana 찾기

grep(paste(char2,collapse='|'),char1,value=T)

char2=c('grape1','apple1','apple','orange','Apple')
grep('[1-9]',char2,value=T)
grep('[[:upper:]]',char2,value=T)



# * nchar() : 입력된 배열이나 문자열의 길이
char1
nchar(char1)  #각 문자열의 길이
nchar('hong gil dong')

#paste('a','b','c')
#a와 b와 c를 합쳐서 하나의 문자열로 출력
paste('hong','gil','dong')
paste('hong','gil','dong',sep='')
paste('hong','gil','dong',sep='/')
paste('i\'m','hungry')  #\'


#substr('a',시작위치,끝나는 위치)
#특정부분만 골라내기
substr('abc123',2,4)

#strsplit('문자열',split='기준문자')
strsplit('2014/11/22',split='/')

#regexpr('pattern',text)
#특정패턴을 쉽게 찾기
grep('-','010-1111-2222') #위치를 잘 찾지 못함
regexpr('-','010-1111-2222')
#처음 나오는 위치
#길이
#타입
#바이트까지 출력
