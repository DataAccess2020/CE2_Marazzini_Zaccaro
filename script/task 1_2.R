#We can't see the robots.txt directly on the browser, since there is a 404 error. 
#which means that probably it was coded in the wrong way and it should be debugged.
#Since there are not robots.txt, we can proceed with the scraping.

#preparation 
library(tidyverse)
library(rvest)
library(httr)
library(curl)
library(here)
library(stringr)
install.packages("RCurl")
library(RCurl)

#now we download the page
url <- "https://beppegrillo.it/un-mare-di-plastica-ci-sommergera/"
email <- "gianlucazaccaro7@gmail.com"
user_agent <- R.Version()$version.string
sitedwl <- RCurl::getURL(url, 
                  httpheader = c(From = email, `User-Agent` = user_agent))



  