library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("UFO Sightings in the United States"),
  sidebarPanel(
    h3('Customize this Barchart'),
    selectInput("sort", "Sort By:", list("Number Sightings"="3", "Sightings Per Capita"="6", "Sightings per Sq. Mile"="7")),
    selectInput("yourstate", "Choose a State to Highlight:", list(
  "ALABAMA"="ALABAMA",
  "ALASKA"="ALASKA",
  "ARIZONA"="ARIZONA",
  "ARKANSAS"="ARKANSAS",
  "CALIFORNIA"="CALIFORNIA",
  "COLORADO"="COLORADO",
  "CONNECTICUT"="CONNECTICUT",
  "DELAWARE"="DELAWARE",
  "DISTRICT OF COLUMBIA"="DISTRICT OF COLUMBIA",
  "FLORIDA"="FLORIDA",
  "GEORGIA"="GEORGIA",
  "HAWAII"="HAWAII",
  "IDAHO"="IDAHO",
  "ILLINOIS"="ILLINOIS",
  "INDIANA"="INDIANA",
  "IOWA"="IOWA",
  "KANSAS"="KANSAS",
  "KENTUCKY"="KENTUCKY",
  "LOUISIANA"="LOUISIANA",
  "MAINE"="MAINE",
  "MARYLAND"="MARYLAND",
  "MASSACHUSETTS"="MASSACHUSETTS",
  "MICHIGAN"="MICHIGAN",
  "MINNESOTA"="MINNESOTA",
  "MISSISSIPPI"="MISSISSIPPI",
  "MISSOURI"="MISSOURI",
  "MONTANA"="MONTANA",
  "NEBRASKA"="NEBRASKA",
  "NEVADA"="NEVADA",
  "NEW HAMPSHIRE"="NEW HAMPSHIRE",
  "NEW JERSEY"="NEW JERSEY",
  "NEW MEXICO"="NEW MEXICO",
  "NEW YORK"="NEW YORK",
  "NORTH CAROLINA"="NORTH CAROLINA",
  "NORTH DAKOTA"="NORTH DAKOTA",
  "OHIO"="OHIO",
  "OKLAHOMA"="OKLAHOMA",
  "OREGON"="OREGON",
  "PENNSYLVANIA"="PENNSYLVANIA",
  "RHODE ISLAND"="RHODE ISLAND",
  "SOUTH CAROLINA"="SOUTH CAROLINA",
  "SOUTH DAKOTA"="SOUTH DAKOTA",
  "TENNESSEE"="TENNESSEE",
  "TEXAS"="TEXAS",
  "UTAH"="UTAH",
  "VERMONT"="VERMONT",
  "VIRGINIA"="VIRGINIA",
  "WASHINGTON"="WASHINGTON",
  "WEST VIRGINIA"="WEST VIRGINIA",
  "WISCONSIN"="WISCONSIN",             
  "WYOMING"="WYOMING")),
  h6("The barchart to your right presents data regarding UFO sightings in the United States, and arranges the data in several ways. You can use the first dropdown above to control the sort of the data and arrange to see the states with the most UFO sightings, the states with the most sightings per capita, or the states with the most sightings by area. You can use the second dropdown to highlight a certain state and easily see how it compares across each of these views." ),
  
  p("Data Source:",a("Nuforc.org",href="http://www.nuforc.org/webreports/ndxloc.html"))
    
    ),
  mainPanel(
    plotOutput("barchart1")
    
    
    )
))