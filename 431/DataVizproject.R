library(ggmap)

myLocation <- "Indiana"

#Define map source, type, color
myMap <- get_map(location=myLocation, source="google",
                 maptype="roadmap", zoom = 7)

geocode("Indianapolis")

Longitude <-  -86.15807
Latitude <-  39.7684

loc <- read.csv("SLIC_Center_Name.csv")

print(loc_raw)

geo_info <- data.frame(0,0,0,0,0,0,0,0,0,0)

for(i in loc_raw) { geo_info <- geocode(i)
                    print(geo_info)}


#Add points
ggmap(myMap) +
  geom_point(aes(x = Longitude, y = Latitude), data =,
             alpha = 0.5, color = "darkred", size = 3)



