'''
stringr 은 벡터형의 문자열을 다루는 다양한 기능이 들어있습니다.
'''

install.packages("stringr")
library(stringr)

emp <- read.csv("data/emp.csv")
View(emp)
str(emp)

# str_detect(벡터형, 정규식) - 패턴검사
?str_detect()

str_detect( emp$FIRST_NAME, "a" ) # a를 포함하는 
str_detect( emp$FIRST_NAME, "[aA]") # a or A를 포함하는는

str_detect( emp$FIRST_NAME, "^a") # a로 시작하는는
str_detect( emp$FIRST_NAME, "^[aA]") # a or A로 시작하는

str_detect( emp$FIRST_NAME, "a$")  # a로 끝나는 
str_detect( emp$FIRST_NAME, "[aA]$")  # a or A로 끝나는 

# str_count(벡터형, 정규식) - 출현빈도
str_count(emp$JOB_ID, "A") # A의 출현 빈도
str_count(emp$JOB_ID, "PROG")
str_count(emp$JOB_ID, toupper("prog"))

# str_length(벡터)
length(emp$FIRST_NAME) #벡터의 길이

nchar(emp$FIRST_NAME) # 각 원소의 길이
str_length(emp$FIRST_NAME) # 결과가 같음음

# str_c(벡터, 벡터, 옵션) - paste()와 동일 
paste(emp$FIRST_NAME, emp$LAST_NAME, sep="-")  #각 벡터의 연산 구분자
str_c(emp$FIRST_NAME, emp$LAST_NAME,sep = "-")


paste(emp$FIRST_NAME, collapse = ",") # 하나의 벡터데이터를 연결할때는 collapse
str_c(emp$FIRST_NAME, collapse = ",")
        

#str_sub(벡터, 시작, 끝) <- substar()과 ㅗㄷㅇ아

emp$HIRE_DATE
substr(emp$HIRE_DATE, 1, 2)
str_sub(emp$HIRE_DATE, 4, nchaf(emp$shire))

#기본형 함수는 끝값을 반드시 지정해야 하는데 반명에 str_sub는 생략시 끝까지 추출
substr(emp$HIRE_DATE, 4, nchar(emp$HIRE_DATE))
str_sub(emp$HIRE_DATE, 4)

#####매우 중요#########################
# str_replace(백터, 패턴, 치환문자) - 처음 매칭되는 값을 변경
# .과 정규표현식의 표현방식이므로 있는 특수문자 그대로 사용하려면 \\를 붙임
str_replace(emp$PHONE_NUMBER,"\\.",")")


# str_replace_all(벡터, 패턴, 치환문자) - 모든 매칭되는 값을 변경
str_replace_all(emp$PHONE_NUMBER, "\\.", "-")
str_replace_all(emp$PHONE_NUMBER, "\\.","") # 전부 . 제거

# 지환결과를 저장
emp$PHONE_NUMBER <- str_replace_all(emp$PHONE_NUMBER,"\\.","-")
emp

#=================================
#HiRE_DATE의 타입을 확인하고 2020-01-06형식의 날짜형 데이터로 전부 변경

# r에서 날짜형은 반드시 yyyy-mm-dd을 가져야 합니다.

emp$HIRE_DATE <- str_c("20",str_replace_all(emp$HIRE_DATE,"/","-"))
View(emp)
emp$HIRE_DATE <- as.Date(emp$HIRE_DATE)
str(emp$HIRE_DATE)
