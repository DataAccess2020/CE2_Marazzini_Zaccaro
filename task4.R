#we put the 47 pages into a character vector
library(stringr)

url2 <- c("https://beppegrillo.it/category/archivio/2016/",
         str_c("https://beppegrillo.it/category/archivio/2016/page/", 1:47))

#we downloaded the articles for the first page
library(rvest)
link <- read_html("https://beppegrillo.it/category/archivio/2016/") 
selector <- html_elements(x=link, 
                          css = ".td_module_10 a") 

#now we iterate the operation for all the 47 pages
