#metric options: per_game, totals, per_minute, per_poss, advanced, ratings

#Entering per_game will scrape a player's per game metrics; totals will pull a player's total raw statistics ie 585 rebounds; per_minute gives you player statistics per 36 minutes; advanced pulls the advanced metrics for all active players that season; entering ratings gives you team level data and is the only option for the metric function that will provide you team level statistics

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

#metric options: per_game, totals, per_minute, per_poss, advanced, ratings
NBA_Leaders(year= 2012:2016, metric = "per_minute")
