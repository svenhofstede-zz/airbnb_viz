for (i in 1:nrow(air_merged)){
  distance <- 999
  lat_air <- air_merged[i,"Latitude"]
  long_air <- air_merged[i,"Longitude"]

  for(j in 1:nrow(wifi)){
    dist <- earth.dist(long_air,lat_air,wifi[j,"Long_"],wifi[j,"Lat"])
    if(dist < distance){
      distance <- dist
    }
  }
  print(i)
  flush.console()
  air_merged[i,"distWifi"] <- distance
}