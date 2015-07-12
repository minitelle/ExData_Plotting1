# Read project file and subset data
getwd()

# Set the file to download for analysis. Careful it's 20MB. The assumption is that the directory doens't already exist so this is to provide you with the file used for the project and have a fresh new install.
download_zip <- download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="~/plots.zip", method ="curl")
# Confirm the zip file has been downloded -  the dowlonad might take sometime.
file.exists("plots.zip")

# To unzip the file the simplest is to download the downloader package. the assumption is that you do not have it.
# If you don't please proceed. If you do please proceed right away to calling the library instead of starting by downloading it.
# install.packages("downloader") ##only if you have haven't installed the package before.
library("downloader") ## required to unzip the file.
unzip ("plots.zip", exdir = "./")
list.dirs()

# Read the file in ExData 1 folder
hpc_file <- "~/ExData_Plotting1/household_power_consumption.txt"
data <- read.table(hpc_file, 
           sep = ";", 
           header = TRUE,  
           colClasses = c("character", "character", rep("numeric", 7)),
           na.strings = "?")
# Then subset to only get 1/2/2007 and 2/2/2007 otherwise the file includes: 2,075,259 rows.
subfeb.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Clean up work
rm(download_zip, data)

