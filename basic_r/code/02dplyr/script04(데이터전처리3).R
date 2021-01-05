'''
  그룹핑과 요약하기
  summarise (데이터 세트, 요약 컬럼 = 요약 함수)
'''

data <- read.csv("data/excel_exam.csv")

summarise(data, sum_math = sum(math))  # 수학에 대한 합계를 요약정보로 출력

d1 <- summarise(data, sum_math = sum(math),  # 합계
                avg_math = mean(math),  # 평균
                count = n())  # 빈도수
d1

is.data.frame(d1)  # data.frame 입니까?  TRUE
is.list(d1) # list 입니까?  TRUE
is.vector(d1)  # vector 입니까? FALSE

## summarise는 요약정보를 list 형태로 반환합니다.

d2<-group_by(data, class)

summarise(d2, math_sum = sum(math))

# 클래스별 수학, 영어, 과학의 합계를 요약
summarise(d2, math_sum = sum(math),
              eng_sum = sum(english),
              sci_sum = sum(science),
              total = n())

# 클래스별 수학, 영어, 과학의 평균과 중앙값을 요약
summarise(d2, sci_avg = mean(science),
              eng_avg = mean(english),
              math_avg = mean(math),
              sci_medi = median(science),
              eng_medi = median(english),
              math_medi = median(math))

# 파이프 라인으로 한번에 작성
data %>%
  group_by(class) %>%
  summarise(math_sum = sum(math),
            math_avg = mean(math),
            total = n())

# 여러개를 그룹핑 시키려면 group_by() 에 순서대로 적으면 됩니다.

mpg <- as.data.frame(mpg)

table(mpg$manufacturer)
table(mpg$drv)

result <- mpg %>%
  group_by(manufacturer, drv) %>%
  summarise(mean_cty = mean(cty),
            mean_hwy = mean(hwy))

class(result)  # list 형태
#결과가 list 형태이기 때문에 df 값으로 다시 변환
as.data.frame(result)

mpg

# 제조사별, 모델의 개수
result2 <- mpg %>%
  group_by(manufacturer, model) %>%
  summarise(total = n())

as.data.frame(result2)
