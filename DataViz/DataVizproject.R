library(ggmap)
library(colorspace)

myLocation <- "Indiana"

#Define map source, type, color (Load Indiana Map)
myMap <- get_map(location=myLocation, source="google",
                 maptype="roadmap", crop = F, zoom = 5)


#Load location files
loc_raw <- read.csv("SLIC_Center_Name.csv")
loc <- data.frame(loc_raw[,2])

loc_finder <- function(n) {
  loc_trans <- t(n) #Transpose Data
  loc_table <- lapply(loc_trans, function(x) { geocode(x)})
  print(loc_table)
}

#TODO1: Data Manuplation
#a <- data.frame(loc_finder(loc))
#b<-t(a)
#write.csv(b, file = "foo.csv")

#Load geo csv
geo <- read.csv("geo.csv")
geo <- data.frame(geo) #Convert geo into data.frame

geo$ZIP
#Add points
ggmap(myMap) +
  geom_point(aes(Longitude,Latitude, color = ZIP), data = geo, alpha = 0.8, size = 3) +
  scale_colour_gradientn(colours = rainbow_hcl(4)) #colour by ZIP code gradient