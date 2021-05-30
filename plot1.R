data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

tidy_data_tmp <- data
tidy_data_tmp$Date <- as.Date(data$Date, "%d/%m/%Y")

StartDate <- as.Date("2007-02-01", "%Y-%m-%d")
EndDate <- as.Date("2007-02-02", "%Y-%m-%d")

tidy_data <- tidy_data_tmp[tidy_data_tmp$Date>=StartDate & tidy_data_tmp$Date<=EndDate,]
tidy_data2 <- tidy_data

tidy_data$Time <- paste(tidy_data$Date, tidy_data$Time, sep=" ")
tidy_data$Time <- strptime(tidy_data$Time, format="%Y-%m-%d %H:%M:%S")


png(filename="plot1.png", width =480, height = 480)

hist(tidy_data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main= "Global Active Power")

dev.off()