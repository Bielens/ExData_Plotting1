## Download and load the data
source("loaddata.R")

hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")

## We need the labels to match exactly, so set locale to en_US
Sys.setlocale("LC_TIME", locale="en_US")

png("plot4.png",width=480, height=480)

par(mfrow=c(2,2))

with(hpc, {
  ## top left sub-plot
  plot(DateTime,
       Global_active_power,
       type="l",
       ylab="Global Active Power (KiloWatts)",xlab="");
  ## top right sub-plot
  plot(DateTime,
       Voltage,
       type="l",
       ylab="Voltage",xlab="datetime");
  ## bottom left sub-plot
  plot(DateTime,
       Sub_metering_1,
       type="l",
       ylab="Energy Sub Metering",
       xlab="");
  lines(DateTime,Sub_metering_2,col="red");
  lines(DateTime,Sub_metering_3,col="blue");
  legend("topright",
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),
         lty=1,
         bty="n");
  ## bottom right sub-plot
  plot(DateTime,
       Global_reactive_power,
       type="l",
       xlab="datetime")})

dev.off()

