# hw1. Familiar with R basics & submit homework on GitHub

#### Name: 賴昱瑋
#### ID: 114971009

## Description
* 讀取你指定的 CSV 檔案。
* 抓取 weight 和 height 的最大值，並使用 round() 將數值四捨五入至小數點後兩位。
* 自動從 input_path 解析出檔案名稱（例如把 ./data/input1.csv 轉為 input1）作為 set 欄位的值。
* 輸出符合格式要求的 CSV 檔案，且不包含多餘的 row names。

### Code for reference
```R
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
```

### cmd
```R
summary("input1.csv", "output1.csv")
```

### Read an input file

The input data will include other numeric & category columns besides weight and height.

#### examples: `input1.csv`
| persons | weight | height | gender |
| --- | --- | --- | --- |
| person1 | 92.24459 | 182.0007 | F |
| person2 | 79.88506 | 199.0311 | F |
| person3 | 65.59031 | 180.8477 | F |
| … | … | … | … |
| person25 | 80.16016 | 196.6961 | M |
| person26 | 87.0112 | 174.8087 | F |

### Output a summary file
#### examples: `output1.csv`
| set | weight | height |
| --- | --- | --- |
| input1 | 99.76 | 199.03 |



## Reference
* https://gemini.google.com/share/7f7caa396216
* Prompt: 請依附件pdf的需求，使用R語言完成hw1，並讀取input1.csv、input2.csv、input3.csv，達成output1.csv、output2.csv、output3.csv之結果
