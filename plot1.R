power_consumption<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
for (i in 1:length(names(power_consumption))) {
  if (i == 1) power_consumption[[i]]<-as.Date(power_consumption[[i]],"%d/%m/%Y")
  else if (i == 2) power_consumption[[i]]<-strptime(power_consumption[[i]],"%H:%M:%S")
  else {
  power_consumption[[i]]<-gsub("\\?",NA,power_consumption[[i]])
  power_consumption[[i]]<-as.numeric(power_consumption[[i]])
  }
}
opt <- options("scipen" = 20)
power_consumption_small<-power_consumption[power_consumption$Date == "2007-02-01" | power_consumption$Date == "2007-02-02",]
png(file = "plot1.png")
hist(power_consumption_small$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowats)")
dev.off()