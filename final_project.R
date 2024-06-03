# 필요한 패키지 설치
install.packages("svDialogs")
install.packages("ggplot2")

# 패키지 로드
library(svDialogs)
library(ggplot2)

# 점유율 데이터 생성 (2012~2023)
years_prop <-2012:2023
mobile_prop <- c(18, 23, 29, 34, 40, 46, 51, 54, 57, 59, 50, 50)
pc_prop <- c(37, 38, 36, 34, 30, 27, 24, 22, 21, 19, 22, 22)
console_prop <- c(45, 39, 35, 32, 30, 27, 25, 24, 23, 22, 28, 28)

# 매출 데이터 생성
years_sales <- 2016:2023
console_sales <- c(35, 32, 34, 36, 38, 39.6, 51, 53)
mobile_sales <- c(42, 55.98, 69.87, 82, 94, 106, 92, 90)

# 게임 시장
data_list <- list(
  game_market_proportion = data.frame(
    Year = years_prop,
    Mobile = mobile_prop,
    PC = pc_prop,
    Console = console_prop
  ),
  game_market_profit = data.frame(
    Year = years_sales,
    Console_Sales = console_sales,
    Mobile_Sales = mobile_sales
  )
)

# 엑셀 파일 생성 및 저장
file_name <- "game_market_data.xlsx"
write.xlsx(data_list$game_market_proportion, file = file_name, sheetName = "Game Market Proportion", row.names = FALSE)
write.xlsx(data_list$game_market_profit, file = file_name, sheetName = "Game Market Profit", append = TRUE, row.names = FALSE)


# 나라별 게임시장 규모 데이터 생성
data_list_country <- list(
  #한국 게임 시장
  "Korea" = t(data.frame(
    Mobile = c(10831081, 12148320, 13072030),
    Console = c(1092487, 1052000, 1119626),
    PC = c(4901189, 5637277, 5805260)
  )),
  #한국 게임 시장 - 종사자
  "Korea_Workers" = t(data.frame(
    Mobile = c(27028,29015,30113),
    Console = c(1110,1204,2075),
    PC = c(27028,29015,30113)
  )),
  # 중국 게임시장
  "China"= t(data.frame(
    Social_Casual = c(41237, 46017, 53941),
    Console = c(773, 853, 948),
    PC = c(8120, 8436, 7858)
  )),
  
  # 프랑스 게임시장
  "France"= t(data.frame(
    Social_Casual = c(2355, 2404, 2507),
    Console = c(1761, 1742, 1880),
    PC_Game = c(1080, 1104, 1090)
  )),
  
  # 인도네시아 게임 시장
  "Indonesia" = t(data.frame(
    Social_Casual = c(1044, 1090, 1383),
    Console = c(95, 114, 135),
    PC_Game = c(71, 71, 73)
  )),
  
  # UAE 게임 시장
  "UAE" = t(data.frame(
    Social_Casual = c(316, 373, 394),
    Console = c(53, 53, 54),
    PC_Game = c(25, 24, 24)
  )),
  
  # 태국 게임 시장
  "Thailand" = t(data.frame(
    Social_Casual = c(779.9, 875.3, 801.4),
    Console = c(95.9, 95.9, 96.8),
    PC_Game = c(252.7, 261.2, 271.5)
  )),
  
  # 미국 게임 시장
  "USA" = t(data.frame(
    Social_Casual = c(32807, 35859, 37142),
    Console = c(9947, 9485, 9484),
    PC_Game = c(5313, 5591, 5472)
  )),
  
  # 일본 게임 시장
  "Japan" = t(data.frame(
    Social_Casual = c(13156, 14080, 14272),
    Console = c(3142, 2724, 2623),
    PC_Game = c(1493, 1540, 1387)
  ))
)
years_country <- 2020:2022

# 국가별 게임 시장 규모 엑셀 파일 생성
xlsx_file <- "game_market_size_country.xlsx"

# 엑셀 파일에 데이터프레임 저장
for (country in names(data_list_country)) {
  colnames(data_list_country[[country]]) <- years_country
  write.xlsx(x = data_list_country[[country]], file = xlsx_file, sheetName = country, append = TRUE)
}

# 선 그래프- 점유율
plot_proportion <- function() {
  # 엑셀 파일에서 데이터 읽기
  data <- read.xlsx("game_market_data.xlsx", sheetIndex = 1)
  
  # 초기 plot 설정
  plot(data$Year, data$Mobile, type = "o", col = "blue", lwd = 2, ylim = c(0, 60),
       xlab = "Year", ylab = "Percentage", main = "Platform Percentage Over Years")
  
  # 다른 플랫폼 추가
  lines(data$Year, data$PC, type = "o", col = "red",lwd = 2)
  lines(data$Year, data$Console, type = "o", col = "green",lwd = 2)
  
  # 범례 추가
  legend("topleft",legend=c("Mobile","PC","Console"), fill=c('red','blue','green'))
}

# 선 그래프 - 매출
plot_sales <- function() {
  # 엑셀 파일에서 데이터 읽기
  data <- read.xlsx("game_market_data.xlsx", sheetIndex = 2)
  
  plot(data$Year, data$Console_Sales, type = "o", col = "blue", ylim = c(0, max(c(data$Console_Sales, data$Mobile_Sales))),
       xlab = "Year", ylab = "Sales ($M)", main = "Console and Mobile Sales (2016-2023)")
  lines(data$Year, data$Mobile_Sales, type = "o", col = "green")
  legend("topleft", legend = c("Console", "Mobile"), col = c("blue", "green"), lty = 1, pch = 1)
  abline(v = 2020, col = "red", lty = 2)
}

# 선 그래프 - 한국
plot_korea_data <- function(country_name) {
  # 엑셀 파일에서 해당하는 나라의 데이터 불러오기
  xlsx_file <- "game_market_size_country.xlsx"
  data <- read.xlsx(xlsx_file, sheetName = country_name)
  data<-data[,-1]
  
  # 각 열을 백분율로 변환
  data_prop <- apply(data, 2, function(x) {
    round(100 * x / sum(x), 1)
  })
  
  
  # 연도 데이터
  years <-c(2020,2021,2022)
  
  # 그래프 그리기
  par(mfrow = c(2, 1))  # 2행 1열 레이아웃 설정
  
  # console_percentages 선 그래프
  plot(years, data_prop[2,], type = "o",
       xlab = "Year", ylab = "Profit ($)",
       main = paste("Yearly Percentage Change in", country_name, "Console Market"),
       col = "blue", lwd = 2, pch = 16)
  grid()
  
  # console_profit 선 그래프
  plot(years, data[2,], type = "o",
       xlab = "Year", ylab = "Profit ($)",
       main = paste("Yearly Profit in", country_name, "Console Market"),
       col = "red", lwd = 2, pch = 16)
  grid()
  
  # 레이아웃 초기화
  par(mfrow = c(1, 1))
}

#막대 - 나라별
bar_country_data <- function(country_name) {
  # 엑셀 파일에서 데이터 불러오기
  xlsx_file <- "game_market_size_country.xlsx"
  country_data <- read.xlsx(xlsx_file, sheetName =country_name)
  
  # 막대 그래프 생성
  par(mfrow = c(1, 1), mar = c(5, 5, 5, 10))
  barplot(
    as.matrix(country_data[,-1]),
    main = paste(country_name, "Game Market (unit: 1M $)"),
    col = c('skyblue', 'orange', 'green'),
    legend.text = c('Social/Casual', 'Console', 'PC Game'),
    args.legend = list(x='topright', bty = 'o', inset = c(-0.45, -0.0)),
    beside = FALSE,
  )
  par(mfrow = c(1, 1), mar = c(5, 4, 4, 2) + 0.1)
}

# 공통적으로 가설 검정을 하는 함수 정의
hypothesis_test <- function(data_1, data_2) {
  mean_1 <- mean(data_1)
  mean_2 <- mean(data_2)
  
  sd_1 <- sd(data_1)
  sd_2 <- sd(data_2)
  
  n_1 <- length(data_1)
  n_2 <- length(data_2)
  
  z_value <- (mean_2 - mean_1) / sqrt((sd_1^2 / n_1) + (sd_2^2 / n_2))
  p_value <- 2 * pnorm(-abs(z_value))
  
  cat("Mean (Data 1):", mean_1, "\n")
  cat("Mean (Data 2):", mean_2, "\n")
  cat("SD (Data 1):", sd_1, "\n")
  cat("SD (Data 2):", sd_2, "\n")
  cat("Z-value:", z_value, "\n")
  cat("P-value:", p_value, "\n")
  
  threshold <- 1.65
  x <- seq(-3, 3, length = 100)
  y <- dnorm(x)
  plot(x, y, type = "l", lwd = 2, col = "black", main = "Z-test", xlab = "Z-Score", ylab = "Density")
  abline(v = threshold, col = "red", lty = 2)
  abline(v = -threshold, col = "red", lty = 2)
  abline(v = z_value, col = "blue", lty = 2)
  text(threshold, 0.05, paste("Threshold\n", threshold), col = "red", pos = 4)
  text(-threshold, 0.05, paste("Threshold\n", -threshold), col = "red", pos = 4)
  text(z_value, 0.05, paste("Z\n", round(z_value, 2)), col = "blue", pos = 4)
}

