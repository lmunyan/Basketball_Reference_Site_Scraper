#metric options: per_game, totals, per_minute, per_poss, advanced
NBA_Leaders <- function(year, metric){
  #read in required packages
  require(data.table)
  require(rvest)
  require(dplyr)
  
  #initiate blank dataframe for loop
  combined <- data.frame()
  
  #loop for scraping basketball reference and binding all years together
  for(i in 1: length(year)){
  
  URL<-paste0("https://www.basketball-reference.com/leagues/NBA_", year[i], "_", metric, ".html")
  
  #scrape site using rvest, and chain with dplyr 
  test<- URL %>%
    read_html() %>%
    html_nodes("table") %>%
    html_table() %>%
    as.data.frame() %>%
    mutate(Year = year[i])
  
  combined <- rbind(combined, test)
  }
  #write output to a csv file
  fwrite(combined, paste0("NBA_", year[1], "_", year[length(year)], "_", metric, ".csv"))
  
  #write the data frame to global enviroment for further manipulation
  combined <<- combined
}

#watch the function in action
NBA_Leaders(year= 2012:2016, metric = "per_minute")