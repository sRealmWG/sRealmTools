test_that("snapshot test with Thoms process", {
   simdat <- mobsim::sim_thomas_community(10L, 10L, seed = 42L)
   expect_snapshot(jitter_species(simdat, seed = 42L))
})

test_that("snapshot test with Poisson process", {
   simdat <- mobsim::sim_poisson_community(10L, 10L, seed = 42L)
   expect_snapshot(jitter_species(simdat, seed = 42L))
})

test_that("snapshot test wide jitter", {
   simdat <- mobsim::sim_thomas_community(10L, 10L, seed = 42L)
   expect_snapshot(jitter_species(simdat, sd = 3, seed = 42L))
})

test_that("snapshot test with singletons only", {
   simdat <- mobsim::sim_thomas_community(10L, 10L, fix_s_sim = TRUE, seed = 42L)
   expect_snapshot(jitter_species(simdat, seed = 42L))
})

test_that("snapshot test with drift", {
   simdat <- mobsim::sim_thomas_community(10L, 10L, fix_s_sim = TRUE, seed = 42L)
   expect_snapshot(jitter_species(simdat, drift = 2, seed = 42L))
})


