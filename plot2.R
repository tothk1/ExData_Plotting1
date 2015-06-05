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
DATA1$Global_reactive_power<-as.numeric(DATA1$Global_reactive_power)
Sys.setlocale("LC_TIME", "eng")
par(mfrow = c(1,1), mar = c(4, 4, 2, 1),cex.lab=.7,cex.axis=.7, cex.main=0.8)
plot(DATA1$Date_time1,DATA1$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png, filename = 'plot2.png', width = 480, height = 480)
dev.off()