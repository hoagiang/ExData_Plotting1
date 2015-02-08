setwd("/Users/hoagiang/hoagiang/courses/2015spring/Exploring_data/projects//project_01/")
conn <- file("household_power_consumption.txt", "r")
power_con <- read.csv("household_power_consumption.txt", header=T, sep=";", colClasses=c(rep("character",2), rep("numeric",7)), na.strings="?")
close(conn)

power_con <- transform(power_con, Date=as.Date(Date, format="%d/%m/%Y"))
power_con <- subset(power_con, Date=="2007-02-01" | Date=="2007-02-02")
power_con <- transform(power_con, Time=strptime(Time, format="%H:%M:%S"))
power_con <- transform(power_con, Time=strftime(Time, format="%H:%M:%S"))

power_con$DateTime <- paste(power_con$Date, power_con$Time)
power_con <- transform(power_con, DateTime=strptime(DateTime, "%Y-%m-%d %H:%M:%S"))

png("plot3.png", width=480, height=480)
plot(power_con$DateTime, power_con$Sub_metering_1, ylab="Energy sub metering", "l", xlab="")
lines(power_con$DateTime, power_con$Sub_metering_2, col="red")
lines(power_con$DateTime, power_con$Sub_metering_3, col="blue")
legend("topright", lty=1, lwd=1  ,col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()