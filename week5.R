sampleSize<-c(1098,824,1357,1764,1797,1532,1674)
activity_rest<-c(97.9,95.8,93.6,91.1,90.3,88.9,87.6)
hobby<-c(58.2,68.2,77.6,80,82,82.7,83.2)
activity_social_other<-c(67.3,70,56.3,58.5,55.6,58,55.2)
activity_sport <-c(12.6,14.7,20.2,21.1,24.4,30,35.7)
tourism<-c(8,12.6,17.1,18.3,17.7,17.1,20.3)
watching_sport<-c(6.4,11.9,10.4,10.3,11.7,11.2,12.8)
watching_culture <-c(2.6,3.8,6.4,9,11.3,11.1,14)
activity_culture <-c(2.6,2.9,4.3,4.2,5.3,3.6,4.8)

leisure_data<-cbind(sampleSize,activity_rest,hobby,activity_social_other,activity_sport,tourism,watching_sport,watching_sport,watching_culture,activity_culture)
leisure_data

leisure_by_income<-matrix(m1, nrow=7, ncol=9)
category_details<- c('100만원 미만','100만원~200만원','200만원~300만원',
                 '300만원~400만원','400만원~500만원','500만원~600만원',
                 '600만원')
rownames(leisure_by_income)<- category_details
category<- c('표본수','휴식활동','취미오락활동',
                 '사회 및 기타활동','스포츠참여활동','관광활동','스포츠관람활동','문화예술관람활동','문화예술참여활동')
colnames(leisure_by_income)<-category

# 데이터 출력
leisure_by_income


# 데이터 구조 확인
str(leisure_data)
str(leisure_by_income)

# '100만원 미만' 행 출력
leisure_by_income['100만원 미만', ]

# '문화예술관람활동' 열 출력
leisure_by_income[, '문화예술관람활동']


#행과열 변환
t(leisure_by_income)

install.packages('svDialogs')
library(svDialogs)
user.input <- dlgInput('Input income')$res
user.input
income <- as.numeric(user.input)
income

  
#자료: 지난 1년 동안 가장 많이 참여한 여가활동 (1+2+3+4+5순위) (단위: %,명)/통계청
activity_culture <-c(3.2, 5.2, 6.8, 5.3, 3.9, 4.6, 2.6, 2.9)
watching_culture <-c(8.7, 11.1, 11.4, 19, 2.6, 4.6, 2.6, 3.8)
watching_sport <-c(19.5, 2.9, 9.8, 11.2, 7.1, 10, 6.4, 11.9)
tourism <-c(17.5, 17, 6.4, 12.6, 7.6, 11.2, 8, 12.6)
activity_sport <-c(30.7, 20.4, 22.7, 33.4, 11.5, 15.9, 12.6, 14.7)
activity_social_other <-c(53.5, 62.8, 59.7, 57.8, 69.2, 67.5, 67.3, 70)
hobby <-c(81.2, 77.3, 89.3, 88.2, 61.6, 76.9, 58.2, 68.2)
activity_rest <-c(88.7, 92.8, 88.2, 85, 97.2, 94.6, 97.9, 95.8)
category_details <-c("남자", "여자", "15~19세", "20대", "초졸 이하", "중졸", "100만원 미만", "100~200만원")
category <-c("성별", "성별", "연령별", "연령별", "학력별", "학력별", "가구소득별", "가구소득별")
leisure<-data.frame(activity_culture, watching_culture, watching_sport,
                    tourism, activity_sport, activity_social_other, hobby, 
                    activity_rest, category_details, category)
leisure

#leisure의 자료구조 확인하기
class(leisure)
is.matrix(leisure)

#상위 자료 확인하기
head(leisure)

#category의 정보를 3가지 방법으로 확인해보기
leisure["category"]
leisure[10]
leisure$category

#leisure의 데이터 구조 알아보기
str(leisure)

#watching_culture에 같은 자료값이 있는지 확인해보기
table(leisure$watching_culture)

#연령별의 자료값만 보기
age <- subset(leisure, category=="연령별")
age

#sport관련 자료의 합을 구하기
sport_sum <- leisure$watching_sport + leisure$activity_sport
sport_sum

gender_male<- matrix(c(4893,   88.7,   81.2,   53.5,   30.7,   17.5,   19.5,   8.7,   3.2),nrow=1)
gender_felmale<-matrix(c(5153,   92.8,   77.3,   62.8,   20.4,   17,   2.9,   11.1,   5.2),nrow=1)
gender_male
gender_felmale

playOf <-c('표본수','휴식활동','취미오락활동','사회 및 기타활동','스포츠참여활동','관광활동','스포츠관람활동','문화예술관람활동','문화예술참여활동')

names(gender_male) <- c('표본수','휴식활동','취미오락활동','사회 및 기타활동','스포츠참여활동','관광활동','스포츠관람활동','문화예술관람활동','문화예술참여활동')
names(gender_felmale ) <- c('표본수','휴식활동','취미오락활동','사회 및 기타활동','스포츠참여활동','관광활동','스포츠관람활동','문화예술관람활동','문화예술참여활동')
gender_male
gender_felmale

gender_male<-sort(gender_male,TRUE)
gender_male<-paste(gender_male[1:9],sep="")
names(gender_male)<-playOf
gender_male

gender_felmale<-sort(gender_felmale,TRUE)
gender_felmale<-paste(gender_felmale[1:9],sep="")
names(gender_felmale)<-playOf
gender_felmale
