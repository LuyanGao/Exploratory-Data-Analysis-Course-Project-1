#Download,unzip and read the data
hpcdata<-read.csv(file='household_power_consumption.txt' ,sep=';',header=TRUE, stringsAsFactors = FALSE, na.strings= "?", strip.white=TRUE)
#convert the format of the date
hpcdata$Date<-as.Date(hpcdata$Date, format="%d/%m/%Y")
#use only the required data from 2007-02-01 to 2007-02-02
hpcdata<-subset(hpcdata,subset = (hpcdata$Date =='2007-02-01' | hpcdata$Date =='2007-02-02'))
#get the datetime
hpcdata$datetime<-paste(hpcdata$Date,hpcdata$Time)
hpcdata$datetime<- as.POSIXct(hpcdata$datetime)
#plot and save it to a png file with width of 480 pixels and height of 480 pixels
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 
# 1 Global Active power
with(hpcdata,plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2))
# 2 Voltage
with(hpcdata,plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage"))
# 3 Plot Submetering
with(hpcdata,plot(datetime, as.numeric(Sub_metering_1), type="l", xlab="", ylab="Energy sub metering"))
with(hpcdata,lines(datetime, as.numeric(Sub_metering_2), col="red"))
with(hpcdata,lines(datetime, as.numeric(Sub_metering_3), col="blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
# 4 Global Reactive power
with(hpcdata,plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()
