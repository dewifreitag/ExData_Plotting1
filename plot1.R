library(data.table)
feb.data<-fread(
    "sed '1p;/^[12]\\/2\\/2007/!d ' household_power_consumption.txt",
    na.strings=c("?", "")
    )
feb.data$DateTime <- as.POSIXct(paste(feb.data$Date, feb.data$Time), 
                                format="%d/%m/%Y %H:%M:%S") 
png(file="plot1.png", width=480, height=480)
hist(feb.data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()