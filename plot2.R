## Download and load the data
source("loaddata.R")

hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")

## We need the labels to match exactly, so set locale to en_US
Sys.setlocale("LC_TIME", locale="en_US")

png("plot2.png",width=480, height=480)

with(hpc, plot(
  DateTime,
  Global_active_power,
  type="l",
  ylab="Global Active Power (KiloWatts)",xlab=""))

dev.off()

