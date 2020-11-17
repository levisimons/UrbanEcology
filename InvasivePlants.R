rm(list=ls())

setwd("/Users/levisimons/Desktop/InvasivePlants/")

#Read in plant observation data from GBIF.
input <- read.table("OriginalPlantData.csv", header=T, sep=",",as.is=T,skip=0,fill=T,quote="\"",check.names=F,encoding = "UTF-8")

#Read in invasive plant species list.
InvasivePlants <- read.table("InvasivePlants.csv", header=T, sep=",",as.is=T,skip=0,fill=T,quote="\"",check.names=F,encoding = "UTF-8")
InvasivePlants <- InvasivePlants$ScientificName

#Read in native plant species list.
NativePlants <- read.table("NativePlants.csv", header=T, sep=",",as.is=T,skip=0,fill=T,quote="\"",check.names=F,encoding = "UTF-8")
NativePlants <- NativePlants$ScientificName

#Filter plant observations to only contain invasives.
InvasiveObservations <- input[input$verbatimScientificName %in% InvasivePlants,]

#Filter plant observations to only contain natives.
NativeObservations <- input[input$verbatimScientificName %in% NativePlants,]
