## Plot 4 is a composite plot 
## Top left is global active power against day
## top right is voltage against datetime
## bottom left is energy sub metering against day
## bottom right is global reactive power against day

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

##plot 4 

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
with(DT, {
    plot( y = DT$Global_active_power,x = DT$datetime, xlab = "",
         ylab = "Global Active Power", type = "l")
    plot(y = DT$Voltage, x = DT$datetime, type = "l", xlab = "datetime",
         ylab = "Voltage")
    plot( DT$Sub_metering_1 ~ DT$datetime, type = "l",
               xlab = "", ylab = "Energy sub metering")
         lines(x = DT$datetime, y = DT$Sub_metering_2, col = "Red")
         lines(x = DT$datetime, y = DT$Sub_metering_3, col = "Blue")
         legend("topright", cex = .5, bty = "n", lty=c(1,1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2",
                                                                                     "Sub_metering_3"))
    plot( DT$Global_reactive_power ~ DT$datetime, type = "l",
          xlab = "datetime", ylab = "Global_reactive_power")
})

dev.off()







