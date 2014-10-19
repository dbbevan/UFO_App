library(shiny)

#setwd("C://Users//Ben//SkyDrive//Documents//Certifications and training//Data Science Specialization//9 - Developing Data Products//UFO - App")
ufo<-read.csv("data/UFO.csv")

#create list of names for varibles to be created
myNames<-c(names(ufo), "Sightings_Per_100,000_people", "Sightings_Per_1000_Square_Miles")

#calculate sightings per capita and sightings per square mile and add to data frame
ufo<-cbind(ufo,
           ufo$UFO_Sightings/(ufo$Population/100000),
           ufo$UFO_Sightings/(ufo$Square_Miles/1000)
) 

#rename variables
names(ufo)<-myNames

#set palette
col.topo <- topo.colors(4)
palette(col.topo)




shinyServer(
  function(input, output)
  {
    output$oid1 <- renderPrint({input$sort})
    
    output$oid2 <- renderPrint({input$yourstate})
    
    output$barchart1 <-renderPlot({
      SortedTable<-ufo[order(-ufo[,as.numeric(input$sort)]), c(1,2,as.numeric(input$sort))]
      
      #create colors for plot and rank number for display on plot
      colState<-rep("black", length(SortedTable$State))
      colRank<-rep("", length(SortedTable$State))
      colState[which(SortedTable[,1]==input$yourstate)]<-"red"
      colRank[which(SortedTable[,1]==input$yourstate)]<-paste0("(", which(SortedTable[,1]==input$yourstate), ")", sep="")
      
      #create plot
      x<-barplot(SortedTable[,3], xaxt="n", col=SortedTable$Region, main=colnames(ufo)[as.numeric(input$sort)])
      labs<-paste(" ", colRank, SortedTable$State, sep=" ")
      legend("topright", levels(SortedTable$Region), fill=col.topo)
      text(cex=.75, x=x-.75, y=-5, labs, xpd=NA, srt=270, pos=4, col=colState)})
  
  }  
)


