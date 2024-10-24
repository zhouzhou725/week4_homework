library(sf)
library(dplyr)
library(readr)

inequality_data <- read_csv("C:/Users/zhouzhou/Desktop/GIS/wk4/homework/hdr-data.csv")
world_geojson <- st_read("C:/Users/zhouzhou/Desktop/GIS/wk4/homework/World_Countries_(Generalized)_9029012925078512962.geojson")

head(inequality_data)
head(world_geojson)


# 检查 world_geojson 的列名和前几行
print(names(world_geojson))
print(inequality_data)



inequality_data <- inequality_data %>%
  mutate(Inequality_Difference = 2019 - 2010)
merged_data <- world_geojson %>%
  left_join(inequality_data, by = "COUNTRY")
head(merged_data)
