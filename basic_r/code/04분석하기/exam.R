.libPaths()

# 1
data <- read.csv("data/주택도시보증공사_전국 평균 분양가격(2020년 2월).csv")
colnames(data)
data <- rename(data, '지역명' = region,
                     '규모구분' = area,
                     '연도' = year,
                     '월' = month)
colnames(data)[5] <- "price"
colnames(data)[c(1:5)] <- c("region", "area","year","month","price")

table(data$region)
table(data$area)
table(data$year)
table(data$month)
table(data$price)

# 2
table(is.na(data$region))
table(is.na(data$area))
table(is.na(data$year))
table(is.na(data$month))
table(is.na(data$price))

#3.
View(data)

data
data <- data %>%
  filter(area != "전체") %>%
  mutate(area_lv = ifelse(area == "전용면적 60㎡이하","A",
                          ifelse(area == "전용면적 60㎡초과 85㎡이하","B",
                                 ifelse(area == "전용면적 85㎡초과 102㎡이하","C","D")))) 

head(data)


#4.지역별(region) 평당 분양가격(price) 전체 평균을 구하고 막대그래프로 시각화

d1 <- data %>%
  filter( !is.na(price)) %>%
  group_by(region) %>%
  summarise(mean_price = mean(price))

ggplot(d1, aes(x = reorder(region, -mean_price), y = mean_price, fill=region)) +
  geom_col() +
  labs(title = "지역별 전체평균",subtitle = "이인영", x ="지역", y="평당 분양가격")


# 5. 2016, 2017, 2018, 2019년의 연도별,지역별 분양가격평균을 막대그래프로 시각화
table(data$year)
d2 <- data %>%
  filter( !is.na(price)) %>%
  filter(year %in% c(2016:2019)) %>%  # 이상값 제외외
  group_by(year, region) %>%
  summarise(mean_price = mean(price))

ggplot(d2, aes(x = year, y = mean_price, color = region)) + 
  geom_col(position = "dodge") +
  labs(title = "연도별 지역평균", subtitle = "이인영", x= "연도", y="평당분양 가격 평균")

# 6. 2019년 서울지역의 월별 분양가격 평균 변화 추이를 시계열그래프로 시각화
d3 <- data %>%
  filter(year == 2019 & region == "서울") %>%
  filter(!is.na(price)) %>%
  group_by(month) %>%
  summarise(mean_price = mean(price))
  
d3

ggplot(d3, aes(x = month, y=mean_price)) +
  geom_line() +
  labs(title = "2019년 서울지역 월별 평균변화", subtitle = "이인영", x= "월", y="평당분양 가격평균")


#7. 연도별 아파트 평당분양가 변화동향을 시계열그래프로 시각화
install.packages('lubridate')
library('lubridate')
library(stringr)

d4 <- data %>%
  filter(!is.na(price) & region == "서울") %>%
  mutate(date = make_date(year,ifelse(month < 10,str_c('0',month),month),01)) %>%
  group_by(year, date) %>%
  summarise(mean_price = mean(price))

d4

ggplot(d4, aes(x = date, y = mean_price, color = 'red')) +
  geom_line() +
  geom_hline(yintercept = mean(d4$mean_price), color = 'green') +
  labs(title = "연도별 아파트분양가 변화동향", subtitle = "이인영", x= "연도도", y="평당분양 가격평균")


