#Download,unzip and read the data; 
hpcdata<-read.csv(file='household_power_consumption.txt' ,sep=';',header=TRUE, stringsAsFactors = FALSE, na.strings= "?", strip.white=TRUE)
#convert the format of the date
hpcdata$Date<-as.Date(hpcdata$Date, format="%d/%m/%Y")
#use only the required data from 2007-02-01 to 2007-02-02
hpcdata<-subset(hpcdata,subset = (hpcdata$Date =='2007-02-01' | hpcdata$Date =='2007-02-02'))
#plot and save it to a png file with width of 480 pixels and height of 480 pixels
png("plot1.png", width = 480, height = 480)
hist(hpcdata$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
