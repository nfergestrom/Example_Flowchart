#Load Packages
library(tidyverse)
library(glue)
library(XML)

#Load flowchart
flow_chart <- XML::xmlParseDoc("./template_flowchart.drawio")
flow_chart_c <- as(flow_chart, "character")

#Create dummies to populate later
All <- 50
AA <- 19
BB <- 11
CC <- 20

#Populate dummies
All <- length(unique(row.names(mtcars)))

AA_dat <- mtcars %>%
  filter(cyl == 4)
AA <- as.numeric(summarize(AA_dat, all = n_distinct(row.names(AA_dat))))

BB_dat <- mtcars %>%
  filter(cyl == 6)
BB <- as.numeric(summarize(BB_dat, all = n_distinct(row.names(BB_dat))))

CC_dat <- mtcars %>%
  filter(cyl == 8)
CC <- as.numeric(summarize(CC_dat, all = n_distinct(row.names(CC_dat))))


#Output flowchart
flowchart_cg <- glue(flow_chart_c) 
flowchart_cg %>%  
  xmlParseDoc(asText = T) %>%
  saveXML(file = "./Output/mtcars_flowchart.xml") 