# 公開用検証データの再計算

v <- read.csv(
  "validation_public.csv",
  fileEncoding = "UTF-8",
  stringsAsFactors = FALSE
)

v$manual_gov[v$manual_gov == ""] <- NA
v$ai_gov[v$ai_gov == ""] <- NA

valid <- v[
  !is.na(v$manual_gov) & !is.na(v$ai_gov),
]

# 検証対象件数
nrow(valid)

# 一致件数
sum(valid$manual_gov == valid$ai_gov)

# 一致率
mean(valid$manual_gov == valid$ai_gov)

# Cohenのκ
irr::kappa2(
  valid[, c("manual_gov", "ai_gov")],
  weight = "unweighted"
)