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