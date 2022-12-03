#We can't see the robots.txt directly on the browser, since there is a 404 error. 
#which means that probably it was coded in the wrong way and it should be debugged.
#Since there are not robots.txt, we can proceed with the scraping.


library(tidyverse)
library(rvest)
library(httr)
library(curl)
library(here)
library(stringr)

url <- "https://beppegrillo.it/robots.txt"

#we create the function to scrape politely

  