'''
  데이터 전처리 패키지 - 분석전 필요한 부분을 정렬이나 편집하는 작업
  행 추출 - filter(데이터세트, 조건)
'''

install.packages("dplyr")
library(dplyr)
library(ggplot2)

data <- read.csv("data/excel_exam.csv")
data
str(data)


d1 <- filter(data, class == 1) # class 가 1인 행
mean(d1$math)
mean(data$math)

d2 <- filter(data, class != 3) # class가 3이 아닌 행
d2

d3 <- filter(data, math >= 50) # math가 50이상인 행
d3

d4 <- filter(data, class == 2 & english >= 80)  # class가 2, english 80이상상
d4


## %in% - 매칭되는 데이터를 찾을때 사용
d5 <- filter(data, class %in% c(1,3,5))
d5

d6 <- filter(data, math %in% c(30:70))
d6


## 데이터 가공을 순차적으로 실행해주는 파이프라인
# 단축키 ctrl + shift + m
ex1 <- filter(data, class != 1)  # class가 1이 아닌
ex1

ex2 <- filter(ex1, math >= 50)  # 수학점수가 50이상인
ex2

ex3 <- filter(ex2, id %% 2 == 0) # id가 짝수인 
ex3

ex4 <- data %>%
  filter(class != 1) %>%
  filter(math >= 50) %>%
  filter(id %% 2 == 0)
ex4

mean(ex4$science)

## mean은 반환값이 dataframe을 넘기는 함수형태가 아니기에 아래와 같이 사용시 에러 발생생
data %>%
  filter(class != 1) %>%
  filter(math >= 50) %>%
  filter(id %% 2 == 0) %>%
  mean(data$science)

?mean()
class(mean(data$math))


11/ 3 # 실수몫
11 %/% 3 # 정수몫

## --------------------문제
'''
ggplot2에 있는 mpg 데이터를 이용해 분석 문제를 해결해 보세요.

• Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다. displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중
어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 파이프라인을 이용해서 알아보세요.
'''
mpg <- as.data.frame(mpg)
car1 <- mpg %>%
  filter(displ <= 4)
car2 <- mpg %>%
  filter(displ >= 5)

car1
car1_avg <- mean(car1$hwy)
car2
car2_avg <- mean(car2$hwy)

car1_avg <- round(car1_avg,2) # 소수점 자리수
car2_avg <- round(car2_avg,2)

ifelse(car1_avg > car2_avg, "car1","car2")

'''
• Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다. "audi“ 제조년월이 2000년 이상인 데이터의 cty 합계, 평
균을 구하세요
'''

car3 <-  mpg %>%
    filter(manufacturer == "audi") %>%
    filter(year >= 2000)
  sum(car3$cty)  #163
  mean(car3$cty)  # 18.111111
'''
• Q3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 합니다. 이 회사들의 자동차를 추출한 뒤 hwy 전
체 평균을 구해보세요.
'''
car4 <- mpg %>%
  filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(car4$hwy)  #22.50943
