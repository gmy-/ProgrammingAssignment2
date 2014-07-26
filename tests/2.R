## test computation of inverse in a matrix with cached inverse operation

test_cacheSolve_computation <- function() {
        ## test makeCacheMatrix$getInverse when cache is ready
        cm <- makeCacheMatrix(matrix(c(4, 3, 3, 2), nrow = 2, ncol = 2))
        y <- cacheSolve(cm)
        checkTrue(!is.null(cm$getInverse()))
        
        ## test cacheSolve
        cm <- makeCacheMatrix(matrix(c(4, 3, 3, 2), nrow = 2, ncol = 2))
        checkEquals(cacheSolve(cm), matrix(c(-2, 3, 3, -4), nrow = 2, ncol = 2))
        
        ## test cacheSolve with 100x100 identity matrix
        k <- 100
        m <- matrix(rep(0, k*k), nrow = k)
        diag(m) <- 1
        cm <- makeCacheMatrix(m)
        checkEquals(cacheSolve(cm), solve(m))
        
        ## test setting new matrix when inverse is already cached
        cm <- makeCacheMatrix(matrix(c(4, 3, 3, 2), nrow = 2, ncol = 2))
        y <- cacheSolve(cm)
        cm$set(matrix(c(1, 0, 0, 1), nrow = 2, ncol = 2))
        checkEquals(cm$getInverse(), NULL)
}