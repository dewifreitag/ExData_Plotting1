library(data.table)
feb.data<-fread(
    "sed '1p;/^[12]\\/2\\/2007/!d ' household_power_consumption.txt",
    na.strings=c("?", "")
    )
feb.data$DateTime <- as.POSIXct(paste(feb.data$Date, feb.data$Time), 
                                format="%d/%m/%Y %H:%M:%S") 
png(file="plot2.png", width=480, height=480)
plot(feb.data$DateTime, feb.data$Global_active_power, type="l", lwd=2, 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()