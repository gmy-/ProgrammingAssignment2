## test basic cached matrix functionality

test_makeCacheMatrix <- function() {
        ## test makeCacheMatrix$set
        cm <- makeCacheMatrix()
        y <- matrix(1:6, nrow = 2, ncol = 3)
        cm$set(y)
        checkEquals(cm$get(), y)
        
        ## test makeCacheMatrix$get when matrix is not set
        cm <- makeCacheMatrix()
        checkEquals(cm$get(), matrix())
        
        ## test makeCacheMatrix$get when matrix is set
        cm <- makeCacheMatrix(matrix(1:6, nrow = 2, ncol = 3))
        cm$set(y)
        checkEquals(cm$get(), y)
        
        ## test cache reset when matrix is reset
        cm <- makeCacheMatrix(matrix(c(1, 0, 0, 1), nrow = 2, ncol = 2))
        cm$setInverse(matrix(c(1, 0, 0, 1), nrow = 2, ncol = 2))
        cm$set(matrix(c(4, 3, 3, 2), nrow = 2, ncol = 2))
        checkTrue(is.null(cm$getInverse()))
        
        ## test makeCacheMatrix$getInverse when cache is empty
        cm <- makeCacheMatrix(matrix(c(4, 3, 3, 2), nrow = 2, ncol = 2))
        checkTrue(is.null(cm$getInverse()))
}





