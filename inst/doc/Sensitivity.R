## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----caRa---------------------------------------------------------------------
library(caRamel)

## ----schaffer-----------------------------------------------------------------
schaffer <- function(i) {
  s1 <- x[i,1] * x[i,1]
  s2 <- (x[i,1] - 2) * (x[i,1] - 2)
  return(c(s1, s2))
}

## ----schaffer_variable--------------------------------------------------------
nvar <- 1 # number of variables
bounds <- matrix(data = 1, nrow = nvar, ncol = 2) # upper and lower bounds
bounds[, 1] <- -10 * bounds[, 1]
bounds[, 2] <- 10 * bounds[, 2]

## ----schaffer_objectives------------------------------------------------------
nobj <- 2 # number of objectives
minmax <- c(FALSE, FALSE) # min and min

## ----schaffer_param-----------------------------------------------------------
popsize <- 100 # size of the genetic population
archsize <- 100 # size of the archive for the Pareto front
maxrun <- 1000 # maximum number of calls
prec <- matrix(1.e-3, nrow = 1, ncol = nobj) # accuracy for the convergence phase

## ----schaffer_launch, fig.show="hide", results="hide"-------------------------
results <-
  caRamel(nobj,
          nvar,
          minmax,
          bounds,
          schaffer,
          popsize,
          archsize,
          maxrun,
          prec,
          carallel=FALSE, 
          sensitivity=TRUE) # sensitivity required

## ----schaffer_OK--------------------------------------------------------------
print(results$success==TRUE)

## ----schaffer_plot1-----------------------------------------------------------
plot(results$objectives[,1], results$objectives[,2], main="Schaffer Pareto front", xlab="Objective #1", ylab="Objective #2")

## ----schaffer_plot2-----------------------------------------------------------
plot(results$parameters, main="Corresponding values for X", xlab="Element of the archive", ylab="X Variable")

## ----jacobian-----------------------------------------------------------------
names(results$derivatives)

## ----sensi--------------------------------------------------------------------
plot(results$parameters, results$derivatives$Jacobian_1, main="Sensitivitiy for the first objective", ylab="Sensitivity values", xlab="X values")

## ----histo--------------------------------------------------------------------
hist(results$derivatives$Jacobian_2, main="Sensitivitiy for the second objective", xlab="Sensitivity values", ylab="Distribution of the Pareto front")

## ----sensi2-------------------------------------------------------------------
plot(results$derivatives$Jacobian_1, results$derivatives$Jacobian_2, main="Sensitivitiy for both objectives", ylab="Sensitivity values #2", xlab="Sensitivity values #1")

