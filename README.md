# Basketball_Reference_Site_Scraper
Programmatically scrape basketball reference for a variety of season statistics.  Written in R.

Use the function in the code to programmatically scrape season specific per game, total, per 36 minute, or per possession statistics.  When scraping multiple seasons, the data will be automatically stacked together.  The script requires you to enter the NBA seasons you want data for, and whether which data set you want to scrape (total, per 36 minutes, etc.). The script has two different outputs. One output in a csv file with all scraped data.  The second output is an R object that will be availalbe in your global enviroment in case you want to continue your analysis in R.

This script is a work in progress.  Currently the code just scrpaes the HTML tables from basketball reference.  I will be working to add a data cleansing step to this function so that the output is ready for further manipulation in R.
