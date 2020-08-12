install.packages("dplyr")
library(dplyr)

setwd("c:/r_work")
getwd()




Sys.Date()
Sys.time()
date()
as.Date("2022-08-11")
as.Date("2019/08/11")

#Date()

as.Date("11-08-2019")
as.Date("11-08-2019",format="%d-%m-%Y")
as.Date("11-08-2019",format="%d-%m-%y")
as.Date("2019년 08월 11일", format="%Y년 %m월 %d일")

as.Date(-100,origin="2019-08-11") #origin-100일

"2019-08-11"-"2018-08-11" #error
as.Date("2019-08-11")-as.Date("2018-08-11")
as.Date("2019-08-11")+5




#POSIXlt 와 POSIXct
as.Date("2019-08-11 09:26:00")-as.Date("2019-08-11 07:26:00")
as.POSIXct("2019-08-11 09:26:00")-as.POSIXct("2019-08-11 07:26:00")


install.packages("lubridate")
library(lubridate)
date=now()  #현재 날짜와 시간 불러오기
date
year(date)
month(date, label=F)  #label = 범주
month(date, label=T) 
day(date)
wday(date,label=T)  

date=now()
date=date-days(2) 
date
date=date+years(1)
date
date=hm("22:30")    #시간을 지정.
date=("22:30:05")
date



#날짜를 연속적으로 출력
#seq(시작날짜,종료날짜,증가)

seq(as.Date("2019/01/01"),as.Date("2019/12/31"),1)
seq(as.Date("2019/01/01"),as.Date("2019/12/31"),'month')
seq(as.Date("2019/01/01"),as.Date("2022/12/31"),'year')


#문제1) 2019년 1월 날짜 데이터를 생성
date=seq(as.Date("2019/01/01"),as.Date("2019/01/31"),1)
date=date[5]
date


#문제2)

t0=as.POSIXct("2021/01/01 13:00", tz="Europe/Paris")
t0
t1=t0
tz(t1)="Asia/Seoul"
t1
t2=with_tz(t1,tzone="Europe/Paris")
t2
t3=t2
hour(t3)=hour(t3)+7
t3
t4=with_tz(t3,tzone="Asia/Seoul")
t4

t1==t2
