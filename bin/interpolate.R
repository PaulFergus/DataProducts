interpolate <- function(x){  
  return(na.approx(replace(x, x == 0, NA)))
  
}