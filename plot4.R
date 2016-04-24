## load data
full <-read.table("../Data/household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
full$time<-strptime(as.character(paste(full[,1],full[,2])), format="%d/%m/%Y %H:%M:%S")
head(full)
sub<-subset(full, full$time>=as.POSIXct("2007-02-01 00:00:00")&full$time<as.POSIXct("2007-02-03 00:00:00"))

## plot
png("plot4.png")
## subplot
par(mfrow=c(2,2))
## 1
plot(sub$time, sub$Global_active_power, type="l",ylab="Global Active Power", xlab="")
## 2
plot(sub$time, sub$Voltage, type="l", ylab="Voltage", xlab="datatime")
## 3
plot(sub$time, sub$Sub_metering_1, type="l",ylab="Energy sub metering", xlab="")
lines(sub$time, sub$Sub_metering_2, col="red")
lines(sub$time, sub$Sub_metering_3, col="blue")
legend("topright", lty=1, legend=c(paste("sub_metering_",1:3)), col=c("black","red","blue"),cex=0.5)
## 4
plot(sub$time, sub$Global_reactive_power, type="l", ylab="Global_ractive_power", xlab="datatime")
dev.off()