## Put comments here that give an overall description of what your
## functions do
##Create a cache marix object that can be used to
## repeatably solve the inverse of the marix, but only
## calculates the inverse once.

## Write a short comment describing this function
##  this function  takes a matrix x as input and returns a list containing  4 functions: 
##get, set,  setinv and getinv
makeCacheMatrix <- function(x = matrix()) {
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
 
}




## Write a short comment describing this function
## this function returns the inverse of a matrix x introduced as input of makeCacheMatrix

a <- makeCacheMatrix(x)
      cacheSolve<- function(a, ...) {
## Return the inverse of a matrix x 
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
}
