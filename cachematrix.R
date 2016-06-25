## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## -------------DESCRIPTION---------------

## Function creates a list of Functions for setting the value of the matrix,
## getting the value of the matrix, getting and setting the inverse of the matrix.
## when setting the value of the matrix, the inv is set to NULL. when the getinverse
## function is called, the inverse matrix returned depends on the internal inv variable.
## if it is NULL, the setinverse function automatically sets the inv variable
## to the inverse of the matrix x obtained by using the solve function.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  setmatrix <- function(y){
    x <<- y
    inv <<- NULL
  }
  getmatrix <- function() x
  getinverse <- function() inv
  setinverse <- function() inv <<- solve(x)
  list(setmatrix = setmatrix,getmatrix = getmatrix,setinverse = setinverse,getinverse = getinverse)
}


## Write a short comment describing this function

## -------------DESCRIPTION---------------

## the function first retrieves the inverse matrix stored in internal variable inv
## of x using the getinverse function. if it is not NULL, the matrix is returned.
## otherwise the setinverse function is called which sets the internal variable inv
## of x to the inverse of the matrix using the solve function. after this the 
## getinverse function fetches the inverse matrix from the inv variable in x and it
## is returned by the function since it is the last statement in the function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)){
    message("getting cached inverse value of matrix")
    return(inv)
  }
  x$setinverse()
  x$getinverse()
}
