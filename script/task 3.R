#SCRAPING -----
#Now we download the html in our local
download.file(url, destfile = here::here("mareplastica.html")) 

install.packages("XML")
library(XML)

#scraping the links we need from the HTML file
html_links <- XML::getHTMLLinks(here::here("mareplastica.html"))

#Regular expression to select the links collected to the blog related to posts
blog_links <- (stringr::str_extract(html_links, pattern = "^https://beppegrillo\\.it/[^category].+[^jpg]"))
blog_links

#Now we remove the NAs links
blog_links <- na.omit(blog_links)

#now we remove the duplicates
blog_links <- unique(unlist(strsplit(blog_links, " ")))

#now we create the data frame
dataframe <- data.frame(blog_links)
dataframe

