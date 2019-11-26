library("ggplot2")
library("dplyr")
library("leaflet")
library("plotly")
#turning dataset into useable format
energy_consumption_df <- read.csv("AEP_hourly.csv", stringsAsFactors = FALSE)
#View(energy_consumption_df)
  
#separating "Datetime" column into date and time
time <- format(as.POSIXct(strptime(energy_consumption_df$Datetime,
                "%m/%d/%y %H:%M",tz="")), format = "%H:%M")

date <- format(as.POSIXct(strptime(energy_consumption_df$Datetime,
"%m/%d/%y %H:%M",tz="")), format = "%m/%d/%y")

year <- format(as.POSIXct(strptime(energy_consumption_df$Datetime,
"%m/%d/%y %H:%M",tz="")), format = "%y")

#credit to https://stats.stackexchange.com/questions/147063/r-how-to-separate-date-time-data-types

separated_df <- cbind(time, energy_consumption_df)

energy_df <- cbind(date, year, separated_df)
#View(energy_df)
#this dataframe has separated values for "date" and "time"

most_energy <- energy_df %>%
  filter(AEP_MW == max(AEP_MW)) %>%
  select(date)

#by_year <- energy_df %>%
 # select(AEP_MW, year) %>%
  #group_by(year) %>%
#  summarize(mean = mean(AEP_MW)) %>%
#  pull(year, mean)


#barplot1 <- ggplot(data = energy_df) +
#  geom_col(mapping = aes(x = year, y = AEP_MW)) +
#  labs(title = "Energy Use",
#       x = "Year",
#       y = "Mega Watts")


barplot1 <- ggplot(data = energy_df) +
  geom_col(mapping = aes(year, AEP_MW)) +
  labs(title = "Energy Use",
       x = "Year",
       y = "Megawatts")










