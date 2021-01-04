# mpg 데이터 cty는 도시연비, hwy는 고속도록 연비를 의미

# Q1, ggplot2 패키지를 mpg 데이터를 사용할 수 있도록 복사복을 만드세요
library(ggplot2)
mpg <- as.data.frame(mpg)

# Q2, 복사본 데이터를 이용해서 cty는 city로 hwy는 highway로 변수명을 수정하세요
colnames(mpg)
colnames(mpg)[8:9] <- c("city","highway")
head(mpg)

# Q3, 복사본 데이터를 이용해서 cty+hwy/2의 total 컬럼을 만드세요
mpg$total <- (mpg$city+mpg$highway)/2
head(mpg)

# Q4, 컬럼 total의 평균을 출력하세요
mean(mpg$total)

# Q5, total에 따른 파생변수 test를 생성 (조건, total >= 20 이상 Pass , 나머지 fail)
mpg$test <- ifelse(mpg$total >= 20, "PASS", "FAIL")
head(mpg)
tail(mpg)
mpg

# Q6, total에 따른 파생변수 grade를 생성 ( 24이상 A, 20이상 B, 나머지 C)
mpg$grade <- ifelse(mpg$total >= 24, "A",
                ifelse(mpg$total >= 20, "B", "C"))
head(mpg)

# Q7, 데이터 일부를 출력해서 변수명이 바뀌었는지 확인해 보세요 결과물이 출력되어야 합니다.
head(mpg)
