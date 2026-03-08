summary <- function(input_path, output_path) {
  # 1. 讀取輸入的 CSV 檔案
  data <- read.csv(input_path)
  
  # 2. 取得最大體重與身高，並四捨五入至小數點後兩位
  # 使用 na.rm = TRUE 避免資料中有 NA 導致計算錯誤
  max_weight <- round(max(data$weight, na.rm = TRUE), 2)
  max_height <- round(max(data$height, na.rm = TRUE), 2)
  
  # 3. 萃取 set 名稱 (例如從 "./data/input1.csv" 中取得 "input1")
  # basename() 會取得檔名，sub() 會將 ".csv" 副檔名替換為空白
  set_name <- sub("\\.csv$", "", basename(input_path), ignore.case = TRUE)
  
  # 4. 建立符合輸出格式的 Data Frame
  result <- data.frame(
    set = set_name,
    weight = max_weight,
    height = max_height
  )
  
  # 5. 輸出至指定的路徑，row.names = FALSE 確保不會輸出 index 欄位
  write.csv(result, file = output_path, row.names = FALSE)
}

# =========================================================================
# 本地端測試指令 (供你自己測試 input1~3)
# 提醒：根據 README 規定，上傳到 Gradescope 時請務必確保這些測試指令「維持註解」狀態，
# 以免 Gradescope 自動評分時發生錯誤。
# =========================================================================

# summary("input1.csv", "output1.csv")
# summary("input2.csv", "output2.csv")
# summary("input3.csv", "output3.csv")