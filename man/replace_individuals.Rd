% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reproduction.R
\name{replace_individuals}
\alias{replace_individuals}
\title{Takes an object of class \code{\link[mobsim]{community}} and replaces individual
species identities based on the neighbours}
\usage{
replace_individuals(comm, N = NULL, R = NULL, seed = NULL)
}
\arguments{
\item{comm}{Community object}

\item{N}{
    Number of neighbours of each point. Incompatible with \code{R}.
  }

\item{R}{
    Neighbourhood radius. Incompatible with \code{N}.
  }

\item{seed}{(integer) Any integer passed to \code{\link[base]{set.seed}} for reproducibility.}
}
\description{
Takes an object of class \code{\link[mobsim]{community}} and replaces individual
species identities based on the neighbours
}
\details{
For each individual, the function first identifies neighbours' identity
using the \code{\link[spatstat.core]{marktable}} function, computes relative
abundances and uses these relative abundances as random drawing probabilities
in \code{\link[base]{sample}}.
The neighbourhood community of an individual is restricted by parameter N (number of individual) or R (radius).
}
\examples{
# Integrated between mobsim::sim_thomas_coords() and the analysis of biodiversity
simdat <- mobsim::sim_thomas_coords(11L:100L)
mobsim::div_rand_rect(comm = simdat, prop_area = 0.01, n_rect = 20L)
simdat2 <- replace_individuals(simdat, N = 10L)
mobsim::div_rand_rect(comm = simdat2, prop_area = 0.01, n_rect = 20L)

}
\author{
Alban Sagouis
}
