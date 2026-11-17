---
  
  # Pair 5 — Wet vs Dry Week Comparison
  
  ### Research Question
  
  **Do wet weeks have more malaria cases than dry weeks?**
  
  ### Branch
  
  ```text
feature/seasonal-comparison
```

### File

```text
analysis/pair5_seasons.R
```

### Tasks

1. Load `malaria_data.csv`.
2. Create a new variable called `season`.
3. Classify weeks with **60 mm or more** of rainfall as `Wet`, and all others as `Dry`.
4. Count the number of wet and dry weeks.
5. Calculate the average number of malaria cases for wet and dry weeks.
6. Create a boxplot comparing malaria cases in wet and dry weeks.
7. As a bonus, repeat the comparison using the *following* week's cases.
8. Add a short comment describing the main observation.

### Starting point

```r
data <- read.csv("malaria_data.csv")

data$season <- ifelse(
  data$rainfall_mm >= 60,
  "Wet",
  "Dry"
)

table(data$season)

# Continue the analysis here
```

### Commit message

```bash
git commit -m "Add wet vs dry season comparison"
```

> **Note:** The 60 mm threshold is an arbitrary value for this practical.