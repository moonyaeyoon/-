#자료 정리 (pc방 게임 점유율, 총 플레이시간, 게임의 장르)
name<-c('리그오브레전드','FC온라인','발로란트','서든어택','배틀그라운드','로스트아크','오버워치','메이플스토리','스타크래프트','던전앤파이터','리니지','DiabloII','월드오브워크래프트','아이온','워크래프트3','디아블로4','palworld','한게임포커','이터널리턴','리니지2')
genre<-c('RTS','Sports','FPS','FPS','FPS','RPG','FPS','RPG','RTS','RPG','RPG','RPG','RPG','RPG','RTS','RPG','RPG','포커','RTS','RPG')
rate<-c(39.87,10.64,8.13,6.14,5.16,4.55,4.16,2.76,2.41,2.06,0.91,0.78,0.7,0.63,0.58,0.5,0.47,0.46,0.43,0.41)
usingTime <- c(1737166, 463645, 354402, 267730, 224892, 198454, 181478, 120472, 105007, 89935, 39831, 33792, 30622, 27621, 25217, 21729, 20335, 20167, 18914, 17966)

game<-name
names(genre)<-name #게임과 장르 매칭
level<-paste(1:20,'위',sep="") #순위 paste

#RPG 게임의 개수
rpg_count <- sum(genre == 'RPG')
rpg_count

#10위까지 게임들의 플레이 시간 총 합계 / 10위~20위 게임의 평균 플레이 시간 값
sum(usingTime[1:10])
mean(usingTime[10:20])

#1위와 2위의 점유율 합계
names(rate)<-level
rate['1위']+rate['2위']

#많이 플레이한 시간 순으로 
usingTime<-sort(usingTime,TRUE)
usingTime<-paste(usingTime[1:20],'시간',sep="")
names(usingTime)<-name
usingTime

#rate에 %단위 붙이기
rate<-sort(rate,TRUE)
rate<-paste(rate[1:20],'%',sep="")
names(rate)<-name
rate


#점유율 탑쓰리
top3<-rate[seq(1,3)]
top3


#순위(게임 명)
names(name)<-level
name

#순위(점유율)
names(rate)<-level
rate

percentage<-sort(rate,TRUE) #이용시간비중을 오름차순으로 나열
percentage<-paste(percentage[1:20],'%',sep="") #문자로 변환한 후 벡터를 결합
names(percentage)<-name #이용시간비중&게임종류 매칭
percentage

