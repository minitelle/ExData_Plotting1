# plot3.R - multi line graph

# First confirm we have our source file plotting_file.R that included downloading the project zip and subsetting the data fro 2/1/2007 & 2/2/2007.
# if the file doesn't exisit we set our working directory: /ExData_Plotting1/, i.e name of unzipped folder.

# Confirm if household_power_consumption.txt exists, if not, source plotting_file.R that included downloading the project zip and subsetting the data fro 2/1/2007 & 2/2/2007.
# if the file doesn't exisit we set our working directory: /ExData_Plotting1/, i.e name of unzipped folder.

if (!file.exists("~/ExData_Plotting1/household_power_consumption.txt")) {
  setwd("~/ExData_Plotting1/")
  
  source("~/plotting_file.R")
}

# plot energy sub mettering 1, 2, and 3 over days set in datetime object
datetime <- strptime(paste(subfeb.data$Date, subfeb.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub1 <- subfeb.data$Sub_metering_1
sub2 <- subfeb.data$Sub_metering_2
sub3 <- subfeb.data$Sub_metering_3

# prep image plot3 and the plot function
png("plot3.png", width=480, height=480)

#Create the plot and lines
plot(datetime, sub1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, sub2, col = "red")
lines(datetime, sub3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()