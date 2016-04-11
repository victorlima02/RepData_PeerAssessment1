#Aggregates steps per day
stepsPerDay <- aggregate(dta$steps, by = list(dta$date), sum, na.rm=TRUE) 
names(stepsPerDay) <- c("Date", "Steps")

#Creates the summary about the data, ignoring NAs
stepsPerDay.summary <- summary(stepsPerDay$Steps)

#If in RStudio, copy this function call to the terminal
qplot(Steps, 
      data = stepsPerDay, 
      geom="histogram", 
      xlab = "Steps per day",
      binwidth = 1000,
      fill=I("blue"),
      col=I("black"),
      alpha=I(.3))
