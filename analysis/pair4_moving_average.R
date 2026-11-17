

# Step 1: Import the malaria dataset
data <- read.csv("malaria_data.csv")

# Step 2: Calculate the 3-week moving average
data$moving_avg <- as.numeric(
  stats::filter(
    data$malaria_cases,
    rep(1/3, 3),
    sides = 1
  )
)

# Step 3: Display the results
print(data)

# Step 4: View the first 10 rows
head(data, 10)

# Add 3-week moving average as a new column
data$moving_avg <- as.numeric(
  stats::filter(data$malaria_cases, rep(1/3, 3), sides = 1)
)

# View the updated dataset
head(data)

# Plot original weekly malaria cases
plot(data$malaria_cases,
     type = "l",
     col = "blue",
     lwd = 2,
     main = "Original Weekly Malaria Cases",
     xlab = "Week",
     ylab = "Number of Malaria Cases")

# Plot original weekly malaria cases
plot(data$malaria_cases,
     type = "l",
     col = "blue",
     lwd = 2,
     main = "Weekly Malaria Cases and 3-Week Moving Average",
     xlab = "Week",
     ylab = "Number of Malaria Cases")

# Add the 3-week moving average to the same plot
lines(data$moving_avg,
      col = "red",
      lwd = 2,
      lty = 2)

# Add a legend
legend("topright",
       legend = c("Original Weekly Cases",
                  "3-Week Moving Average"),
       col = c("blue", "red"),
       lty = c(1, 2),
       lwd = 2)
#The 3-week moving average smooths out short-term fluctuations in weekly malaria cases, reducing sudden peaks and drops. This makes the underlying trend easier to identify and helps determine whether malaria cases are generally increasing, decreasing, or remaining stable over time.

