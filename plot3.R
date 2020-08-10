## Plot 3 is a plot of Energy sub metering against day 
## Coloured by which sub metering 

library(data.table)

data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

## Convert the date variable to R date class

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

##Subset data

DT <- subset(data, subset = (data$Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates and times

DT$datetime <- strptime(paste(DT$Date, DT$Time), 
                        "%Y-%m-%d %H:%M:%S")

DT$datetime <- as.POSIXct(DT$datetime)

## Plot 3 

png("plot3.png", width = 480, height = 480)

plot( DT$Sub_metering_1 ~ DT$datetime, type = "l",
      xlab = "", ylab = "Energy sub metering")
lines(x = DT$datetime, y = DT$Sub_metering_2, col = "Red")
lines(x = DT$datetime, y = DT$Sub_metering_3, col = "Blue")
legend("topright",lty=c(1,1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2",
                                                              "Sub_metering_3"))
dev.off()

