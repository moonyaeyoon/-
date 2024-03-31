#주식당 25일(+- 1일)기준 24년 3월 2월 1월 23년 12월 11월 주가와 3월 25일 기준 주당 거래량 자료
stock <- list (MAR = c(191800, 240000, 23500, 14010, 62700),
               FEB = c(201500, 217500, 24350, 13690, 65200),
               JAN = c(192600, 207000, 24550, 15740, 55400),
               DEC = c(241500, 181200, 25000, 14350, 56700),
               NOV = c(269500, 205500, 26500, 16010, 57600),
               deal = c(67823, 125503, 169862, 180242, 195842),
               stocks = c("엔씨소프트", "크래프톤", "카카오게임즈", "넥슨게임즈", "넷마블"))

stock$stocks <- factor(stock$stocks)
names(stock$deal) <- stock$stocks

#가장 많이 거래된 주식과 가장 적게 거래된 주식의 거래량 알아보기
max(stock$deal)
min(stock$deal)


#3월과 2월 주가 차이 중 0원 이하인 주식 알아보기
dif <- c(stock$MAR - stock$FEB)
names(dif) <- stock$stocks
dif[dif<=0]

#23년 11월과 3월의 주가 비교 (11월 > 3월 ?)
comp_NOVnMAR <- stock$NOV > stock$MAR
comp_NOVnMAR

#거래량이 십만 이상인 주식
over100000_deal <- (stock$deal[stock$deal >=100000])
over100000_deal

#거래량이 십만 미만인 주식
under100000_deal <- (stock$deal[stock$deal <100000])
under100000_deal


# 5개월 간 주당 가격이 100000원 이상인 주식
over_100000_price <- stock$stocks[stock$MAR >= 100000 & stock$FEB >= 100000 & stock$JAN >= 100000 & stock$DEC >= 100000 & stock$NOV >= 100000]
cat("5개월 간 주당 가격이 100000원 이상인 주식:\n")
print(over_100000_price)

# 5개월 간 주당 가격이 100000원 이하인 주식
under_100000_price <- stock$stocks[stock$MAR < 100000 & stock$FEB < 100000 & stock$JAN < 100000 & stock$DEC < 100000 & stock$NOV < 100000]
cat("5개월 간 주당 가격이 100000원 이하인 주식:\n")
print(under_100000_price)

