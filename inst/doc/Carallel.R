## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----caRa---------------------------------------------------------------------
library(caRamel)

## ----kursawe1-----------------------------------------------------------------
kursawe <- function(i) {
  k1 <- -10 * exp(-0.2 * sqrt(x[i,1] ^ 2 + x[i,2] ^ 2)) - 10 * exp(-0.2 * sqrt(x[i,2] ^2 + x[i,3] ^ 2))
  k2 <- abs(x[i,1]) ^ 0.8 + 5 * sin(x[i,1] ^ 3) + abs(x[i,2]) ^ 0.8 + 5 * sin(x[i,2] ^3) + abs(x[i,3]) ^ 0.8 + 5 * sin(x[i,3] ^ 3)
  return(c(k1, k2))
}

## ----kursawe2-----------------------------------------------------------------
kursawe <- function(x) { # receipt of the entire population
  popsize <- dim(x)[1] # size of the population to evaluate
  nobj <- 2 # number of objectives
  results <- matrix(0, nrow = popsize, ncol = nobj) # matrix of results
  for(i in 1:popsize){
      k1 <- -10 * exp(-0.2 * sqrt(x[i,1] ^ 2 + x[i,2] ^ 2)) - 10 * exp(-0.2 * sqrt(x[i,2] ^2 + x[i,3] ^ 2))
      k2 <- abs(x[i,1]) ^ 0.8 + 5 * sin(x[i,1] ^ 3) + abs(x[i,2]) ^ 0.8 + 5 * sin(x[i,2] ^3) + abs(x[i,3]) ^ 0.8 + 5 * sin(x[i,3] ^ 3)
      results[i,] <- c(k1, k2)
  }
  return(results)
}

