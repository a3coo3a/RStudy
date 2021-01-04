## 데이터 프레임 함수
library(ggplot2)

mpg <- as.data.frame(mpg)
str(mpg)

## 데이터 프레임 앞부분 확인
# 기본은 6행을 보여주게 되어 있음
head(mpg)
head(mpg, 20)  # 앞에서 부터 20행을 보여줌

## 데이터 프레임 뒷부분 확인
# 기본은 6행을 보여주게 되어 있음
tail(mpg)
tail(mpg,20)  # 뒤에서 부터 20행

## 테이블 구조로 데이터 확인
View(mpg)


## 데이터 프레임의 구조 확인 str(), dim(), nrow(), ncol()
str(mpg) # 구조
dim(mpg) # 234행 11열
nrow(mpg) #234행
ncol(mpg) #11열


#요약 통계 산출 summary()
# 사분위수 - 데이터를 동일하게 사등분 해서 나온 위치
summary(mpg) # 최소값, 1사분위수, 중앙값, 3사분위수, 최대값값

colnames(mpg) # 열이름만 추출

rownames(mpg) # 행이름만 추출

