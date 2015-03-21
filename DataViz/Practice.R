set.seed(500)
df <- round(data.frame(
  x = jitter(rep(-95.36, 50), amount = .3),
  y = jitter(rep( 29.76, 50), amount = .3)
), digits = 2)

map <- get_googlemap("houston", markers = df, path = df, scale =2)
ggmap(map, extent = "device")