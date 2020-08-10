##Plot 2 is a pot of global active power 
## against Day (Thursday, Friday, Saturday)

library(data.table)

data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

## Convert the date variable to R date class

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

##Subset data

DT <- subset(data, subset = (data$Date >= "2007-02-01" & Date <= "2007-02-02"))
