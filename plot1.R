#Read dataset
testdata <- read.table("./Exp Data a1/household_power_consumption.txt",sep = ";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
#subsett data on 2/1/2007 - 2/2/2007]
testdata$Date <- as.Date(testdata$Date, format="%d/%m/%Y")
data <- subset(testdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Create Histogram chart
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power", col = "red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()