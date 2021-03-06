'''
Q01
회사별로 "suv" 자동차의 도시(cty) 및 고속도로(hwy) 통합 연비 평균을 구해 내림차순으로 정렬하고, 1~10위까지 출력하세요
'''
library(ggplot2)
mpg <- as.data.frame(mpg)
str(mpg)
table(mpg$class)

mpg %>%
  filter(class == "suv") %>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty),
            mean_hwy = mean(hwy)) %>%
  arrange(mean_cty, mean_hwy) %>%
  head(10)
# ----------- 선생님
mpg %>%
  filter(class == "suv") %>%
  mutate(total = (cty+hwy)/2) %>%
  arrange(desc(total)) %>%
  group_by(manufacturer) %>%
  summarise(mean_total = mean(total)) %>%
  head(10)



'''
Q02
mpg데이터의 class는 자동차 특징에 따라 분류된 변수입니다.
class별 cty평균을 구하고 높은 순으로 정렬해 출력하세요.
'''
mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty))
'''
Q03
mpg데이터의 hwy 평균이 가장 높은 제조사 3곳을 출력하세요.
'''
mpg %>%
  group_by(manufacturer) %>%
  summarise(hwy_avg = mean(hwy)) %>%
  arrange(desc(hwy_avg)) %>%
  head(3)
'''
Q04
어떤 회사가 compact(경차) 를 많이 생산하는지 확인하려 합니다.
class가 compact(경차) 인 제조사별 차종 수를 내림차순 정렬해 출력하세요
힌트: class가 compact인 행 데이터를 먼저 추출
'''
mpg %>%
  filter(class == "compact") %>%
  group_by(manufacturer, model) %>%
  summarise(ma_count = n())
#-------------- 선생님
mpg %>%
  filter(class == "compact") %>%
  group_by(manufacturer) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

'''
mpg데이터의 if변수는 자동차 연료입니다.
아래 같은 표를 생성하세요.
'''
data <- data.frame(fl = c("c","d","e","p","r"),
           kind = c("CNG","diesel","ethanol","premium","regular"),
           price = c(2.35,2.38,2.11,2.76,2.22))

'''
Q1
위 표를 mpg데이터에 left_join하고, 새로운 데이터를 만들어 냅니다.
그 이후에 파이프라인을 사용해서
model, fl, kind, price 데이터만 추출한 후에 앞부분 10행만 출력하세요
'''
new_data <- left_join(mpg, data, by = "fl")

new_data %>%
  select(model, fl, kind, price) %>%
  head(10)


'''
ggplot2에 존재하는 midwest데이터를 사용합니다 (미국 주 437개 지역의 인구 통계를 담고 있는 데이터 입니다)
Q1
midwest데이터를 데이터프레임으로 가져오고 구조를 확인하세요
'''
remove(midwest)
midwest <- as.data.frame(midwest)
str(midwest)

'''
Q2
popadults 는 해당 지역의 성인 인구, poptotal 은 전체 인구를 나타냅니다. midwest 데이터에
전체 인구 대비 성년 인구 백분율(adult_of_percent)
전체 인구 대비 미성년 인구 백분율(young_of_percent) 변수를 추가하세요.
전체 인구 대비 성년 인구 백분율공식 = (성인인구/전체인구) * 100
'''
midwest <- midwest %>%
mutate(adult_of_percent = popadults/poptotal * 100,
       young_of_percent = (poptotal-popadults)/poptotal * 100)
midwest

'''
Q3
아래 등급표에 따라 grade변수를 추가하고, 미성년인구 백분율이 가장 높은 상위 5개
county(지역), 미성년백분율, grade를 출력하세요.
'''
midwest <- mutate(midwest, grade = ifelse(young_of_percent >= 45,"large","small"))
midwest %>%
    arrange(desc(young_of_percent)) %>%
    select(county, young_of_percent, grade) %>%
    head(5)
midwest
View(midwest)
'''
Q4
popasian은 해당 지역의 아시아인 인구를 나타냅니다. ''전체 인구 대비 아시아인 인구 백분율'' 변수를 추가하고,
하위 10개 지역의 state(주), county(지역명), 아시아인 인구 백분율을 출력하세요.
'''
midwest <- mutate(midwest, asian_of_percent = popasian/poptotal * 100)
midwest %>%
  arrange(asian_of_percent) %>%
  select(state, county, asian_of_percent) %>%
  head(10)

'''
Q5
popasian은 해당 지역의 아시아인 인구입니다.
전체 인구 대비 아시아인 인구 백분율변수를 추가하고, 하위 10개 지역의 state(주), county(지역명), 아시아인 인구 백분율
을 출력하세요.
'''
