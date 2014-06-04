# project 1, exploratory data analysis

power <- read.table("data1/household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
p <- subset(power, power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02"))
png('plot1.png')
hist(p$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     ylim = range(0,1200))
dev.off()