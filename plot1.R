##load needed packages
library(lubridate)

##load data from working directory, ";" separated, "?" is NA character
hpc_data <- read.delim(file="household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
##subset to two dates under analysis
hpc <- subset(hpc_data,hpc_data$Date == "1/2/2007" | hpc_data$Date == "2/2/2007")
rm(hpc_data)

##coerce data to appropriate formats
hpc$Date <- dmy(hpc$Date)
hpc$Time <- strptime(hpc$Time,"%H:%M:%S")

## create plot1 - a histogram of Global Active Power
attach(hpc)
hist(Global_active_power,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     col="red")

detach(hpc)

##export result to a png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()