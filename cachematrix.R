-## Instructions:
## Put comments here that give an overall description of what your
-## functions do
+## cachematrix.R
+##
+## Create a cache marix object that can be used to
+## repeatably solve the inverse of the marix, but only
+## calculates the inverse once.
+##
+## Usage:
+##  M <- matrix(c(1, 2, 3, 4), nrow=2, ncol=2)
+##  cacheMatrix <- makeCacheMatrix(M)
+##  cacheSolve(cacheMatrix)
+##
+##  cacheMatrix$set(M)      # Change the matrix being cached.
+##  M <- cacheMatrix$get()  # Returns the matrix being cached.
+##
+##  cacheMatrix$setInverse(solve(data, ...)) # Private function containing cached inverse of x
+##  cacheMatrix$getInverse()                 # Private function used to get the cached inverse of x
 
-## Write a short comment describing this function
+## Create a cacheMatrix object for an invertale matrix.
 
 makeCacheMatrix <- function(x ) {
  ## Create a cache marix object that can be used to
  ## repeatably solve the inverse of the marix, but only
  ## calculates the inverse once.
  inv<-NULL  
#  Assigns inv the value NULL in the local environment 
  
  set<-function(y){x<<-y 
  # Assigns the matrix x  the value 
  #of the argument y in the parent environment
                  inv<<-NULL 
#  Assigns inv the value NULL in the parent 
#environment- if set is called, inv is NULL
  }
  
    get <- function() x
  #  If get() is called, the value of x matrix is returned
    
  setinv <- function(invers) inv <<- invers  #  If setinv() is called,
   #inv is assigned the value of argument invers from the parent environment
    
    getinv <- function() inv 
  #  If getinversa() is called, inv is returned
  
    list( get = get,
          set=set,
       setinv = setinv,
       getinv = getinv)
  #  Puts all 4 functions in a list; returns the list
 
} getInverse = getInverse)
 }
 
 
-## Write a short comment describing this function
+## Return the inverse of an cacheMatrix object
 
a <- makeCacheMatrix(mat)
#retrieves  the 4 functions in the list a
cacheSolve<- function(a, ...) {
## Return the inverse of a matrix mat  
  inv <- a$getinv()
## stores the invers in object inv 
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
## if the inverse was already calculated then send the message and 
## returns with the result    
  }
## if not, then proceeds to calculate it  
  data <- a$get()
  inv <- solve(data, ...)
  a$setinv(inv)
## once it's calculated retrieve the result  
  inv }
 
