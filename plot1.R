## load data
full <-read.table("../Data/household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
full$time<-strptime(as.character(paste(full[,1],full[,2])), format="%d/%m/%Y %H:%M:%S")
head(full)
sub<-subset(full, full$time>=as.POSIXct("2007-02-01 00:00:00")&full$time<as.POSIXct("2007-02-03 00:00:00"))

## plot
png("plot1.png")
hist(sub$Global_active_power,col="red",xlab="Golbal Active Power (kilowatts)", main="Global Active Power")
dev.off()
