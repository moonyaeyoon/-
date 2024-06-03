#주식당 25일(+- 1일)기준 24년 3월 2월 1월 23년 12월 11월 주가와 3월 25일 기준 주당 거래량 자료
options(scipen = 100)
MAR = c(191800, 240000, 23500, 14010, 62700)
FEB = c(201500, 217500, 24350, 13690, 65200)
JAN = c(192600, 207000, 24550, 15740, 55400)
DEC = c(241500, 181200, 25000, 14350, 56700)
NOV = c(269500, 205500, 26500, 16010, 57600)
deal = c(67823, 125503, 169862, 180242, 195842)
stocks <- c("NCsoft", "KRAFTON", "Kakao Games", "NEXON Games", "Netmarble")

st <- rbind(NOV, DEC, JAN, FEB, MAR)
colnames(st)<-stocks
st

#vertical graph
par(mfrow = c(1, 1), mar = c(5, 5, 5, 10))
barplot(st, main='월별 주가(23년 11월~ 24년 3월 25일기준)',
        col = c('green', 'blue', 'yellow', 'red', 'black'),
        legend.text = c('11월(23년)', '12월', '1월(24년)', '2월', '3월'),
        args.legend = list(x='topright', bty = 'o', inset = c(-0.25, 0)))
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2)+0.1)

#horizontal graph
stock <- cbind(MAR,FEB,JAN,DEC,NOV)
colnames(stock)<- c('MAR','FEB','JAN','DEC','NOV')
rownames(stock)<- stocks
stock
par(mfrow=c(1, 1), mar=c(5, 5, 5, 7))
barplot(stock, main = 'Game Stock Market
(2023.11 ~ 2024.3)', horiz = T, beside = T,las = 1,
        col =c('tomato','seashell','tan','moccasin','yellowgreen'),
        legend.text =c('nc','crafton','kakao','nexon','netmarble'), 
        args.legend = list(x='bottom',horiz=T,bty = 'y', inset=c(0,-0.34)))

#파이차트 
colors <- c('tomato','seashell','tan','moccasin','yellowgreen')
names(colors) <- c('nc','crafton','kakao','nexon','netmarble')

pie(deal, main='Stock Chart(Unit: won)', labels = deal, col = colors)

legend("bottomright", legend = stocks, fill = colors)

