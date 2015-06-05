url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="./data/electric_power_consumption.zip", method="internal", mode="wb")
EPC<-unzip("./data/electric_power_consumption.zip")
Data<-read.table(EPC, header=TRUE, stringsAsFactors=FALSE, sep=";")
View(Data)

library(dplyr)
library(lubridate)

Data<-mutate(Data, Date_time=paste(Date,Time)
Data$Date_time1<-strptime(Data$Date_time, "%d/%m/%Y %H:%M:%S") 
DATA<-subset(Data,Data$Date_time1 >= "2007-02-01 00:00:00" & Data$Date_time1 <= "2007-02-02 24:00:00")
             
DATA1<-DATA
Sys.setlocale("LC_TIME", "eng")             
DATA1$Global_active_power<-as numeric(DATA1$Global_active_power)
DATA1$Sub_metering_1<-as.numeric(DATA1$Sub_metering_1)
DATA1$Sub_metering_2<-as.numeric(DATA1$Sub_metering_2)
DATA1$Sub_metering_3<-as.numeric(DATA1$Sub_metering_3)
DATA1$Voltage<-as.numeric(DATA1$Voltage)
DATA1$Global_reactive_power<-as.numeric(DATA1$Global_reactive_power)


par(mfrow = c(2, 2), mar = c(2, 4, 2, 1),cex.lab=.7,cex.axis=.7)
with(DATA1, {
  plot(DATA1$Date_time1,DATA1$Global_active_powe, type="l",ylab="Global Active Power",xlab="")
  plot(DATA1$Date_time1,DATA1$Voltage, type="l",ylab="Voltage",xlab="datetime")
  with(DATA1,{
    plot(Date_time1, Sub_metering_1, type = "n", ylab="Energy sub metering", xlab="")
    lines(Date_time1, Sub_metering_1, col = "black")
    lines(Date_time1, Sub_metering_2, col = "red")
    lines(Date_time1, Sub_metering_3, col = "blue")
    legend("topright", lty=c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty="n",text.font=1,cex=.64)
  })
  plot(DATA1$Date_time1,DATA1$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")
})
