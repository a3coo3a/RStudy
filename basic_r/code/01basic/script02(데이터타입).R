#자료형

# 숫자형 변수
a <- 1
class(a)

a <- 3.14
class(a)

# 문자형 변수
b <- "1"
class(b)

c <- c(1:10)
class(c)

d <- TRUE
class(d)

# 범주형 변수
e<-factor(c(1,2,3,2,2,2,1,3))
class(e)
levels(e)

f <- factor(c("a","b","c","b"))
f

# 타입 변환 함수 as.numeric(), as.charactor(), as.factor()
class(as.character(a))
as.character(c)

class(as.numeric(b))

as.factor(c)

#as.Date("2020") # 문자열 -> 날짜

# 반드시 날짜 서식형태를 지켜야 합니다.
class(as.Date("2020-01-01"))


# 객체형 데이터 타입
# vector - 한가지 타입으로 만들어진 
c(1,2,3,4,5)
c(1:10)
c(1,2,3,"park","hong")  # 문자형으로 저장됨

#dataframe - 여러타입이 합쳐진 2차원 구조
data.frame(a = c(1,2,3),
           b = c("park","hong","kim"))

data.frame(a = c(1,2,3),
           b = c("park","hong"))  #에러 : 갯수를 통일 시켜야 함함
# 결과 : Error in data.frame(a = c(1, 2, 3), b = c("park", "hong")) : 
#         arguments imply differing number of rows: 3, 2


# 행렬 (metrix) - 한가지 타입으로 만들어진 2차원 구조
matrix(c(1:6), nrow = 3, ncol = 2)  # 3행 2열
matrix(c(1:6), nrow = 2, ncol = 3)  # 2행 3열
matrix(c(1:6), nrow = 3, ncol = 3)  # 3행 3열 : 부족한 공간은 앞에서 데이터 원소를 댕겨와서 채워줌

as.data.frame( matrix(c(1:6), nrow=2, ncol = 3))

# Array - 다차원 구조의 행렬
array(c(1:15), dim = c(3,4,3))   # 3행 4열이 3개

# list - 모든 요소를 담는 다차원 구조
list(a = c(1:5),
     b = data.frame(a = c(1,2,3), b = c("kim","lee","choi")),
     c = matrix(c(1:6), nrow = 3, ncol = 2))
