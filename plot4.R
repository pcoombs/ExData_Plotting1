#Read dataset
testdata <- read.table("./Exp Data a1/household_power_consumption.txt",sep = ";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
#subsett data on 2/1/2007 - 2/2/2007]
testdata$Date <- as.Date(testdata$Date, format="%d/%m/%Y")
data <- subset(testdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


# Create chart
par(mfrow=c(2,2))
with(data, {
  plot(data$Global_active_power~data$Datetime, type="l", xlab="", ylab="Global Active Power")
  plot(data$Voltage~data$Datetime, type="l", xlab="datetime", ylab="Voltage")
  
  plot(data$Sub_metering_1~data$Datetime, type="l", ylab="Energy sub metering", xlab ="", main = "")
  lines(data$Sub_metering_2~data$Datetime, type="l", col = "red")
  lines(data$Sub_metering_3~data$Datetime, type="l", col = "blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(data$Global_reactive_power~data$Datetime, type="l", xlab="datetime", ylab="Global_reactive_power")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()