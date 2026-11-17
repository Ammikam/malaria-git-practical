
# Synthetic Malaria Surveillance Data

set.seed(42)

week <- 1:24

rainfall <- round(pmax(0,
                       60 + 35 * sin(2 * pi * (week - 3) / 12) +
                         rnorm(24, 0, 10)
))

previous_rainfall <- c(rainfall[1], rainfall[-24])

cases <- rpois(
  24,
  lambda = 15 + 0.3 * previous_rainfall
)

malaria_data <- data.frame(
  week = week,
  rainfall_mm = rainfall,
  malaria_cases = cases
)

print(malaria_data)

write.csv(
  malaria_data,
  "malaria_data.csv",
  row.names = FALSE
)
