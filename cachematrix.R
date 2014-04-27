## Calculate the inverse of a square invertible matrix
## This will cache the results to improve performance

## Create an object that will set and get the inverse of
## as well as set and get the matrix

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    
    setMatrix <- function(m){
        x <<- m
        inv <<- NULL
    }
    
    getMatrix <- function(){
        x
    }
    
    setInv <- function(solved){
        inv <<- solved
    }
    
    getInv <- function(){
        inv
    }
    
    list(setMatrix = setMatrix, 
         getMatrix = getMatrix,
         setInv = setInv,
         getInv = getInv)

}


## Calculate the inverse of the matrix
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getInv()
    if(!is.null(inv)){
        message("getting cached data")
        return(inv)
    }
    
    mat <- x$getMatrix()
    inv <- solve(mat, ...)
    x$setInv(inv)
    inv
}
