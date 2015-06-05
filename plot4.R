mydata <- read.csv("C:/Users/Marina/Documents/Rdata/household_power_consumption.txt",header=TRUE,stringsAsFactors=FALSE,sep=';',na.strings = "?")
mydata$Date <- as.Date(mydata$Date, format= "%d/%m/%Y")
mydata.sub <- subset(mydata, Date <= "2007-02-02")
mydata.sub1 <- subset(mydata.sub, Date >= "2007-02-01") # get the needed Date frame
mydata.sub1['Datetime'] <- as.POSIXct(paste(mydata.sub1$Date, mydata.sub1$Time), format="%Y-%m-%d %H:%M:%S")
#mydata.sub1$Date <- NULL #delete old Date column
#mydata.sub1$Time <- NULL # delete old Time column
#mydata.sub1 <- mydata.sub1[c(8,1,2,3,4,5,6,7)] # reorder columns to make Datetime column  in the 1st place

png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
with(mydata.sub1,{
  plot(Datetime,Global_active_power,type = "l", ylab = "Global Active Power",xlab = "")
  plot(Datetime,Voltage,type = "l", ylab = "Voltage",xlab = "datetime")
  plot(Datetime,Sub_metering_1,type = "l", ylab = "Energy sub metering",xlab = "")
    lines(Datetime,Sub_metering_2, col = "red")
    lines(Datetime,Sub_metering_3, col = "blue")
    legend("topright", lwd=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n")
  plot(Datetime,Global_reactive_power,type = "l", ylab = "Global_reactive_power",xlab = "datetime")
  })
dev.off()