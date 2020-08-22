install.packages('RMySQL') 
library("RMySQL")

# R과 SQL 연결
con <- dbConnect(MySQL(), client.flag=CLIENT_MULTI_RESULTS,
                 user='bitamin',
                 password='bitamin2020',
                 host='bitamin-aws.ctitziqmmxsv.us-east-2.rds.amazonaws.com',
                 port=3306,
                 dbname="iris")


# DB에서 조건에 맞는 데이터 가져오기
# R에서 가장 많이 쓰는 GetQuery와 SendQuery.

# GetQuery: 가져오는 것. 값들을 불러 올 수만 있고, 수정할 수 없다.
 
dbGetQuery(con,"select * from iris_data")
dbGetQuery(con,"select * 
           from iris_data
           where Species = 'virginica\r';")

# SendQuery: 쿼리문을 SQL로 보내겠다.

# '\r'을 ''로 변경하기
dbSendQuery(con,"UPDATE iris_data SET Species = REPLACE(Species, '\r', '');")

data <- dbGetQuery(con,"select * from iris_data")
data
