import<-read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings="?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
import$Date<-  as.Date(import$Date,"%d/%m/%Y")

myfunc <- function(x,y){import[import$Date >= x & import$Date <= y,]}

DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")

importsubset <- myfunc(DATE1,DATE2)
importsubset$DateTime<-  strptime(paste(importsubset$Date,importsubset$Time),"%Y-%m-%d %H:%M:%S")
hist(importsubset$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png",width = 480, height = 480, units = "px") 
dev.off() 


