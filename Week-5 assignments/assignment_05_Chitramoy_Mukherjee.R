# Assignment: ASSIGNMENT 5
# Name: Mukherjee, Chitramoy
# Date: 2023-01-11

#Assignment 5.1
#Using the dplyr package, use the 6 different operations to analyze/transform the data - GroupBy, Summarize, Mutate, Filter, Select, and Arrange
library(readxl)
## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/chitro/Desktop/dsc520-fork-chitro")
housing_df <- read_excel("data/week-7-housing.xlsx")
head (housing_df)
colnames(housing_df)
class(housing_df)

options(repos = list(CRAN="http://cran.rstudio.com/"))
install.packages("dplyr")
library(dplyr)
housing_df %>% select (`Sale Price`, `Sale Date`) %>%  filter(`Sale Price` > 1000000)  %>%
mutate(year=format(as.Date(`Sale Date`, format="%m/%d/%Y"),"%Y")) %>% 
group_by(year) %>% 
summarize(average_sale_price=mean(`Sale Price`),sdev_sale_price=sd(`Sale Price`)) %>%
arrange(desc(year))

install.packages("purrr")
library(purrr)

#Using the purrr package – perform 2 functions on your dataset.  You could use zip_n, keep, discard, compact, etc
bedrooms_count <- keep(housing_df$bedrooms, ~ .x >= 8) 
head(bedrooms_count)
sale_price_1500000 <- discard(housing_df$`Sale Price`, ~ .x <= 1500000) 
head(sale_price_1500000)

#Use the cbind and rbind function on your dataset
housing_df1 <- data.frame(housing_df %>% select (square_feet_total_living, bedrooms, `Sale Price`) %>% filter(`Sale Price` > 600000))
head(housing_df1)
housing_df2 <- data.frame(housing_df %>% select (square_feet_total_living, bedrooms, `Sale Price`) %>% filter(`Sale Price` > 600000))
head(housing_df2)

housisng_df_cbind <- cbind(housing_df1, housing_df2)
housisng_df_cbind

housing_df3 <- data.frame(housing_df %>% select (square_feet_total_living, bedrooms, `Sale Price`) %>% filter(`Sale Price` > 1100000))
head(housing_df3)
housing_df4 <- data.frame(housing_df %>% select (square_feet_total_living, bedrooms, `Sale Price`) %>% filter(bedrooms > 6))
head(housing_df4)
housisng_df_rbind <- rbind(housing_df3, housing_df4)
housisng_df_rbind


#Split a string, then concatenate the results back together
library(stringr)
midwest <- c(
  "Illinois, Indiana, Iowa, Kansas, Michigan, Minnesota, Missouri",
  "Nebraska, North Dakota, Ohio, South Dakota, Wisconsin"
)
midwest
midwest_list <- strsplit(midwest,split= ",")[[1]]
midwest_list
paste(midwest_list,collapse=",")