#' Takes an object of class \code{\link[mobsim]{community}} and replaces individual
#' species identities based on the neighbours
#'
#' @param comm Community object
#' @inheritParams spatstat.core::marktable
#' @inheritParams create_motherpoints
#'
#' @details For each individual, the function first identifies neighbours' identity
#' using the \code{\link[spatstat.core]{marktable}} function, computes relative
#' abundances and uses these relative abundances as random drawing probabilities
#' in \code{\link[base]{sample}}.
#' The neighbourhood community of an individual is restricted by parameter N (number of individual) or R (radius).
#' @author Alban Sagouis
#'
#' @examples
#' # Integrated between mobsim::sim_thomas_coords() and the analysis of biodiversity
#' simdat <- mobsim::sim_thomas_coords(11L:100L)
#' mobsim::div_rand_rect(comm = simdat, prop_area = 0.01, n_rect = 20L)
#' simdat2 <- replace_individuals(simdat, N = 10L)
#' mobsim::div_rand_rect(comm = simdat2, prop_area = 0.01, n_rect = 20L)
#'
#' @export

replace_individuals <- function(comm, N = NULL, R = NULL, seed = NULL) {
   if (!is.null(seed)) set.seed(seed)

   spatial_comm <- community2ppp(comm)

   contingency_table <- spatstat.core::marktable(spatial_comm, N = N, R = R)
   comm$census$species <- factor(
      apply(
         contingency_table, 1L,
         function(ind) names(sample(x = ind, size = 1L, prob = ind/sum(ind)))
      )
   )
   comm
}
