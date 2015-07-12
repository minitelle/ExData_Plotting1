# plot2.R - line graph

# Confirm if household_power_consumption.txt exists, if not, source plotting_file.R that included downloading the project zip and subsetting the data fro 2/1/2007 & 2/2/2007.
# if the file doesn't exisit we set our working directory: /ExData_Plotting1/, i.e name of unzipped folder.

if (!file.exists("~/ExData_Plotting1/household_power_consumption.txt")) {
  setwd("~/ExData_Plotting1/")
  
  source("~/plotting_file.R")
}

# plot the global acive power usage (GAP) over the selected days (2/1 - 2/2) set in datetime as a date object
GAP <- subfeb.data$Global_active_power
datetime <- strptime(paste(subfeb.data$Date, subfeb.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# prep image plot2 and the plot function
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()