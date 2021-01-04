library(ggplot2)
mpg <- as.data.frame(mpg)

mpg

aaa <- mpg[1:3,1:4]
bbb <- mpg[11:13,1:4]
aaa
bbb

# 컬럼바인드 : 옆으로 합치는 모습
cbind(aaa, bbb)
# 로우바인드 : 세로로 합치는 모습
rbind(aaa, bbb)

# 주의
# cbind()은 행의 개수가 반드시 일치
# rbind()은 열의 개수가 반드시 일치
ccc <- mpg[1:2, 1:5]
ccc

ddd <- mpg[11:12, 1:4]
ddd

rbind(ccc,ddd)  # 에러!


# 열 데이터의 빈도수
table(mpg$model) # model데이터이 빈도수
table(mpg$year)
table(mpg$manufacturer)

#열 데이터를 여러개 넣으면 다차원으로 빈도수 확인
table(mpg$manufacturer, mpg$year)

# hist(빈도수)
hist(table(mpg$year))
hist(table(mpg$manufacturer))
