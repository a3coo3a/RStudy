'''
데이터프레임을 가로로 합치기 left_join(데이터세트, 데이터세트, 키)
연결가능한 동일 키가 존재해야 합니다.
'''
path.package()
.libPaths("D:/library")
library(dplyr)

d1 <- data.frame(class = c(1:5),
           teacher = c("park","hong","choi","lee","kim"))

d2 <- data.frame(teacher = c("park","hong","choi","lee","kim"),
                 subject = c("math","kor","science","english","society"))

d1
d2

left_join(d1, d2, by="teacher") # teacher키로 연결결

## 열이름이 다른경우
# 열이름을 바꾸는 방법1
# colnames(d2)[1] <- "teacher"
d2
# 열이름을 바꾸는 방법2
# rename(데이터세트, 바꿀컬럼명 = 기존 컬럼명)
d2 <- rename(d2, "ttt" = "teacher")
d2

left_join(d1, d2, by = c("teacher"="ttt"))
left_join(d1, d2, by = c("ttt"="teacher")) # 에러// 순서를 맞춰야함. 

# 행개수가 다르더라도 가능
data <- read.csv("data/excel_exam.csv")
data
d1

new_data <- left_join(data, d1, by="class")
new_data


'''
데이터프레임을 세로로 합치기 bind_rows(데이터세트, 데이터세트)
runif(랜덤개수) - 0~1미만 랜덤수 생성성
ceiling() : 올림림
'''

d3 <- data.frame(id= c(1:5), test1 = seq(60,100, by =10 ))
d3

ceiling( runif(15)*10 )  # 올림

d4 <- data.frame(id = c(6:20), test1 = ceiling( runif(15)*10 ))
d4

bind_rows(d3, d4)
