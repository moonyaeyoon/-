name <- c('리그오브레전드', 'FC온라인', '발로란트', '서든어택', '배틀그라운드', '로스트아크', '오버워치', '메이플스토리', '스타크래프트', '던전앤파이터', '리니지', 'DiabloII', '월드오브워크래프트', '아이온', '워크래프트3', '디아블로4', 'palworld', '한게임포커', '이터널리턴', '리니지2')
genre <- c('RTS', 'Sports', 'FPS', 'FPS', 'FPS', 'RPG', 'FPS', 'RPG', 'RTS', 'RPG', 'RPG', 'RPG', 'RPG', 'RPG', 'RTS', 'RPG', 'RPG', '포커', 'RTS', 'RPG')
rate <- c(39.87, 10.64, 8.13, 6.14, 5.16, 4.55, 4.16, 2.76, 2.41, 2.06, 0.91, 0.78, 0.7, 0.63, 0.58, 0.5, 0.47, 0.46, 0.43, 0.41)
usingTime <- c(1737166, 463645, 354402, 267730, 224892, 198454, 181478, 120472, 105007, 89935, 39831, 33792, 30622, 27621, 25217, 21729, 20335, 20167, 18914, 17966)
game <- name
names(genre) <- name
level <- paste(1:20, '위', sep = "")

#RPG 게임의 개수
rpg_count <- sum(genre == 'RPG')
rpg_count

# 많이 플레이한 시간 순으로 정렬
usingTime <- sort(usingTime, decreasing = TRUE)
usingTime <- paste(usingTime[1:20], '시간', sep = "")
names(usingTime) <- level  # 여기를 수정

usingTime[1]


#rate에 %단위 붙이기
rate<-sort(rate,TRUE)
rate<-paste(rate[1:20],'%',sep="")
names(rate)<-name
rate

#순위
names(rate)<-name
names(name)<-level
level<-paste(1:20,'위',sep="")
rate

#

#점유율 탑쓰리
top3<-(rate)[seq(3)]
top3