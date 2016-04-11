#The total number of missing values in the dataset
countNA <- sum(is.na(dta$steps))

#Replace all NAs with the mean of steps on a inteval
dtaNoNAs <- dta %>% mutate(
	steps = ifelse(
		is.na(steps),
		tapply(dtaNoNAs$steps, dtaNoNAs$interval, mean, na.rm = TRUE),
		steps)
	)


#Aggregates steps per day
stepsPerDay <- aggregate(dtaNoNAs$steps, by = list(dtaNoNAs$date), sum, na.rm=TRUE) 
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