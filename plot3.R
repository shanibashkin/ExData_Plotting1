# Read the data file
setwd("//hfavwfsrp003/home$/bashkin.shani/Mooc - Coursera Courses/3 - Exploratory Data Analysis/Week1/peers assignment")
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

# Convert the date and time & create a timestamp from it
sub_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
sub_data$Date = as.Date(sub_data$Date, "%d/%m/%Y")
sub_data$datetime = strptime(paste(sub_data$Date,sub_data$Time), "%Y-%m-%d %H:%M:%S")

# Convert additional data
sub_data$Sub_metering_1 = as.numeric(as.character(sub_data$Sub_metering_1))
sub_data$Sub_metering_2 = as.numeric(as.character(sub_data$Sub_metering_2))
sub_data$Sub_metering_3 = as.numeric(as.character(sub_data$Sub_metering_3))

# Ploting
with(sub_data, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(sub_data, lines(datetime, Sub_metering_2, col = "red"))
with(sub_data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend = names(sub_data)[7:9], col = c("black", "red", "blue"), lty = 1, cex = 0.8)

# Export to PNG file
dev.copy(png,"plot3.png")
dev.off()