#we download the URL and store it into the pc
url2 <- c("https://beppegrillo.it/category/archivio/2016/",
          str_c("https://beppegrillo.it/category/archivio/2016/page/", 1:47))

download_politely <- function(from_url, to_html, my_email, my_agent = R.Version()$version.string)
{
  
  require(httr)
  
  # Check that arguments are inputted as expected:
  stopifnot(is.character(from_url))
  stopifnot(is.character(to_html))
  stopifnot(is.character(my_email))
  
  # GET politely
  grillo_16 <- httr::GET(url = from_url, 
                         add_headers(
                           From = my_email, 
                           `User-Agent` = R.Version()$version.string
                         )
  )
  # If status == 200, extract content and save to a file:
  if (httr::http_status(grillo_16)$message == "Success: (200) OK") {
    bin <- content(grillo_16, as = "raw")
    writeBin(object = bin, con = to_html)
  } else {
    cat("Houston, we have a problem!")
  }
}
#we inspcted with selector gudget the first page, selecting only the main titles. 
library("tidyverse"); library("rvest")
read_html("https://beppegrillo.it/category/archivio/2016/") %>% 
  html_elements(css = ".td_module_10 a") %>%
  html_text()

url2 <- "https://beppegrillo.it/category/archivio/2016/page/"
i <- 1
for (i in url2[1:47]){
  vector <- read_html(url2[i]) %>%
    html_elements(css = ".td_module_10 a") %>%
    html_text() %>%

  Sys.sleep(0.5)
}

#if a page contains no text, it tells us that " NA does not exist in the current working directory



library(stringr)
url <- "https://beppegrillo.it/category/archivio/2016/"
email <- "gianlucazaccaro7@gmail.com"
user_agent <- R.Version()$version.string
archivedwl <- RCurl::getURL(url, 
                         httpheader = c(From = email, `User-Agent` = user_agent))
linkss <- str_c("https://beppegrillo.it/category/archivio/2016/page/", 1:47)
dir.create("grillo_linkpages")
# If status == 200, extract content and save to a file:
if (httr::http_status(archivedwl)$message == "Success: (200) OK") {
  take <- content(archivedwl, as = "raw")
  writeBin(object = bin, con = to_html)
} else {
  cat("Houston, we have a problem!")
}

download_politely <- function(from_url, to_html, my_email, my_agent = R.Version()$version.string)
for (i in seq_along(link)) {
  cat(i, " ")
  
  download_politely(from_url = linkss[i], 
                    to_html = here::here("grillo_linkpages", str_c("page_",i,".html")), 
                    my_email = "gianlucazaccaro7@gmail.com")
  
  Sys.sleep(0.5)
}

to_scrape <- list.files(here::here("grillo_linkpages"), full.names = TRUE)    
all_title <- vector(mode = "list", length = length(to_scrape))

for (i in seq_along(all_title)){
  all_title[[i]] <- read_html(to_scrape[i]) %>% 
    html_elements(css = ".td_module_10 .td-module-title") %>% 
    html_text(trim = TRUE)
}

all_link <- vector(mode = "list", length = length(to_scrape)) 


for (i in seq_along(all_link)){
  all_link[[i]] <- XML::getHTMLLinks(to_scrape[i], externalOnly = T)
}
all_link <- unlist(all_link)
all_link

post2016 <- str_extract_all(all_link, pattern = "https://beppegrillo\\.it/[^category][^jpg].+")
post2016 <- unlist(post2016)
post2016 <- tibble(post2016)
post2016 <- distinct(post2016)

library(rvest)
library(stringr)
text_scrape <- list.files(here::here("link_post2016"), full.names = TRUE)

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
