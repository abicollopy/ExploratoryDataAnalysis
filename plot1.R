##For each file construct and save a PNG
## 480 by 480 pixels

## Plot 1 is a histogram of Global Active Power 


##Reading in the data 
##We only need between 2007-02-01 and 2007-02-02

library(data.table)

data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

## Convert the date variable to R date class

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

##Subset data

DT <- subset(data, subset = (data$Date >= "2007-02-01" & Date <= "2007-02-02"))

##Plot 1 

png("plot1.png", width = 480, height = 480)

hist(DT$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     col = "Red")

dev.off()