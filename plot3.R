library(data.table)
feb.data<-fread(
    "sed '1p;/^[12]\\/2\\/2007/!d ' household_power_consumption.txt",
    na.strings=c("?", "")
    )
feb.data$DateTime <- as.POSIXct(paste(feb.data$Date, feb.data$Time), 
                                format="%d/%m/%Y %H:%M:%S") 
png(file="plot3.png", width=480, height=480)
plot(feb.data$DateTime, feb.data$Sub_metering_1, 
     xlab="", ylab="Energy sub metering", type="n")
lines(feb.data$DateTime, feb.data$Sub_metering_1, type="l", lwd=2)
lines(feb.data$DateTime, feb.data$Sub_metering_2, type="l", lwd=2, 
            col="red")
lines(feb.data$DateTime, feb.data$Sub_metering_3, type="l", lwd=2, 
            col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()