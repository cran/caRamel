## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(python.reticulate = FALSE)

## ----caRa, eval=F, echo=T-----------------------------------------------------
#  library(caRamel)

## ----reti, eval=F, echo=T-----------------------------------------------------
#  library(reticulate)

## ----load, eval=F, echo=T-----------------------------------------------------
#  use_python("/usr/local/bin/python3")
#  source_python("kursawe.py")

## ----wrap, eval=F, echo=T-----------------------------------------------------
#  wrapperFunction <- function(i) {
#    # load the package
#    library(reticulate)
#    # python path
#    use_python("/usr/local/bin/python3")
#    # source the Python function
#    source_python("kursawe.py")
#    # call the Python function and return the results
#    return(kursawe(x[i,]))
#  }

## ----kursawe_variable, eval=F, echo=T-----------------------------------------
#  nvar <- 3 # number of variables
#  bounds <- matrix(data = 1, nrow = nvar, ncol = 2) # upper and lower bounds
#  bounds[, 1] <- -5 * bounds[, 1]
#  bounds[, 2] <- 5 * bounds[, 2]

## ----kursawe_objectives, eval=F, echo=T---------------------------------------
#  nobj <- 2 # number of objectives
#  minmax <- c(FALSE, FALSE) # min and min

## ----kursawe_param, , eval=F, echo=T, fig.show="hide", results="hide"---------
#  popsize <- 100 # size of the genetic population
#  archsize <- 100 # size of the archive for the Pareto front
#  maxrun <- 1000 # maximum number of calls
#  prec <- matrix(1.e-3, nrow = 1, ncol = nobj) # accuracy for the convergence phase
#  
#  results <-
#    caRamel(nobj,
#            nvar,
#            minmax,
#            bounds,
#            wrapperFunction, # It's the wrapper function that will be called
#            popsize,
#            archsize,
#            maxrun,
#            prec)

## ----kursawe_OK_plot, eval=F, echo=T------------------------------------------
#  print(results$success==TRUE)
#  
#  plot(results$objectives[,1], results$objectives[,2], main="Kursawe Pareto front", xlab="Objective #1", ylab="Objective #2")

## ----kursawe_plot_conv, eval=F, echo=T----------------------------------------
#  matplot(results$save_crit[,1],cbind(results$save_crit[,2],results$save_crit[,3]),type="l",col=c("blue","red"), main="Convergence", xlab="Number of calls", ylab="Objectives values")

