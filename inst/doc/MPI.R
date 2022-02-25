## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(python.reticulate = FALSE)

## ----caRa, eval=F, echo=T-----------------------------------------------------
#  library(caRamel)

## ----pbdMPI, eval=F, echo=T---------------------------------------------------
#  library(pbdMPI)

## ----kursawe, eval=F, echo=T--------------------------------------------------
#  kursawe <- function(i) {
#    k1 <- -10 * exp(-0.2 * sqrt(x[i,1]^2 + x[i,2]^2)) - 10 * exp(-0.2 * sqrt(x[i,2]^2 + x[i,3]^2))
#    k2 <- abs(x[i,1])^0.8 + 5 * sin(x[i,1]^3) + abs(x[i,2])^0.8 + 5 * sin(x[i,2]^3) + abs(x[i,3])^0.8 + 5 * sin(x[i,3]^3)
#    return(c(k1, k2))
#  }

## ----kursawe_variable, eval=F, echo=T-----------------------------------------
#  nvar <- 3 # number of variables
#  bounds <- matrix(data = 1, nrow = nvar, ncol = 2) # upper and lower bounds
#  bounds[, 1] <- -5 * bounds[, 1]
#  bounds[, 2] <- 5 * bounds[, 2]

## ----kursawe_objectives, eval=F, echo=T---------------------------------------
#  nobj <- 2 # number of objectives
#  minmax <- c(FALSE, FALSE) # minimization for both functions

## ----kursawe_param, eval=F, echo=T--------------------------------------------
#  popsize <- 100 # size of the genetic population
#  archsize <- 100 # size of the archive for the Pareto front
#  maxrun <- 1000 # maximum number of calls
#  prec <- matrix(1.e-3, nrow = 1, ncol = nobj) # accuracy for the convergence phase

## ----call_caRa, eval=F, echo=T------------------------------------------------
#  results <-
#    caRamel(nobj,
#            nvar,
#            minmax,
#            bounds,
#            kursawe,
#            popsize,
#            archsize,
#            maxrun,
#            prec,
#            carallel = 1,
#            numcores = 20,
#            graph = FALSE,
#            verbose = FALSE)

## ----mpi_caRa, eval=F, echo=T-------------------------------------------------
#  init()  # MPI functions from the pbdMPI package
#  size <- comm.size()
#  rank <- comm.rank()
#  
#  results <- gather(optres, rank.dest = 0)  # gather all results on the main process
#  
#  if (rank == 0) saveRDS(results, "Results.Rds")  # save all the results on disk
#  
#  finalize()

