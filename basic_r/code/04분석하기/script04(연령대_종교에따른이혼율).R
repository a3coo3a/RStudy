'''
코딩북에서 확인
이혼변수 (marriage)
0.비해당(18세미만)
1. 유배우
2. 사별
3. 이혼
4. 별거
5. 미혼(18세 이상, 미혼모 포함)
6. 기타(사망등)

종교변수(religion)
1. 있음 2. 없음

연령대 (ageg)
'''
data


table(data$marriage) # 결혼 변수 빈도
table(data$religion) # 종교 변수 빈도

# 1. 결혼여부에 따른 파생변수
data$marriage_yn <- ifelse(data$marriage == 1, "marriage",
                           ifelse(data$marriage == 3, "divorce",NA))

# 2. 종교여부에 따른 파생변수
data$religion_yn <- ifelse(data$religion == 1, "yes","no")

data
table(data$marriage_yn)
table(data$religion_yn)

# 3. 종교 여부에 다른 이혼율율
# 그룹변 빈도수 -> 합계 -> 퍼센트
religion_marriage <- data %>%
  filter(!is.na(marriage_yn) & !is.na(religion_yn)) %>%
  group_by(religion_yn, marriage_yn) %>%
  summarise(total = n()) %>%  # 빈도수
  mutate(total_group = sum(total)) %>% # 전체값
  mutate( pct = (total/total_group)*100)

# 4. 위에 표에서 이횬율 추출 후 시각화화
religion_marriage_pct <- religion_marriage %>%
  filter(marriage_yn == "divorce") 

religion_marriage_pct

ggplot(religion_marriage_pct, aes(x = religion_yn, y = pct, fill = religion_yn)) +
  geom_col()

#====================================================
# 연령대, 종교유무에 다른 이혼율
# 그룹핑 -> 연령대, 종교유무, 결혼여부(이혼율)
table(is.na(data$marriage_yn))
table(is.na(data$religion_yn))

ageg_religion_divorce <- data %>%
  filter(ageg != "young") %>%  # 적합하지 않은 자료로 제외처리리
  filter(!is.na(marriage_yn)) %>%
  group_by(ageg, religion_yn, marriage_yn) %>%
  summarise(total = n()) %>%
  mutate(total_group = sum(total)) %>%
  mutate(pct = total / total_group *100)

ageg_religion_divorce

# 위표에서 이혼별 퍼센트 추출
ageg_rel_div_pct <- ageg_religion_divorce %>%
  filter(marriage_yn == "divorce")


# 시각화
ggplot(ageg_rel_div_pct, aes(x = ageg, y = pct, fill = religion_yn)) +
  geom_col(position = "dodge") +
  labs(title = "연령대, 종교에따른 이혼율", x = "연령대", y="%")
