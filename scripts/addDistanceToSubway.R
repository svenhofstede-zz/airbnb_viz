earth.dist <- function (long1, lat1, long2, lat2)
{
  rad <- pi/180
  a1 <- lat1 * rad
  a2 <- long1 * rad
  b1 <- lat2 * rad
  b2 <- long2 * rad
  dlon <- b2 - a2
  dlat <- b1 - a1
  a <- (sin(dlat/2))^2 + cos(a1) * cos(b1) * (sin(dlon/2))^2
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  R <- 6378.145
  d <- R * c
  return(d)
}


for (i in 1:nrow(air_merged)){
  distance <- 999
  lat_air <- air_merged[i,"Latitude"]
  long_air <- air_merged[i,"Longitude"]

  for(j in 1:nrow(subway)){
    dist <- earth.dist(long_air,lat_air,subway[j,"Longitude"],subway[j,"Latitude"])
    if(dist < distance){
      distance <- dist
    }
  }
  print(i)
  flush.console()
  air_merged[i,"distSubway"] <- distance
}