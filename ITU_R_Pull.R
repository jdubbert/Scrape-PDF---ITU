## TITLE: ITU Active Mobile-Broadvand Subscriptions per 100 Inhabitants Pull
## AUTHOR: Jake Dubbert
## DATE: February 16, 2019


## The following code scrapes the Active Mobile-Broadband Subscriptions per 100 inhabitants table from the ITU for the years 2013-2017
## and outputs into an Excel .xlsx file (mobile_broadband_IFs.xlsx).

## The pdfs are downloaded from https://www.itu.int/pub/S-POL-BROADBAND.
## IMPORTANT: that you have "weird_concordance.xlsx" in your working directory for the country concordance

## Website links for specific year reports (can enter these into the location assignment if you dont want to download each pdf)
## https://www.itu.int/dms_pub/itu-s/opb/pol/S-POL-BROADBAND.18-2017-PDF-E.pdf
## https://www.itu.int/dms_pub/itu-s/opb/pol/S-POL-BROADBAND.17-2016-PDF-E.pdf
## https://www.itu.int/dms_pub/itu-s/opb/pol/S-POL-BROADBAND.13-2015-PDF-E.pdf
## https://www.itu.int/dms_pub/itu-s/opb/pol/S-POL-BROADBAND.10-2014-PDF-E.pdf

## For a new year, all you need to do is copy the old code and change the location <- to your new pdf,
## then use locate_area(location, pages = PAGE NUMBER THAT DESIRED TABLE IS ON). This will give you coordinates
## that you add to the end of the following function in the area = list(c(YOUR COORDINATES HERE)):
## extract_tables(location, encoding = "UTF-8", pages = 84, area = list(c(106, 95.4, 780, 303.16)))
## The rest of the code should remain the same; however, you will need to double check. After running the 
## new code, you can write to an excel file with the write.xlsx() function.

## Press ctrl+shift+enter to run the entire script

############################################################################################################
## These are the packages you need to run the script. If you dont have them, you will need to download them with the download.packages() function. 
library(tabulizer)
library(rJava)
library(dplyr)
library(miniUI)
library(gtools)
library(openxlsx)
library(tidyr)

weird_conc <- read.xlsx("weird_concordance.xlsx")

############################################################################
## Mobile-broadband Subscriptions per 100 inhabitants 2017
location <- "ITU Mobile Broadband 2017.pdf"

## Locate areas of your table
## locate_areas(location, pages = 85)
## Extract table
first <- extract_tables(location, encoding = "UTF-8", pages = 84, area = list(c(106, 95.4, 780, 303.16)))
f_table <- as.data.frame(do.call(rbind, first))
f_table <- f_table[-1,]
f_table <- f_table[,-1]
names(f_table)[names(f_table)=="V2"] <- "country"
names(f_table)[names(f_table)=="V3"] <- "value"

second <- extract_tables(location, encoding = "UTF-8", pages = 84, area = list(c(106, 318.6, 773.4, 539.6)))
s_table <- as.data.frame(do.call(rbind, second))
s_table <- s_table[-1,]
s_table <- s_table[,-1]
names(s_table)[names(s_table)=="V2"] <- "country"
names(s_table)[names(s_table)=="V3"] <- "value"

third <- extract_tables(location, encoding = "UTF-8", pages = 85, area = list(c(86.1,64.5,660.7,276.64)))
t_table <- as.data.frame(do.call(rbind, third))
t_table <- t_table[-1,]
t_table <- t_table[,-1]
names(t_table)[names(t_table)=="V2"] <- "country"
names(t_table)[names(t_table)=="V3"] <- "value"

fourth <- extract_tables(location, encoding = "UTF-8", pages = 85, area = list(c(77.4,289.9,660.7,490.98)))
fo_table <- as.data.frame(do.call(rbind, fourth))
fo_table <- fo_table[-1,]
fo_table <- fo_table[,-1]
names(fo_table)[names(fo_table)=="V2"] <- "country"
names(fo_table)[names(fo_table)=="V3"] <- "value"

mobile_2017 <- rbind(f_table, s_table, t_table, fo_table)
mobile_2017$year <- 2017

######################################################################
## Mobile-broadband Subscriptions per 100 inhabitants 2016
location <- "ITU Mobile Broadband 2016.pdf"

## Locate areas of your table
## locate_areas(location, pages = 93)
## Extract table
first <- extract_tables(location, encoding = "UTF-8", pages = 92, area = list(c(99.4,93.2,784.4,316.4)))
f_table <- as.data.frame(do.call(rbind, first))
f_table <- f_table[-1,]
f_table <- f_table[,-1]
names(f_table)[names(f_table)=="V2"] <- "country"
names(f_table)[names(f_table)=="V3"] <- "value"

second <- extract_tables(location, encoding = "UTF-8", pages = 92, area = list(c(97,316.4,784.4,544)))
s_table <- as.data.frame(do.call(rbind, second))
s_table <- s_table[-1,]
s_table <- s_table[,-1]
names(s_table)[names(s_table)=="V2"] <- "country"
names(s_table)[names(s_table)=="V3"] <- "value"

third <- extract_tables(location, encoding = "UTF-8", pages = 93, area = list(c(72.9,60,654,276.6)))
t_table <- as.data.frame(do.call(rbind, third))
t_table <- t_table[-1,]
t_table <- t_table[,-1]
names(t_table)[names(t_table)=="V2"] <- "country"
names(t_table)[names(t_table)=="V3"] <- "value"

fourth <- extract_tables(location, encoding = "UTF-8", pages = 93, area = list(c(83.9,287.6,662.9,502)))
fo_table <- as.data.frame(do.call(rbind, fourth))
fo_table <- fo_table[-1,]
fo_table <- fo_table[,-1]
names(fo_table)[names(fo_table)=="V2"] <- "country"
names(fo_table)[names(fo_table)=="V3"] <- "value"

mobile_2016 <- rbind(f_table, s_table, t_table, fo_table)
mobile_2016$year <- 2016

###############################################################
## Mobile-broadband Subscriptions per 100 inhabitants 2015
location <- "ITU Mobile Broadband 2015.pdf"

## Locate areas of your table
## locate_areas(location, pages = 95)
## Extract table
first <- extract_tables(location, encoding = "UTF-8", pages = 94, area = list(c(101.6,99.9,784.5,316.4)))
f_table <- as.data.frame(do.call(rbind, first))
f_table <- f_table[-1,]
f_table <- f_table[,-1]
names(f_table)[names(f_table)=="V2"] <- "country"
names(f_table)[names(f_table)=="V3"] <- "value"

second <- extract_tables(location, encoding = "UTF-8", pages = 94, area = list(c(99.4,323,777.8,526.3)))
s_table <- as.data.frame(do.call(rbind, second))
s_table <- s_table[-1,]
s_table <- s_table[,-1]
names(s_table)[names(s_table)=="V2"] <- "country"
names(s_table)[names(s_table)=="V3"] <- "value"

third <- extract_tables(location, encoding = "UTF-8", pages = 95, area = list(c(77.4,64.5,777.8,281)))
t_table <- as.data.frame(do.call(rbind, third))
t_table <- t_table[-1,]
t_table <- t_table[,-1]
names(t_table)[names(t_table)=="V2"] <- "country"
names(t_table)[names(t_table)=="V3"] <- "value"

fourth <- extract_tables(location, encoding = "UTF-8", pages = 95, area = list(c(83.99,285.48,685,497.6)))
fo_table <- as.data.frame(do.call(rbind, fourth))
fo_table <- fo_table[-1,]
fo_table <- fo_table[,-1]
names(fo_table)[names(fo_table)=="V2"] <- "country"
names(fo_table)[names(fo_table)=="V3"] <- "value"

mobile_2015 <- rbind(f_table, s_table, t_table, fo_table)
mobile_2015$year <- 2015

####################################################################
## Mobile-broadband Subscriptions per 100 inhabitants 2014
location <- "ITU Mobile Broadband 2014.pdf"

## Locate areas of your table
## locate_areas(location, pages = 89)
## Extract table
first <- extract_tables(location, encoding = "UTF-8", pages = 88, area = list(c(64.88,38,771.6,327.3)))
f_table <- as.data.frame(do.call(rbind, first))
f_table <- f_table[-1,]
f_table <- f_table[,-1]
names(f_table)[names(f_table)=="V2"] <- "country"
names(f_table)[names(f_table)=="V3"] <- "value"

second <- extract_tables(location, encoding = "UTF-8", pages = 88, area = list(c(66,298.7,770.3,548.4)))
s_table <- as.data.frame(do.call(rbind, second))
s_table <- s_table[-1,]
s_table <- s_table[,-1]
names(s_table)[names(s_table)=="V2"] <- "country"
names(s_table)[names(s_table)=="V3"] <- "value"

third <- extract_tables(location, encoding = "UTF-8", pages = 89, area = list(c(53,44.6,766.8,314)))
t_table <- as.data.frame(do.call(rbind, third))
t_table <- t_table[-1,]
t_table <- t_table[,-1]
names(t_table)[names(t_table)=="V2"] <- "country"
names(t_table)[names(t_table)=="V3"] <- "value"

fourth <- extract_tables(location, encoding = "UTF-8", pages = 89, area = list(c(53,316.4,744.7,570.5)))
fo_table <- as.data.frame(do.call(rbind, fourth))
fo_table <- fo_table[-1,]
fo_table <- fo_table[,-1]
names(fo_table)[names(fo_table)=="V2"] <- "country"
names(fo_table)[names(fo_table)=="V3"] <- "value"

mobile_20141 <- rbind(s_table, t_table)
mobile_20142 <- rbind(fo_table, f_table)
mobile_20142$fvalue <- do.call(paste, c(mobile_20142[c("value", "V4")], sep=""))
mobile_20142 <- mobile_20142[,-c(2:3)]
names(mobile_20142)[names(mobile_20142)=="fvalue"] <- "value"

mobile_2014 <- rbind(mobile_20141, mobile_20142)
mobile_2014$year <- 2014

mobile_2014 <- merge(mobile_2014, weird_conc, by = "country", all = TRUE)
mobile_2014 <- mobile_2014[-c(196:228),]
mobile_2014 <- mobile_2014[,-1]
mobile_2014 <- mobile_2014[,c(3,1,2)]
names(mobile_2014)[names(mobile_2014)=="Country"] <- "country"
mobile_2014 <- mobile_2014 %>% drop_na()


#############################################################
## Mobile-broadband Subscriptions per 100 inhabitants 2013
location <- "ITU Mobile Broadband 2013.pdf"

## Locate areas of your table
## locate_areas(location, pages = 99)
## Extract table
first <- extract_tables(location, encoding = "UTF-8", pages = 98, area = list(c(64,40.2,755.8,294.4)))
f_table <- as.data.frame(do.call(rbind, first))
f_table <- f_table[-1,]
f_table <- f_table[,-1]
f_table <- f_table[,-4]
names(f_table)[names(f_table)=="V2"] <- "country"
names(f_table)[names(f_table)=="V3"] <- "value"

second <- extract_tables(location, encoding = "UTF-8", pages = 98, area = list(c(61.9,292.2,766.8,550.7)))
s_table <- as.data.frame(do.call(rbind, second))
s_table <- s_table[-1,]
s_table <- s_table[,-1]
s_table <- s_table[,-4]
names(s_table)[names(s_table)=="V2"] <- "country"
names(s_table)[names(s_table)=="V3"] <- "value"

third <- extract_tables(location, encoding = "UTF-8", pages = 99, area = list(c(70.8,51.3,758,318.7)))
t_table <- as.data.frame(do.call(rbind, third))
t_table <- t_table[-1,]
t_table <- t_table[,-1]
t_table <- t_table[,-4]
names(t_table)[names(t_table)=="V2"] <- "country"
names(t_table)[names(t_table)=="V3"] <- "value"

fourth <- extract_tables(location, encoding = "UTF-8", pages = 99, area = list(c(66.3,309.8,751.4,570.6)))
fo_table <- as.data.frame(do.call(rbind, fourth))
fo_table <- fo_table[-1,]
fo_table <- fo_table[,-1]
fo_table <- fo_table[,-4]
names(fo_table)[names(fo_table)=="V2"] <- "country"
names(fo_table)[names(fo_table)=="V3"] <- "value"

mobile_2013 <- rbind(f_table, s_table, t_table, fo_table)
mobile_2013$year <- 2013

mobile_2013 <- merge(mobile_2013, weird_conc, by = "country", all = TRUE)
mobile_2013 <- mobile_2013[-c(196:226),]
mobile_2013$nvalue <- do.call(paste, c(mobile_2013[c("value", "V4")], sep=""))
mobile_2013 <- mobile_2013[,-c(2:3)]
mobile_2013 <- mobile_2013[,-1]
mobile_2013 <- mobile_2013[,c(2,3,1)]
names(mobile_2013)[names(mobile_2013)=="nvalue"] <- "value"
names(mobile_2013)[names(mobile_2013)=="Country"] <- "country"
mobile_2013 <- mobile_2013 %>% drop_na()

#########################################################################
# Get all mobile data and export to Excel
## The pdf for the years 2013 and 2014 are read in weird so need to be wrote to xlsx file seperately and merged in excel.
all_mobile <- rbind(mobile_2017, mobile_2016, mobile_2015, mobile_2014,mobile_2013)
write.xlsx(all_mobile, "mobile_broadband_IFs.xlsx")



