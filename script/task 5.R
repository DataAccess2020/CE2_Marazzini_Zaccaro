#RCRAWLER -----
#1. What does it mean to crawl?
#What we have done for this assignment was to scrape a web page to collect data.
#Crawling, instead, means to automatically collect URL from a starting point. 
#Rcrawler is a special packege for R, which enables these two activites at the same time.
#So, with this package people are able to crawl and scrape at the same time.

#2. What is a web spider?
#A web spider is a bot of a search engine that anayzes the web and creates 
#a map of the websites following the hyperlinks. In fact, they are called spiders
#because this process recalls the spider that creates its net. 

#3. How is this different from a scraper you have built at point 5? 
#It was different because we scraped a single page, which was of our interest.
#Instead, the crawling is an always-on process on the web and it doesn't take
#into consideration a specific page, but all the pages linked with one another through
#the hyperlinks. 

#4.Inspect the package documentation and sketch how you could build a spider scraper:
# which function(s) should you use? With which arguments?
#Rclawer can crawl the whole webpage and scrape the content in an automatically way.
#You just need to provide the website URL and the CSS
Rcrawler(Website, no_cores, no_conn, MaxDepth, DIR, RequestsDelay = 0,
         Obeyrobots = FALSE, Useragent, use_proxy = NULL, Encod,
         Timeout = 5, URLlenlimit = 255, urlExtfilter, dataUrlfilter,
         crawlUrlfilter, crawlZoneCSSPat = NULL, crawlZoneXPath = NULL,
         ignoreUrlParams, ignoreAllUrlParams = FALSE, KeywordsFilter,
         KeywordsAccuracy, FUNPageFilter, ExtractXpathPat, ExtractCSSPat,
         PatternsNames, ExcludeXpathPat, ExcludeCSSPat, ExtractAsText = TRUE,
         ManyPerPattern = FALSE, saveOnDisk = TRUE, NetworkData = FALSE,
         NetwExtLinks = FALSE, statslinks = FALSE, Vbrowser = FALSE,
         LoggedSession)
