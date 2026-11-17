# Pair 2 — Rainfall and Malaria Cases
# Research question: What relationship exists between rainfall and
# malaria cases in the synthetic dataset?

# 1. Load the data
data <- read.csv("malaria_data.csv")

# 2. Average weekly rainfall
average_rainfall <- mean(data$rainfall_mm)

# 4. Correlation between rainfall and malaria cases (same week)
correlation <- cor(data$rainfall_mm, data$malaria_cases)

cat("Average weekly rainfall (mm):", round(average_rainfall, 1), "\n")
cat("Same-week correlation:       ", round(correlation, 2), "\n")

# 5. Positive or negative?
direction <- ifelse(correlation > 0, "positive", "negative")
cat("The relationship is", direction, "\n")

# 3. Scatterplot of rainfall against malaria cases
plot(
  data$rainfall_mm, data$malaria_cases,
  pch = 19, col = "steelblue",
  main = "Rainfall vs Malaria Cases (same week)",
  xlab = "Weekly rainfall (mm)",
  ylab = "Number of malaria cases"
)
abline(lm(malaria_cases ~ rainfall_mm, data = data), col = "firebrick")

# 6. Bonus: previous-week rainfall vs current-week cases
data$previous_rainfall <- c(NA, head(data$rainfall_mm, -1))

lagged_correlation <- cor(
  data$previous_rainfall,
  data$malaria_cases,
  use = "complete.obs"
)
cat("Lagged (previous-week) correlation:", round(lagged_correlation, 2), "\n")

plot(
  data$previous_rainfall, data$malaria_cases,
  pch = 19, col = "darkgreen",
  main = "Previous-Week Rainfall vs Malaria Cases",
  xlab = "Previous week's rainfall (mm)",
  ylab = "Number of malaria cases"
)

# 7. Main observation:
# Average rainfall was about 61.2 mm per week. Same-week rainfall and
# cases are positively correlated (r = 0.55). The link is much stronger
# with the previous week's rainfall (r = 0.83). That matches how the data was
# simulated: cases depend on last week's rain. Synthetic data only, so
# this is not a real epidemiological finding.
