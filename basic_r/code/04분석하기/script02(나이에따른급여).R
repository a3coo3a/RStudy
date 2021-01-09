# 앞에서 data이름으로 전처리를 마친후에 확인
# 지금은 script01에서 해서 넘어가지만, 원래는 자료 추출후 전처리까지 진행되어야 함


data$birth

# 1. 결측치 확인
table(data$birth)
table(is.na(data$birth))

# 2. birth 컬럼을 이용한 age 파생변수 생성
data$age <- 2021 - data$birth + 1

data$age

# 3. 나이에 따른 월급 평균표


d2 <- data %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))
    

ggplot(d2, aes(x=age, y = mean_income, fill = age)) +
  geom_col() +
  geom_vline(xintercept = 60 ,color = "yellow")


# 연령대에 따른 급여 ####
# 1. age를 이용해서 연령대 파생변수 생성
data <- data %>%
  mutate(ageg = ifelse(age < 30,"young",
                       ifelse(age < 60,"middle","old")))

# 2. 분석처리
d3 <- data %>%
  filter(!is.na(income) & !is.na(ageg)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))

# 3. 시각화
ggplot(d3, aes(x= ageg, y=mean_income, fill = ageg)) +
  geom_col() + 
  labs(title= "연령대별 급여 평균", x = "연령대", y = "급여평균") 
   

# 축 순서 지정
# reorder는 데이터의 정렬순서, scale_x_discrete 축의의 정렬순서
ggplot(d3, aes(x= ageg, y=mean_income, fill = ageg)) +
  geom_col() + 
  labs(title= "연령대별 급여 평균", x = "연령대", y = "급여평균") +  
  scale_x_discrete(limits = c("young","middle","old"))  #x축 순서 

# 실습 ####
# 연령대 및 성별에 따른 급여차이 막대그래프

d4 <- data %>%
    filter(!is.na(income) & !is.na(ageg) & !is.na(gender)) %>%
    group_by(ageg, gender) %>%
    summarise(mean_income = mean(income))

d4

ggplot(d4, aes(x = ageg, y = mean_income, fill = gender)) +
  geom_col(position = "dodge") +
  labs(title= "연령대 및 성별에 따른 급여평균", x = "연령대", y = "급여평균") +
  scale_x_discrete(limits = c("young","middle","old"))
  

  