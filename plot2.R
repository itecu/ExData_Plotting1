power_consumption<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
power_consumption[[1]]<-as.Date(power_consumption[[1]],"%d/%m/%Y")
power_consumption_small<-power_consumption[power_consumption$Date == "2007-02-01" | power_consumption$Date == "2007-02-02",]
for (i in 2:length(names(power_consumption_small))) {
   if (i == 2) {
    power_consumption_small[[i]]<-mapply(paste,power_consumption_small[[1]],levels(power_consumption_small[[i]]))
    power_consumption_small[[i]]<-strptime(power_consumption_small[[i]],"%Y-%m-%d %H:%M:%S")
  }
  else {
    power_consumption_small[[i]]<-gsub("\\?",NA,power_consumption_small[[i]])
    power_consumption_small[[i]]<-as.numeric(power_consumption_small[[i]])
  }
}
opt <- options("scipen" = 20)
png(file = "plot2.png")
plot(y = power_consumption_small$Global_active_power,x = power_consumption_small$Time,type="s",xlab = "",ylab="Global Active Power (kilowats)" )
dev.off()