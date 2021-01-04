"hello world"
'hello'
1

# 주석 : ctrl + shift + c

# 화살표　단축키　alt　＋　－　


a <- 1
b <- 20
a <- "hello world"
a <- 10
a <- 3.14

# r의 연산자
a + b
a - b
a / b
a * b
a == b
a != b
a > b
a < b

# 컨바인 연속 변수 
# r에서는 여러값으로 구성된 변수 combine()
var1 <- c(1,3,5,7,9)
var1

var2 <- c(1:100)
var2

var3 <- c("a","b","c","d")
var3

# 숫자, 문자를 동시에 저장하면 문자형으로 변경
var4 <- c(1, "2")
var4

# 여러값으로 구성된 변수 seq()
var5 <- seq(1, 10)
var5

var6 <- seq(1, 10, by = 2) #(시작값, 끝값 step값값)
var6

var7 <- seq(2, 10, by = 2) # 2~10까지 2씩 증가
var7


# 연속변수의 연산

# var1에  모든 값에 10을 더한 값이 나온다
var1  + 10 

#각각 같은 위치의 더한 값이 나온다.
var1 + var7 

# 연속변수의 갯수가 다르면 전부 연산한 결과로 처리됩니다.
var1 + var2  

# 문자로 된 변수는 연산 할 수 없습니다.
var3 + 10    
#결과 : Error in var3 + 10 : 이항연산자에 수치가 아닌 인수입니다


# 변수의 삭제 ; remove(변수명)
remove(a)
remove(b)
