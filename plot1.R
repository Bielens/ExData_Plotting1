## Download and load the data
source("loaddata.R")

with(hpc,hist(
  Global_active_power,
  col="red",
  xlab="Global Active Power (kilowatts)",
  main="Global Active Power"
))

dev.copy(png, "plot1.png",width=480, height=480)
dev.off()

