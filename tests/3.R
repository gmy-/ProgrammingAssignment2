## test inverse computation speed-up that is achieved by caching

test_cacheSolve_speedup <- function() {
        ## test cacheSolve speed-up
        ## if test fails then something is wrong with caching mechanism
        ## because there was no speed-up detected
        k <- 1500
        m <- matrix(rep(0, k*k), nrow = k)
        diag(m) <- 1
        cm <- makeCacheMatrix(m)
        tm1 <- system.time(cacheSolve(cm))
        tm2 <- system.time(cacheSolve(cm))
        ## with cache must be at least 10 times faster - actually much more
        checkTrue(as.numeric(tm2[1]) * 10 < as.numeric(tm1[1]))
}