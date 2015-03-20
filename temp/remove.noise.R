remove.noise <- function(data){
  row.has.na <-apply (data, 1, function(x){any(is.na(x))})
  sum(row.has.na)
  return(data[!row.has.na,])
}