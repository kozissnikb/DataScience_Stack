library(shinydashboard)
library(tidyverse)
library(ggplot2)
library(plotly)

options(scipen = 999, width = 65)

# load datsets
python_bigrams <- read_csv("data/python_bigrams.csv")
python_trigrams <- read_csv("data/python_trigrams.csv")
r_bigrams <- read_csv("data/r_bigrams.csv")
r_trigrams <- read_csv("data/r_trigrams.csv")
sql_bigrams <- read_csv("data/sql_bigrams.csv")
sql_trigrams <- read_csv("data/sql_trigrams.csv")
all_tags <- read_csv("data/tags_years_all.csv")