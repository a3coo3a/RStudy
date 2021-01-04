# 데이터 추출
library(ggplot2)
mpg <- as.data.frame(mpg)

## 변수명[행, 열]

# 인덱싱을 활용한 데이터 행 추출

# 3행에 해당하는 전부를 추출
mpg[3,]

# 1~6의 연속 행 추출
mpg[1:6,]
head(mpg)

# 2,4,6행 추출
mpg[c(2,4,6),]

# 1~6, 8, 10 행 추출
mpg[c(1:6,8,10),]


# 인덱싱을 활용한 데이터 열 추출
mpg[,3]  # 하나의 열 추출시 백터형으로 추출되어 나옴.
mpg[,7]

# 1~6번째 해당 열만 추출
mpg[,1:6]

# 1~6, 8, 10 열 추출
mpg[,c(1:6,8,10)]

# 이름 으로 열 추출 
mpg[,"model"]

# 2개 이상 열이름으로 추출
mpg[,c("model","class")]


# 인덱싱을 활용한 데이터 행열추출
mpg[1,3]

mpg[1:3,2:3]

mpg[4:6,c("displ","year","trans")]  # 여러개 열 추출시 데이터프레임
mpg[4:6,c(3:4,6)]


## 데이터 프레임에서 컬럼(열)이 1개인 경우 -> 벡터(vector)형 
str(mpg[1:3,"model"])
class(mpg[1:3,"model"])


# =======================================================
# 데이터 프레임에서 특정행에 대한 결과를 보려면 $컬럼명
mpg$manufacturer  #  mpg[,"manufacturer"] 와 같은 의미
mpg$model
mpg$year

# $연산을 이용해서 조건에 충족하는 행 추출
str(mpg)
mpg[mpg$model == "a4",]   # 모델이 a4인 행
mpg[mpg$year >= 2000,]    # 생산년도가 2000년 이후
mpg[mpg$cty >= 20,]       # 도로연비가 20이상인 행
mpg[mpg$cty >= 20 & mpg$hwy >= 30,]  # 도로연비가 20이상, 고속도로연비 30이상

sales <- data.frame(fruit = c("사과","딸기","수박"),
           price = c(1800,1500,3000),
           amount = c(24,38,13))
sales
class(sales)
str(sales)

sum(sales$price)
mean(sales$price)

sum(sales$amount)
mean(sales$amount)


