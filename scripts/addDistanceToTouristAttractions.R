#attractions = read.csv("attraction_locations.csv")


for (i in 1:nrow(air_merged)){
  distance <- 999
  closest_attraction <- NULL
  count_1km_attractions <- 0
  lat_air <- air_merged[i,"Latitude"]
  long_air <- air_merged[i,"Longitude"]
  
  current <- air_merged[i,"ID"]
  
  for(j in 1:nrow(attractions)){
    dist <- earth.dist(long_air,lat_air,attractions[j,"longitude"],attractions[j,"latitude"])
    
    if(dist < 2){
      count_1km_attractions <- count_1km_attractions + 1
    }
    
    if(dist < distance){
      distance <- dist
      closest_attraction <- attractions[j,"attraction"]
    }
  }
  print(count_1km_attractions)
  print(i)
  flush.console()
  air_merged[i,"distAttractions"] <- distance
  air_merged[i,"closestAttraction"] <- closest_attraction
  air_merged[i,"count_1km_attractions"] <- count_1km_attractions
  
}

print(num_6)
write.csv(air_merged, file="listings_final.csv")