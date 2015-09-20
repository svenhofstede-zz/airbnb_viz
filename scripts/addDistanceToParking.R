for (i in 1:nrow(air_merged)){
  distance <- 999
  lat_air <- air_merged[i,"Latitude"]
  long_air <- air_merged[i,"Longitude"]

  for(j in 1:nrow(parking)){
    dist <- earth.dist(long_air,lat_air,parking[j,"longitude"],parking[j,"latitude"])
    if(dist < distance){
      distance <- dist
    }
  }
  print(i)
  flush.console()
  air_merged[i,"distParking"] <- distance
}