#we put the 47 pages into a character vector
library(stringr)

url2 <- c("https://beppegrillo.it/category/archivio/2016/",
         str_c("https://beppegrillo.it/category/archivio/2016/page/", 1:47))

#we downloaded the articles for the first page
library(rvest)
link <- read_html(url2) %>%
  html_elements(css = ".td_module_10 a") %>% 
  html_elements("a") %>%   
  html_attr("href")   

#now we iterate the operation for all the 47 pages
i <- 1
for (i in url2[1:47]){
  vector <- read_html(url2[i]) %>%
    html_elements(css = ".td_module_10 a") %>%
    html_attr(name = "href")

  Sys.sleep(0.5)
}
