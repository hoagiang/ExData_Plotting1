setwd("/Users/hoagiang/hoagiang/courses/2015spring/Exploring_data/projects//project_01/")
conn <- file("household_power_consumption.txt", "r")
power_con <- read.csv("household_power_consumption.txt", header=T, sep=";", colClasses=c(rep("character",2), rep("numeric",7)), na.strings="?")
close(conn)

power_con <- transform(power_con, Date=as.Date(Date, format="%d/%m/%Y"))
power_con <- subset(power_con, Date=="2007-02-01" | Date=="2007-02-02")
power_con <- transform(power_con, Time=strptime(Time, format="%H:%M:%S"))
power_con <- transform(power_con, Time=strftime(Time, format="%H:%M:%S"))

png("plot1.png", width=480, height=480)
hist(power_con$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()