# 데이터 수정하기
exam <- read.csv("data/excel_exam.csv", stringsAsFactors = F)

str(exam)
exam

head(exam)

## 행 수정하기
exam[1,] <- 100  # 첫행 변경
exam[c(1,3,5),] <- 100  # 1,3,5행 변경

## 열 수정하기
exam[,4] <- 50
exam[,"english"] <- 70

## 데이터 부분 수정하기
exam[10, "math"] <- 1000

## 데이터 열 추가하기
# 열 인덱스 or 열이름을 이용해서 추가
exam[,6] <- "hello"

exam[,ncol(exam)+1] <- "bye"  # 컬럼 개수를 구해서 끝행에 추가, 실행될 때마다 추가된다.

exam[,"xxx"] <- "abc"  #열 이름으로 추가
exam$yyy <- "yyy" # 위와 같은 표현

test <- c(1:5)
test[1]  # 벡터의 인덱싱

# 컬럼명의 수정 - colnames()
# 주의 , 꼭! 인덱스로만 진행해야함
colnames(exam)
colnames(exam)[6] <- "zzz"
colnames(exam)[7] <- "kkk"

#연속적, 전체 컬럼명 수정
colnames(exam)[6:9] <- c("aaa","bbb","ccc","ddd")
colnames(exam) <- c("a","b","c","d","e","f","g","h","i")

# 컬럼 이름을 이용해서 변경은 할 수 없음.
# 기본형식에서 컬럼수정은 반드시 인덱스로 수정정


## ifelse를 이용한 파생변수 생성
exam<- read.csv("data/excel_exam.csv")
exam

exam$total <- exam$math + exam$english + exam$science
exam

exam$avg <- exam$total / 3

ifelse(exam$avg >= 60, TRUE, FALSE)
exam$pass_fail <- ifelse(exam$avg >= 60, "Y", "N")

# level 컬럼명을 추가 평균 40이하는 row, 40~60은 middle, 60이상은 high
exam$level <- ifelse(exam$avg <= 60, "row", ifelse(exam$avg > 80, "high", "middle"))
exam
# 선생님
exam$level <- ifelse(exam$avg >= 80, "high", 
              ifelse(exam$avg >= 60, "middle","row"))
