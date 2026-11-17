# ============================================
# MALARIA SURVEILLANCE DATA ANALYSIS
# ============================================

# 1. Calculate total malaria cases
total_cases <- sum(malaria_data$malaria_cases)

# 2. Calculate average weekly malaria cases
average_cases <- mean(malaria_data$malaria_cases)

# 3. Identify the week with the highest malaria cases
highest_cases <- max(malaria_data$malaria_cases)

highest_week <- malaria_data$week[
  malaria_data$malaria_cases == highest_cases
]

# Display results
cat("Total malaria cases:", total_cases, "\n")
cat("Average weekly cases:", round(average_cases, 2), "\n")
cat("Highest malaria cases:", highest_cases, "\n")
cat("Week with highest cases:", paste(highest_week, collapse = ", "), "\n")

# 4. Create a line plot of malaria cases over time

plot(
  malaria_data$week,
  malaria_data$malaria_cases,
  type = "o",
  col = "blue",
  lwd = 2,
  pch = 16,
  main = "Weekly Malaria Cases Over 24 Weeks",
  xlab = "Week",
  ylab = "Number of Malaria Cases"
)

# Add grid lines
grid()

# 5. Main observation
cat("\nMain Observation:\n")
cat(
  "Malaria cases fluctuated over the 24 weeks, with the highest number",
  "of cases recorded in week(s):",
  paste(highest_week, collapse = ", "),
  ".\n"
)

# ============================================
# END OF ANALYSIS
# ============================================