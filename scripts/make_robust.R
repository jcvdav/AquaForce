make_robust <- function(model, type = "HC2", cluster = "genus"){
  model %>% 
    lmtest::coeftest(sandwich::vcovHC(., type = type), cluster = cluster) %>% 
    broom::tidy() -> new_test
  
  robust_se <- new_test$std.error
  names(robust_se) <- new_test$term
  
  return(robust_se)
}