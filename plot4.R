# plot4.R - Multiple plots

# Confirm if household_power_consumption.txt exists, if not, source plotting_file.R that included downloading the project zip and subsetting the data fro 2/1/2007 & 2/2/2007.
# if the file doesn't exisit we set our working directory: /ExData_Plotting1/, i.e name of unzipped folder.

if (!file.exists("~/ExData_Plotting1/household_power_consumption.txt")) {
  setwd("~/ExData_Plotting1/")
  
  source("~/plotting_file.R")
}

# plot GAP over days set in datetime object
datetime <- strptime(paste(subfeb.data$Date, subfeb.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP <- subfeb.data$Global_active_power
sub1 <- subfeb.data$Sub_metering_1
sub2 <- subfeb.data$Sub_metering_2
sub3 <- subfeb.data$Sub_metering_3
GRP <- subfeb.data$Global_reactive_power
volt <- subfeb.data$Voltage

# prep image plot4 and the plot function
png("plot4.png", width=480, height=480)

# Create the 4 plots
par(mfrow = c(2, 2), mar = c(5, 4, 4, 2) + 0.1)
# GAP plot  
  plot(datetime, GAP, type = "l", xlab = "", ylab = "Global Active Power")
# voltage plot 
plot(datetime, volt, type = "l", xlab = "datetime", ylab = "Voltage")
# Submettering plot 
plot(datetime, sub1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(datetime, sub2, col = "red")
  lines(datetime, sub3, col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
# GRP plot 
plot(datetime, GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()