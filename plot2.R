# Read the data file
setwd("//hfavwfsrp003/home$/bashkin.shani/Mooc - Coursera Courses/3 - Exploratory Data Analysis/Week1/peers assignment")
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

# Convert the date and time & create a timestamp from it
sub_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
sub_data$Date = as.Date(sub_data$Date, "%d/%m/%Y")
sub_data$datetime = strptime(paste(sub_data$Date,sub_data$Time), "%Y-%m-%d %H:%M:%S")

# Convert additional data
sub_data$Global_active_power = as.numeric(as.character(sub_data$Global_active_power))

# Start ploting to PNG file
dev.set(4)
png(file = "plot2.png")

with(sub_data, plot(datetime, Global_active_power, type = "l",
                    xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()
# End ploting to PNG file

# Plot also to screen
with(sub_data, plot(datetime, Global_active_power, type = "l",
                    xlab = "", ylab = "Global Active Power (kilowatts)"))