# 외부데이터 불러오기

# 작업 폴더의 확인과 변경
getwd()   # 워킹디렉터리 현재 작업중이 디렉터리
setwd("D:/RStudy/basic_r/data")   # 경로변경 방법

read.table("excel_exam.txt")
# 결과
# Error in file(file, "rt") : 커넥션을 열 수 없습니다
# 추가정보: 경고메시지(들): 
#   In file(file, "rt") :
#   파일 'excel_exam.txt'를 여는데 실패했습니다: No such file or directory
d1 <- read.table("data/excel_exam.txt")  # 제목까지 데이터로 가지고 들어옴.
d1 <- read.table("data/excel_exam.txt", header = T)  # 첫행을 헤더로 인식해서 자동 변경경
class(d1)  # 결과 : data.frame

d1

# 데이터가 tap으로 구분된 파일을 읽을 때 사용
read.delim("data/excel_exam.txt")
d2<-read.delim("data/excel_exam.txt", header = T)
d2

# csv파일을 읽고, 문자 데이터를 읽어 들어올때 컬럼이 factor로 변경되는 문제가 있는데 그것을 제거해주는 옵션(stringsAsFactors = F)
str(read.csv("data/excel_exam.csv"))
d3 <- read.csv("data/excel_exam.csv", stringsAsFactors = F)
d3
class(d3)
str(d3)    # 구조를 알려줌


# 엑셀 파일을 읽기 위해서 패키지 설치
install.packages("readxl")
library(readxl)


# 첫행이 데이터인 경우 col_names = F 로 선언해서 가지고 옵니다
d4 <- read_excel("data/excel_exam.xlsx", col_names = F)
d4 <- as.data.frame(d4)
str(d4)
class(d4)  # 데이터프레임이지만 실제 데이터프레임이 아님. 데이터프레임으로 변경 필요
d4


## =========================================================================================================
# file -> import dataset 선택하고 마우스로 데이터를 import 가능

excel_exam

name <- c("park","kim","lee","choi","hong")
kor <- c(10,20,30,40,50)
eng <- c(23,45,64,34,23)

d5 <- data.frame(name,kor,eng)

# \는 탈출문자로 경로로 사용시 \\ 써야함.
write.csv(d5, file="data/export.csv")   # 빼내는 것 /  작업폴더(getwd()) 기준 상대경로 
write.csv(d5, file="D:/RStudy/basic_r/data/export.csv")   # 빼내는 것 /  절절대경로 
