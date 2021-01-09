'''
Q1
mpg 데이터의 cty(도시 연비) hwy(고속연비)를 이용해서 x 축은 cty, y 축은 hwy 로 된 산점도를 생성하세요.
'''
.libPaths("D:/library")
library(ggplot2)
mpg <- as.data.frame(mpg)

ggplot(mpg, aes(x = cty, y=hwy)) +
  geom_point()

'''
Q2
미국 지역별 인구통계 정보를 담은 ggplot2 패키지의 midwest 데이터를 이용합니다
x 축은 poptotal(전체 인구), y 축은 popasian(아시아인 인구)으로 된 산점도를 만들어 보세요.
전체 인구는 50 만 명 이하, 아시아인 인구는 1 만 명 이하인 지역만 산점도에 표시되게 설정하세요.
'''
midwest <- as.data.frame(midwest)
midwest$poptotal
ggplot(midwest, aes(x = poptotal, y= popasian)) +
  geom_point() +
  xlim(0,500000) +
  ylim(0,10000) +
  labs(x = "전체인구", y = "아시아인구")

'''
Q3
mpg데이터에서 어떤 회사별(manufacturer) suv 차종의 도시 연비(cty)가 높은지 확인하려 합니다.
suv차종(class)을 대상으로 평균 cty(도시 연비)가 가장 높은 회사 다섯 곳을 막대 그래프로 표현해 보세요.
막대는 연비 가 높은 순으로 reorder하세요.
'''
colnames(mpg)

data1 <-mpg %>%
  filter(mpg$class == "suv") %>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>%
  head(5)
str(data1)

data1

ggplot(data1, aes(x = reorder(manufacturer, -mean_cty) , y = mean_cty, fill = manufacturer)) +
  geom_col()

'''
Q4
자동차 중에서 어떤 class(자동차 종류)가 가장 많은지 알아보려고 합니다.
자동차 종류별 빈도를 표현한 막대 그래프를 만들어 보세요.
'''
ggplot(mpg, aes(class)) + 
  geom_bar()

#------------변경
ggplot(mpg, aes(x = class, fill = model)) + 
  geom_bar() +
  coord_polar(theta = "y")

'''
Q5
ggplot2패키지 economics데이터를 이용합니다.
psavert(개인 저축률)가 시간에 따라서 어떻게 변해왔는지 알아보려고 합니다. 시간에 따른 psavert(개인 저축률)의 변화를
나타낸 시계열 그래프를 만들어 보세요.
'''
eco <- as.data.frame(economics)
eco
ggplot(eco, aes(x=date, y=psavert)) + 
  geom_line()

ggplot(eco) + 
  geom_line(aes(x=date, y=psavert))

'''
Q6
mpg데이터를 이용합니다.
class(자동차 종류)가 "compact", "subcompact", "suv"인 자동차의 cty(도시 연비)가 어떻게 다른지 비교해보려고 합니다.
세 차종의 cty를 나타낸 상자 그림을 만들어 보세요.
힌트: 파이프라인 추출
'''
data2 <- mpg %>%
  filter(mpg$class %in% c("compact", "subcompact", "suv")) %>%
  group_by(class)
data2

ggplot(data2, aes(x = class, y = cty, fill = class)) +
  geom_boxplot()
