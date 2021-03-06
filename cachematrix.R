## this file implements matrix with cached operation of inverse

## create a matrix with extra functionality to get/set inverse
## this functionality allows to cache the inverse for future use

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        
        get <- function() {
                x
        }
        
        setInverse <- function(inverse) {
                inv <<- inverse
        }
        
        getInverse <- function() {
                inv
        }
        
        list(set = set,
             get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## compute an inverse of a matrix using cache
## if the inverse was already computed before then the cached value is returned

cacheSolve <- function(x, ...) {
        inv <- x$getInverse()
        if(!is.null(inv)) {
                message("cache hit!")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setInverse(inv)
        inv
}
