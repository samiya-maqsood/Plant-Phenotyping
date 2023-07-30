# Install and load necessary packages
install.packages("ggplot2")
install.packages("dplyr")

library(ggplot2)
library(dplyr)

# Load the "PlantGrowth" dataset
data(PlantGrowth)

# Plant Phenotyping Analysis

# Step 1: Data Summary
# Display summary statistics of the "PlantGrowth" dataset
summary(PlantGrowth)

# Step 2: Data Visualization
# Create a box plot to visualize the distribution of plant weights in different groups

# Calculate descriptive statistics for each group using dplyr functions
group_summary <- PlantGrowth %>%
  group_by(group) %>%
  summarise(MeanWeight = mean(weight),
            MedianWeight = median(weight),
            SDWeight = sd(weight))

ggplot() +
  geom_boxplot(data = PlantGrowth, aes(x = group, y = weight, fill = group),
               alpha = 0.7, outlier.shape = NA) +
  geom_jitter(data = PlantGrowth, aes(x = group, y = weight),
              width = 0.2, alpha = 0.5) +
  labs(x = "Group", y = "Plant Weight", title = "Plant Growth by Group") +
  theme_minimal() +
  theme(legend.position = "none") +
  geom_text(data = group_summary, aes(x = group, y = MeanWeight + 0.05,
                                      label = paste("Mean:", round(MeanWeight, 2))),
            position = position_dodge(width = 0.8), vjust = -0.5, size = 4) +
  geom_errorbar(data = group_summary, aes(x = group, ymin = MeanWeight - SDWeight, ymax = MeanWeight + SDWeight),
                position = position_dodge(width = 0.8), width = 0.25) +
  geom_hline(data = group_summary, aes(yintercept = MedianWeight),
             linetype = "dashed", color = "blue") +
  geom_text(data = group_summary, aes(x = group, y = MedianWeight - 0.05,
                                      label = paste("Median:", round(MedianWeight, 2))),
            position = position_dodge(width = 0.8), vjust = 1.5, color = "blue", size = 4)

# Step 3: Statistical Test (t-test)
# Perform a t-test to compare plant weights between the two groups (unpaired t-test)
group1_weight <- PlantGrowth$weight[PlantGrowth$group == "ctrl"]
group2_weight <- PlantGrowth$weight[PlantGrowth$group == "trt1"]
t_test_result <- t.test(group1_weight, group2_weight)

# Display the t-test results
print(t_test_result)
