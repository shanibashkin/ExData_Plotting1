# Read the data file
setwd("//hfavwfsrp003/home$/bashkin.shani/Mooc - Coursera Courses/3 - Exploratory Data Analysis/Week1/peers assignment")
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

# Convert the date and time & create a timestamp from it
sub_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
sub_data$Date = as.Date(sub_data$Date, "%d/%m/%Y")
sub_data$datetime = strptime(paste(sub_data$Date,sub_data$Time), "%Y-%m-%d %H:%M:%S")

# Convert additional data
sub_data$Global_active_power = as.numeric(as.character(sub_data$Global_active_power))
sub_data$Sub_metering_1 = as.numeric(as.character(sub_data$Sub_metering_1))
sub_data$Sub_metering_2 = as.numeric(as.character(sub_data$Sub_metering_2))
sub_data$Sub_metering_3 = as.numeric(as.character(sub_data$Sub_metering_3))
sub_data$Voltage = as.numeric(as.character(sub_data$Voltage))
sub_data$Global_reactive_power = as.numeric(as.character(sub_data$Global_reactive_power))

# Prepare the splitted window
par(mfrow = c(2,2))

# Plot 1
plot(sub_data$datetime, sub_data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

# Plot 2
plot(sub_data$datetime, sub_data$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

# Plot 3
with(sub_data, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(sub_data, lines(datetime, Sub_metering_2, col = "red"))
with(sub_data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend = names(sub_data)[7:9], col = c("black", "red", "blue"), lty = 1, cex = 0.6, bty = "n", y.intersp = 0.45, text.width = strwidth("100,000"))
       #,  ,inset = -0.05, , , xjust = 1, yjust = 1,, , x.intersp = 0.5

# Plot 4
with(sub_data, plot(datetime, Global_reactive_power, type = "l"))

# Export to PNG file
dev.copy(png,"plot4.png")
dev.off()