# 간단한 함수
# 숫자형 함수 sum(), mean(), max(), min(), median()

x <- c(1:10)

sum(x) # 합계

mean(x) # 평균

max(x)

min(x)

median(x)  # 중간값


c(1:10, 11, 12:20)

# 결측 값이 있으면 함수의 사용이 불가능.
y <- c(1:10, NA, 12:20)
y

sum(y)
# 결과 : NA

# 결측값이 있어도 함수를 사용할 수 있게 도와주는 방법
# 결측값은 제거하고 함수를 사용
sum(y, na.rm = T)
mean(y, na.rm = T)


# 문자형 함수 nchar(), paste()
str1 <- "hello world"
str2 <- "my name is park"
str3 <- c("a","b","c","d","e")

# 문자열의 길이 확인 , 글자수
nchar(str1)
nchar(str2)
nchar(str3)  # 각 원소들의 글자값을 확인

# 문자열 붙이기 함수 paste()
paste(str1,str2)
paste(str1, 10, str2)

paste(str1, str2, sep=", ")
paste(str1, str2, sep="-")

paste(str3, collapse = ",")

# 문자열 자르기 
substr(str1, 1, 2)
substr(str1, 1, 5)
substr(str1, 6, 8)  # 공백포함
substr(str1, 7, nchar(str1))


# 패키지 설치
install.packages("ggplot2")
# 라이브러리 로드
library(ggplot2)

# 설치 경로 변경
.libPaths("C:/Program Files/R/R-4.0.3/library")
.libPaths("D:\\library")
.libPaths()  # 경로확인


x <- c(1,1,1,2,2,3,4,5)
qplot(x)  # 단순 빈도 그래프 : 선형

#패키지에는 연습용 데이터가 존재
data(package = .packages(all.available = TRUE))
mpg
mpg <- as.data.frame(mpg) 
class(mpg)

# qplot() 단순한 데이터 형태를 확인할 때 사용
qplot(data = mpg, x = hwy)  # 자동차 데이터의 고속도로 연비의 빈도 
qplot(data = mpg, x = cty)  # 자동차 데이터의 도시 주행거리 연비의 빈도
qplot(data = mpg, x = drv)  # 자동차 구동 방식의 빈도

qplot(data = mpg, x = drv, y = cty) # 구동방식 별 도심 연비
qplot(data = mpg, x = drv, y = class) # 구동방식 별 자동차 종류

qplot(data = mpg, x = drv, y = cty, geom = "line", color = drv) # 옵션
qplot(data = mpg, x = drv, y = cty, geom = "boxplot", color = drv) 

# 다섯명의 시험점수를 가지고 있는 변수를 생성하고 80,54,75,34,90
# 평균 합계를 새로운 변수에 저장해서 확인

score <- c(80,54,75,34,90)
avg <- mean(score)
avg
total <- sum(score)
total
