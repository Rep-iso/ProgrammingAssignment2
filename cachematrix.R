## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function creates a list of functions that allows:
## 1. store a matrix in an environment
## 2. retrieve the stored matrix
## 3. Assign the inverse matrix calculated and store it into the function environment

makeCacheMatrix <- function(x = matrix()) {

  inv_matrix<-NULL 
  
  setMat<-function(y){
    
    x<<-y             					# matrix assignment in the environment
    inv_matrix<<-NULL 					# Clean the cache
  }
  getMat <- function() x     				# print the matrix
  setInvMat <- function(solve) inv_matrix <<- solve 	# Assign the inverse matrix to an object
  getInvMat <- function() inv_matrix 			# print the inverse matrix
  list(setMat = setMat, getMat = getMat, 		# list of functions to call
       setInvMat = setInvMat,
       getInvMat = getInvMat)

}


## Write a short comment describing this function

## This function checks if the inverse matrix is stored in cache
## If it is true, shows the cached matrix and if it´s not, 
## calculates it and call the setInvMat function included in the function makeCachematrix
## to store it in cache

cacheSolve <- function(x) {
  inv_matrix <- x$getInvMat()
  if(!is.null(inv_matrix)) {
    message("getting cached data")
    return(inv_matrix)
  }
  data <- x$getMat()
  inv_matrix <- solve(data)
  x$setInvMat(inv_matrix)
  inv_matrix
        ## Return a matrix that is the inverse of 'x'
}
