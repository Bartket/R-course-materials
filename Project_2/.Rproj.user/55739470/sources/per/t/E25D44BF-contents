
library(readxl)
library(readr)
library(dplyr)
library(stringr)
library(plotly)

airbnb <- read_xlsx("Data/airbnb.xlsx")

airbnb2 <- airbnb #copy dataframe

head(airbnb, 2)

tail(airbnb, 10)

columns <- colnames(airbnb2)
#paste0 no spaces #paste with spaces
new_column_names <- paste0("columns",1:13)

colnames(airbnb2) <- new_column_names

write_delim(airbnb2,"output/airbnb_new_columns.csv",delim = ";")

setwd("output") # changed working directory to output folder

write_delim(airbnb2,"airbnb_new_columns.csv",delim = ";")

setwd("..") # back to the main directory

airbnb[1:100,]

Neighbourhoods <- table(airbnb$Neighbourhood)

airbnb_brooklyn <- airbnb[airbnb$Neighbourhood == "Brooklyn",]

airbnb_brooklyn <- airbnb[airbnb$Neighbourhood == "Brooklyn" &
                            airbnb$`Property Type` == "Apartment" &
                            airbnb$Price <= 100,]

Missing_Rating <- which(is.na(airbnb_brooklyn$`Review Scores Rating`))

airbnb_brooklyn <- airbnb_brooklyn[-Missing_Rating,]

airbnb_brooklyn <- airbnb_brooklyn[airbnb_brooklyn$`Review Scores Rating` >= 90,]

write_delim(airbnb_brooklyn, "output/airbnb_brooklyn.csv", delim = ";")

sort(table(airbnb$`Property Type`),decreasing = T)

airbnb_brooklyn_dplyr <- airbnb %>%
  filter(Neighbourhood == "Brooklyn") %>%
  filter(`Property Type` == "House") %>%
  filter(Price <= 100) %>% 
  filter(!is.na(`Review Scores Rating`)) %>%
  filter(`Review Scores Rating` >= 90)

airbnb$Price <- as.character(airbnb$Price)

airbnb$Price <- as.numeric(airbnb$Price)

airbnb_TASK1_dplyr <- airbnb %>%
  filter(Neighbourhood == "Manhattan"|Neighbourhood == "Queens") %>%
  filter(`Property Type` == "Loft") %>%
  filter(Price > 200) %>% 
  filter(!is.na(`Review Scores Rating`)) %>%
  filter(`Review Scores Rating` >= 80)

DF_prices <- data.frame("Neighbourhood" = airbnb_TASK1_dplyr$Neighbourhood)

DF_prices$Extra_Rate <- 1

DF_prices$Extra_Rate[DF_prices$Neighbourhood == "Manhattan"] <- 1.1

DF_prices <- DF_prices %>% filter(!duplicated(DF_prices)) %>%
  filter(Neighbourhood == "Queens")

airbnb_TASK2_dplyr <- airbnb_TASK1_dplyr %>%
  inner_join(DF_prices) %>%
  mutate(Corrected_Price = Price * Extra_Rate)

NBH <- c("Manhattan","Bronx","Queens")

airbnb_task3 <- airbnb %>% filter(!Neighbourhood %in% NBH)






