# Plant Phenotyping Analysis using the PlantGrowth Dataset

![Plant Phenotyping](https://github.com/samiya-maqsood/Plant-Phenotyping/blob/main/PlantPhenotypingBar.png)

## Introduction

This repository contains a plant phenotyping analysis project using the "PlantGrowth" dataset. The objective of this project is to perform basic data analysis and visualization on plant growth data obtained from different treatment groups. We explore the distribution of plant weights in different groups and extract insights from the data.

## Dataset

The "PlantGrowth" dataset is a built-in dataset in R. It contains the following columns:

- `weight`: The weight of the plants (response variable)
- `group`: The group that received different types of fertilizers (treatment variable)

## Output
- The code produce summary in summary.mathematica about the dataset
- The Welch two sample t-test perforemd is in StatisticalTesl.yaml file

## Requirements

To run the code, you need the following software and R packages installed:

- R (version X.X.X)
- RStudio (optional but recommended)
- Required R packages: ggplot2, dplyr

You can install the required packages using the following command in R:

```R
install.packages(c("ggplot2", "dplyr"))

