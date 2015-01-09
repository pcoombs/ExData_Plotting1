#Read dataset
testdata <- read.table("./Exp Data a1/household_power_consumption.txt",sep = ";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
#subsett data on 2/1/2007 - 2/2/2007]
testdata$Date <- as.Date(testdata$Date, format="%d/%m/%Y")
data <- subset(testdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


# Create line chart
plot(data$Global_active_power~data$Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
png("plot2.png", width=480, height=480)
dev.off()