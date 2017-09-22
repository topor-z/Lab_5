install.packages("plyr")
install.packages("stingr")
install.packages("oce")
install.packages("pastecs")
install.packages("lubridate")
install.packages("measurements")
library(plyr)
library(stringr)
library(oce)
library(pastecs)
library(lubridate)
library(measurements)
library(readr)
options("digits.secs"=3)

##read csv into r

a <- read_excel("~/Documents/Lab5_projections_data/Alaska.xlsx")
gom<- read_csv("GOM.csv", col_names = TRUE, col_types = NULL)
p <- read_excel("~/Documents/Lab5_projections_data/Peru.xlsx")
str(a)

date <- date[2]
mm <- str_sub(date,1,2)
dd<- str_sub(date, 4, 5)
yy<- str_sub(date, 7, 8)

##adding date format to dataframes
a$month<- sprintf("%02d", a$month)
gom$Month<- sprintf("%02d", gom$Month)
gom$Day<- sprintf("%02d", gom$Day)

a$gisdate<- str_c(a$Year, a$month, "00", sep = "-")
gom$gisdate<- str_c(gom$Year, gom$Month, gom$Day, sep = "-")

summary(a$month)

p$LONG<- gsub("W", "", p$LONG)
p$LAT<- gsub("S", "", p$LAT)

##formating the lat and long for peru 

# change the degree symbol to a space
p$LONG = gsub('°', ' ', p$LONG)
p$LAT = gsub('°', ' ', p$LAT)

# convert from decimal minutes to decimal degrees
p$LONG = measurements::conv_unit(p$LONG, from = 'deg_dec_min', to = 'dec_deg')
p$LAT = measurements::conv_unit(p$LAT, from = 'deg_dec_min', to = 'dec_deg')

p$LONG<- as.numeric(p$LONG)
p$LAT<- as.numeric(p$LAT)

p$LONG<- p$LONG* -1





