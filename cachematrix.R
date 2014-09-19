## This program was done as a requirement to complete the coursera's R
## course

## Create the special cached matrix

makeCacheMatrix <- function(x = matrix()) {
  inversedMatrix <- NULL
  set <- function(y) {
    x <<- y
    inversedMatrix <<- NULL
  }
  get <- function() x
  setInverse <- function(inv) inversedMatrix <<- inv
  getInverse <- function() inversedMatrix
  list(set = set, get = get, setInverse = setInverse,
      getInverse = getInverse)
}


## Calculate the inverse for a cachedMatrix object
## if the matrix was already calculated, just grab the cached version

cacheSolve <- function(x, ...) {
        inverse <- x$getInverse()
        if(!is.null(inverse)) {
          message("Cached matrix present, retriving...")
          return(inverse)
        }
        mat <- x$get()
        inverse <- solve(mat);
        x$setInverse(inverse)
        inverse
}
