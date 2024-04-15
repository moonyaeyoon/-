
library(svDialogs)
library(xlsx)

#정보를 찾아 파일로 출력하기//한국여행중 서울지역 방문지 통계
koreaVisit.new <- read.csv('visitSeoul.csv', header = T)
str(koreaVisit.new)

input.sort <- dlgInput('Input Sort')$res
input.2022 <- dlgInput('Input X2022')$res

input.2022 <- as.numeric(input.2022)

result <- subset(koreaVisit.new, Sort == input.sort &
                   X2022 >= input.2022)
print(result)
sink('search.txt', append = T)
print(result)
sink()

write.xlsx(result, 'search.xlsx', row.names = F)

#정보를 찾아 파일로 출력하기//한국여행중 서울지역 방문지 통계
koreaVisit.new <- read.csv('visitSeoul.csv', header = T)
# Sort에 따라 데이터프레임을 분리
# Sort에 따라 데이터프레임을 분리
subCount <- subset(koreaVisit.new, Sort == "subCount")
sex <- subset(koreaVisit.new, Sort == "sex")
age <- subset(koreaVisit.new, Sort == "age")
purpose <- subset(koreaVisit.new, Sort == "purpose")
count <- subset(koreaVisit.new, Sort == "count")

# 각각의 분리된 데이터프레임을 CSV 파일로 저장
write.csv(subCount, file = "subCount.csv", row.names = FALSE)
write.csv(sex, file = "sex.csv", row.names = FALSE)
write.csv(age, file = "age.csv", row.names = FALSE)
write.csv(purpose, file = "purpose.csv", row.names = FALSE)
write.csv(count, file = "count.csv", row.names = FALSE)

# 각각의 분리된 데이터프레임을 CSV 파일로 저장
write.csv(subCount, file = "subCount.csv", row.names = FALSE)
write.csv(sex, file = "sex.csv", row.names = FALSE)
write.csv(age, file = "age.csv", row.names = FALSE)
write.csv(purpose, file = "purpose.csv", row.names = FALSE)
write.csv(count, file = "count.csv", row.names = FALSE)



# 각 연령대별로 데이터 추출
age_15_19 <- subset(age, Type == "15-19")
age_20s <- subset(age, Type == "20s")
age_30s <- subset(age, Type == "30s")
age_40s <- subset(age, Type == "40s")
age_50s <- subset(age, Type == "50s")
age_60up <- subset(age, Type == "60s up")

# 데이터 형식 변환
age_15_19[, c("X2020", "X2021", "X2022")] <- lapply(age_15_19[, c("X2020", "X2021", "X2022")], as.numeric)
age_20s[, c("X2020", "X2021", "X2022")] <- lapply(age_20s[, c("X2020", "X2021", "X2022")], as.numeric)
age_30s[, c("X2020", "X2021", "X2022")] <- lapply(age_30s[, c("X2020", "X2021", "X2022")], as.numeric)
age_40s[, c("X2020", "X2021", "X2022")] <- lapply(age_40s[, c("X2020", "X2021", "X2022")], as.numeric)
age_50s[, c("X2020", "X2021", "X2022")] <- lapply(age_50s[, c("X2020", "X2021", "X2022")], as.numeric)
age_60up[, c("X2020", "X2021", "X2022")] <- lapply(age_60up[, c("X2020", "X2021", "X2022")], as.numeric)
# 평균 계산
age_15_19$Average <- rowMeans(age_15_19[, c("X2020", "X2021", "X2022")])
age_20s$Average <- rowMeans(age_20s[, c("X2020", "X2021", "X2022")])
age_30s$Average <- rowMeans(age_30s[, c("X2020", "X2021", "X2022")])
age_40s$Average <- rowMeans(age_40s[, c("X2020", "X2021", "X2022")])
age_50s$Average <- rowMeans(age_50s[, c("X2020", "X2021", "X2022")])
age_60up$Average <- rowMeans(age_60up[, c("X2020", "X2021", "X2022")])

# 데이터프레임 결합
age_average <- rbind(age_15_19, age_20s, age_30s, age_40s, age_50s, age_60up)

# 엑셀 파일로 저장
write.xlsx(age_average, "age_average.xlsx", row.names = FALSE)


#내가 만든 데이터 프레임을 csv 파일로 저장하기
#성별 데이터
genderMale <- c(42.2,	50.5,	74.1)
genderFelmale <- c(62.3,	74.6,	90.6)
#나이 데이터
age15_19 <- c(75.0,	84.4,	92.5)
age20_s <- c(66.7,	63.3,	88.7)
age30_s <- c(41.4,	54.9,	79.6)
age40_s <- c(44.1,	52.3,	77.2)
age50_s <- c(42.3,	52.2,	77.1)
age60over <- c(48.7,	55.3,	74.5)
#목적 데이터
welbing <-c(100.0,	95.6,	95.5)
meeting <-c(66.9,	64.0,	81.1)
bussiness <-c(38.3,	49.9,	67.7)
education <-c(47.3,	69.7,	86.1)
religion <-c(0,	25.0,	64.5)
etc <-c(75.0,	56.4,	53.4)
#방문횟수 데이터
oneTime <- c(44.9,	62.5,	86.5)
twoTime <- c(48.5,	56.7,	79.6)
threeTime <- c(58.5,	55.3,	80.4)
morethanFourTime <- c(44.9,	54.3,	78.0)
#년도 데이터 
year <-c("2020년","2021년","2022년")

#데이터 프레임 만들기 
TripGender <- data.frame(year,genderMale, genderFelmale)
TripGender
TripSeoulAge <- data.frame(year,age15_19,age20_s,age30_s,age40_s,age50_s,age60over)
TripSeoulAge
TripSeoulPurpose <- data.frame(year,welbing,meeting,bussiness,education,religion,etc)
TripSeoulPurpose
TripSeoulCount <- data.frame(year, oneTime, twoTime, threeTime, morethanFourTime)
TripSeoulCount

alldataframe <- data.frame(TripGender,TripSeoulAge,TripSeoulPurpose,TripSeoulCount)
alldataframe

# TripGender 데이터프레임을 CSV 파일로 저장
write.csv(TripGender, file = "TripGender.csv", row.names = FALSE)

# TripSeoulAge 데이터프레임을 CSV 파일로 저장
write.csv(TripSeoulAge, file = "TripSeoulAge.csv", row.names = FALSE)

# TripSeoulPurpose 데이터프레임을 CSV 파일로 저장
write.csv(TripSeoulPurpose, file = "TripSeoulPurpose.csv", row.names = FALSE)

# TripSeoulCount 데이터프레임을 CSV 파일로 저장
write.csv(TripSeoulCount, file = "TripSeoulCount.csv", row.names = FALSE)

# alldataframe 데이터프레임을 CSV 파일로 저장
write.csv(alldataframe, file = "alldataframe.csv", row.names = FALSE)




