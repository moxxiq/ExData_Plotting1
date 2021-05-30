data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

tidy_data_tmp <- data
tidy_data_tmp$Date <- as.Date(data$Date, "%d/%m/%Y")

StartDate <- as.Date("2007-02-01", "%Y-%m-%d")
EndDate <- as.Date("2007-02-02", "%Y-%m-%d")

tidy_data <- tidy_data_tmp[tidy_data_tmp$Date>=StartDate & tidy_data_tmp$Date<=EndDate,]
tidy_data2 <- tidy_data

tidy_data$Time <- paste(tidy_data$Date, tidy_data$Time, sep=" ")
tidy_data$Time <- strptime(tidy_data$Time, format="%Y-%m-%d %H:%M:%S")

png(filename="plot4.png", width =480, height = 480)

par(mfrow=c(2,2))

plot(tidy_data$Time, tidy_data$Global_active_power, type="l", xlab="", ylab="Global Active Power", main="")


plot(tidy_data$Time, tidy_data$Voltage, type="l", xlab="datetime", ylab="Voltage", main="")



plot(tidy_data$Time,tidy_data$Sub_metering_1, type="l",col="black", xlab="",ylab="Energy sub metering")
lines(tidy_data$Time,tidy_data$Sub_metering_2,col="red")
lines(tidy_data$Time,tidy_data$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col=c("black","red","blue"), bty="n")



plot(tidy_data$Time, tidy_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", main="")

dev.off()