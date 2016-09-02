#Coursera Programming Assignment 2: Lexical Scoping
#Batel Blechter
#Sept 2, 2016

#1. makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse
#makeCacheMatrix creates a list containing a function to:
#1.set the value of the matrix
#2.get the value of the matrix
#3.set the value of the inverse of the matrix
#4.get the value of the inveser of the matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<-y
    inv <<- NULL
  }
  
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


#2.cacheSolve: This function computes the inverse of the special "matrix"
#returned by makeCacheMatrix function. If the inverse has already been calculated
#(and the matrix has not changed), then the cacheSolve retrieves the inverse
#from the cache. This function assumes the matrix is always invertible

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}

#test functions


#> x <- cbind(c(2,1), c(1,2))
#> m <- makeCacheMatrix(x)
#> m$get()
#     [,1] [,2]
#[1,]    2    1
#[2,]    1    2

#Retrieve from the cache 
#> cacheSolve(m)
#         [,1]       [,2]
#[1,]  0.6666667 -0.3333333
#[2,] -0.3333333  0.6666667
