catch_country <- function(id){
  seaaroundus::catchdata(region = "eez",
                         id = id,
                         dimension = "taxon",
                         limit = 1000) %>% 
    janitor::clean_names() %>% 
    gather(species, Landings, -years)
}