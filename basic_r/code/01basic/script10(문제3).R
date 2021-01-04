data(package = .packages(all.available = TRUE))

library(ggplot2)
midwest
?midwest

# Q1, ggplot2의 Midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의 (구조, 끝부분, 뷰창, 차원, 요약)을 파악하세요
str(midwest)
tail(midwest)
View(midwest)
levels(midwest)
class(midwest)
summary(midwest)

# Q2, poptotal(전체인구)을 total로 popasian(아시아인구)을 asian으로 변수명을 수정하세요
colnames(midwest)
colnames(midwest)[5] <- "total" 
colnames(midwest)[10] <- "asian"

# Q3, total.asian 변수를 이용해, '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들고 히스토그램을 만들어 도시들이 어떻게 분포하는 지 살펴 보세요
midwest[,ncol(midwest)+1] <- (midwest$asian/midwest$total) * 100
head(midwest)
View(midwest)
colnames(midwest)[29] <- "asian/total"
hist(midwest$`asian/total`)
hist(table(midwest$`asian/total`))
midwest$`asian/total`

# Q4, 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 그외에는 "small"을 부여하는 파생변수(group)을 만들어 보세요
midwest$group <- ifelse(midwest$`asian/total` > mean(midwest$`asian/total`), "large","small")

# Q5, grpup의 빈도수를 확인하세요
table(midwest$group)
