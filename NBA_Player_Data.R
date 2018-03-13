
#names must be entered last, first
NBA_Player_Stats <- function(names){
  require(rvest)
  require(stringr)
  require(dplyr)

  player.data <- data.frame()
  
  for(i in 1:length(names)){
  
    last_name <- str_to_lower(str_split(names[i], ", ", simplify=T)[1])
    first_name <-str_to_lower(str_split(names[i], ", ", simplify=T)[2])
    
    URL <- paste0("https://www.basketball-reference.com/players/", str_sub(last_name, 1, 1), "/" ,
                 ifelse(str_length(last_name) < 5, str_sub(last_name, 1, str_length(last_name)), 
                 str_sub(last_name, 1, 5)), 
                 str_sub(first_name, 1, 2),
                "01.html")

  player <- URL %>%
    read_html() %>%
    html_nodes("table") %>%
    html_table() %>%
    as.data.frame() %>%
    mutate(Name = names[i])
  
  player.data <- rbind(player.data, player)
  }
  total <<- player.data
}

play <- c("Embiid, Joel", "James, Lebron", "Wade, Dwayne")

NBA_Player_Stats(names = play)
