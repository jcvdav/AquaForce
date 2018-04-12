value_country <- function(id){
  seaaroundus::catchdata(region = "eez",
                         id = id,
                         dimension = "taxon",
                         limit = 1000,
                         measure = "value") %>% 
    janitor::clean_names() %>% 
    gather(species, Value, -years)
}