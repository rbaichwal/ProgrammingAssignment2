## Put comments here that give an overall description of what your
## functions do

##This function gets the matrix defined and saves the inverse value of the matrix in cache.
makeCacheMatrix <- function(x = matrix()) {
## initialize the value of the matrix inverse to NULL
  matrixinverse <- NULL                     
  ## delcare another function set where the value will be cached in 1. Matrix is created
  ## for the first time. 2. changes made to cached matrix
  set <- function(y) {                      
    x <<- y
    ## change the value of inverse of the matrix in case the matrix was changed.
    matrixinverse <<- NULL              
  }
  ## gets the value of the inverse
  get <- function() x                           
  #calculates the inverse of non-singular matrix via the solve function
  setinverse <- function(solve) matrixinverse <<- solve 
  # gets the inverse     
  getinverse <- function() matrixinverse        
  ## passes the value of the function makeCacheMatrix        
  list(set = set, get = get,                    
       setinverse = setinverse,
       getinverse = getinverse)

}


##This function displays the inverse matrix using the inverse value either from the cache if a value already exists for the matrix given or get it from the new calculation if not in cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        matrixinverse <- x$getinverse()
  #if the inverse exists, it gets it.
  if(!is.null(matrixinverse)) {                 
    message("getting cached data - Inverse of the matrix")
    return(matrixinverse)
  }
  #if the inverse if not there, first it is calculated and then retrieved.
  data <- x$get()                               
  matrixinverse <- solve(data, ...)
  x$setinverse(matrixinverse)
  matrixinverse
}
