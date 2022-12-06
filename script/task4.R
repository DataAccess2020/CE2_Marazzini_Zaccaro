#we created a character vector, as a string character containing all the links of the 47 pages
url2 <- str_c("https://beppegrillo.it/category/archivio/2016/page/", 1:47)

#created a function for storing the urls into our local
download_politely <- function(from_url, to_html, my_email, my_agent = R.Version()$version.string)
{
  
  require(httr)
  
  #ensuring that we get only characters
  stopifnot(is.character(from_url))
  stopifnot(is.character(to_html))
  stopifnot(is.character(my_email))
  
  # GET politely function
  grillolinks <- httr::GET(url = from_url, 
                         add_headers(
                           From = my_email, 
                           `User-Agent` = R.Version()$version.string
                         )
  )
  if (httr::http_status(grillolinks)$message == "Success: (200) OK") {
    bin <- content(grillolinks, as = "raw")
    writeBin(object = bin, con = to_html)
  } else {
    cat("mayday")
  }
}


#we do the download of the 47 pages in our local 
dir.create("grillolinks2")

for (i in seq_along(url2)) {
  cat(i, " ")
  download_politely(from_url = url2[i], 
                    to_html = here::here("grillolinks2", str_c("page_",i,".html")), 
                    my_email = email)
  
  Sys.sleep(0.5)  # We use a sys.sleep of 0.5 seconds to download politely
}



#for each page, we scraped the main text. 
for (i in seq_along(url2)){
  vector <- read_html(here::here("grillolinks2", str_c("page_",i,".html"))) %>%
    html_elements(css = ".td_module_10 a") %>%  #SelectorGadget selects only the titles
    html_text(trim = F)
  text <- append(text, vector)
  text <- unique(unlist(text))
}

text




