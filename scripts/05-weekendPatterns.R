#Creates a weekend/weekday flag
dtaNoNAs <- dtaNoNAs %>% mutate(weekend = ifelse(wday(date)==1|wday(date)==7,'Weekend','Weekday'))

#Separetes the data for intervals
intervalMeans <- aggregate(dtaNoNAs$steps, by = list(dtaNoNAs$weekend,dtaNoNAs$interval), mean,na.rm=TRUE)
names(intervalMeans) <- c('Weekend','Interval','Mean')


#If in RStudio, copy this function call to the terminal
qplot(data= intervalMeans,
      x= Interval,
      y= Mean,
      geom= 'line', 
      xlab = 'Interval',
      ylab = 'Average of Steps',
      color=I("black"),
      alpha=I(.3),
      facets = ~Weekend)

#Search for all intervals where the average of steps is equal to the maximum average value.
print(filter(intevalDta, Mean==max(Mean)))
