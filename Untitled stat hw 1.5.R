library(rvest)
library(tidyverse)
library(timetk)

url <- "https://guide.wisc.edu/faculty/"
urlFaculty <- read_html(url)

raw_data <- urlFaculty %>%
  html_nodes("ul li")  %>%
  html_text

raw_data_clean <- (raw_data[14:4029])

raw_data_clean <- matrix(raw_data_clean, ncol = 4, byrow = TRUE)
raw_data_clean <- data.frame(raw_data, stringsAsFactors = FALSE) %>%
  tk_tbl()

length(raw_data_clean)
head(raw_data_clean)

colnames(raw_data) <- c('Name', 'Position', 'Department','Degree Information')
