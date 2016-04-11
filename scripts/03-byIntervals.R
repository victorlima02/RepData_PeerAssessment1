#Separetes the data for intervals
intervalMeans <- aggregate(dta$steps, by = list(dta$interval), mean, na.rm=TRUE)
names(intervalMeans)<-c('Interval','Mean')

intervalMedians <- aggregate(dta$steps, by = list(dta$interval), median, na.rm=TRUE)
names(intervalMedians)<-c('Interval','Median')

intevalDta <- merge(intervalMeans,intervalMedians, by = 'Interval')

#If in RStudio, copy this function call to the terminal
qplot(data= intevalDta,
      x= Interval,
      y= Mean,
      geom= 'line', 
      xlab = 'Interval',
      ylab = 'Average of Steps',
      color=I("black"),
      alpha=I(.3))

#Search for all intervals where the average of steps is equal to the maximum average value.
print(filter(intevalDta, Mean==max(Mean)))