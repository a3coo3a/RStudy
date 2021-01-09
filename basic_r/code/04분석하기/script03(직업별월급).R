colnames(data)[6] <- "job_code"
colnames(data)

table(data$job_code)

library(readxl)
job_list <- read_excel("data/Koweps_Codebook.xlsx", sheet = 2)
job_list

# left_join (기준데이터, 조인데이터, by = 키)
# data >> job_code  // job_list >> code_job
data <- left_join(data, job_list, by = c("job_code" = "code_job"))
data

# 2. 분석하기
# income and job이 NA가 아닌 데이터를 가지고 처리
d5 <- data %>%
  filter(!is.na(income) & !is.na(job)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income)) %>%
  arrange(desc(mean_income)) %>%
  head(20)

d5
 
ggplot(d5, aes(x = reorder(job, mean_income), y = mean_income, fill = job))+
  geom_col() +
  coord_flip() + # 회전
  labs(title ="직업별급여", x = "직업",y ="급여평균")


