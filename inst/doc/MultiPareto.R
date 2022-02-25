## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----caRa---------------------------------------------------------------------
library(caRamel)

## ----kursawe------------------------------------------------------------------
kursawe <- function(i) {
  k1 <- -10 * exp(-0.2 * sqrt(x[i,1] ^ 2 + x[i,2] ^ 2)) - 10 * exp(-0.2 * sqrt(x[i,2] ^2 + x[i,3] ^ 2))
  k2 <- abs(x[i,1]) ^ 0.8 + 5 * sin(x[i,1] ^ 3) + abs(x[i,2]) ^ 0.8 + 5 * sin(x[i,2] ^3) + abs(x[i,3]) ^ 0.8 + 5 * sin(x[i,3] ^ 3)
  return(c(k1, k2))
}

## ----parameters---------------------------------------------------------------
nvar <- 3  # number of variables
bounds <- matrix(data = 1, nrow = nvar, ncol = 2) # upper and lower bounds
bounds[, 1] <- -5 * bounds[, 1]
bounds[, 2] <- 5 * bounds[, 2]
nobj <- 2  # number of objectives
minmax <- c(FALSE, FALSE) # minimization for both objectives
popsize <- 100  # size of the genetic population
archsize <- 100  # size of the archive for the Pareto front
maxrun <- 1000  # maximum number of calls
prec <- matrix(1.e-3, nrow = 1, ncol = nobj)  # convergence criteria

## ----multi--------------------------------------------------------------------
nrepeat <- 3  # number of calls to caRamel
concat_results_objectives <- NULL  # save results for all the calls
concat_results_parameters <- NULL

for (i in seq(nrepeat)) {
   optres <- caRamel(nobj,
               nvar,
               minmax,
               bounds,
               kursawe,
               popsize,
               archsize,
               maxrun,
               prec,
               carallel = 0,
               graph = FALSE,
               verbose = FALSE)
   
   concat_results_objectives <- rbind(concat_results_objectives,
                                      optres$objectives)
   concat_results_parameters <- rbind(concat_results_parameters,
                                      optres$parameters)
}

## ----merge--------------------------------------------------------------------
results_objectives <- concat_results_objectives
results_objectives[, !minmax] <- -results_objectives[, !minmax]  # important !

is_pareto <- pareto(results_objectives)  # mask

global_results_objectives <- concat_results_objectives[is_pareto, ]  # front from the three previous fronts
global_results_parameters <- concat_results_parameters[is_pareto, ]

## ----plot---------------------------------------------------------------------
plot(concat_results_objectives[, 1], concat_results_objectives[, 2],
     main = "Kursawe Pareto fronts",
     xlab = "Objective #1", ylab = "Objective #2")
points(global_results_objectives[, 1], global_results_objectives[, 2],
       col = "red", pch = "*")

