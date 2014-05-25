## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## makeCacheMatrix is the constructor: Provides the set y get to cache matrix 
## get y set, and to the inverse matrix: getSolve and setSolve  

makeCacheMatrix <- function(x = matrix()) {

## Initialize m (inverse matrix)
  m <- NULL

## constructor set and get   
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x

## constructor for the cached inverse matrix
  setSolve <- function(solve) m <<- solve
  getSolve <- function() m

  list(set = set, get = get,
       setSolve = setSolve,
       getSolve = getSolve)

}


## Write a short comment describing this function
## Function that either reuse the inverse of matrix cached or get
## the inverse and cache it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getSolve()

## If already present the cache inverse matrix (m is not null) then just simply return it
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
## Otherwise calculate the inverse and set the cache inverse matrix
  data <- x$get()
  m <- solve(data, ...)
  x$setSolve(m)
  m


}
