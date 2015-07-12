# plot2.R - line graph

# First confirm we have our source file plotting_file.R that included downloadin the project zip and subsetting the data fro 2/1/2007 & 2/2/2007.
# if the file doesn't exisit we set our working directory: /ExData_Plotting1/, i.e name of unzipped folder.

if (!"~/plotting_file.R" %in% list.files()) {
  setwd("~/ExData_Plotting1/")
} 

source("~/plotting_file.R")

# plot GAP over days set in datetime object
GAP <- as.numeric(subfeb.data$Global_active_power)
datetime <- strptime(paste(subfeb.data$Date, subfeb.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# prep image plot2 and the plot function
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()