dataDirectory <-'data'
dataFile <- file.path(dataDirectory,'activity.csv')
rawDataFile <- 'activity.zip'

#Verify the existence of our data dataDirectory
if(!dir.exists(dataDirectory)){
	dir.create(dataDirectory)
}

if(!file.exists(dataFile) && file.exists(rawDataFile))
	unzip(zipfile=rawDataFile,exdir=dataDirectory)

dta <- read.csv(dataFile,colClasses = c("numeric","Date","numeric"))