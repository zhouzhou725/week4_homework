library(sf)
library(dplyr)
library(readr)
library(ggplot2)
#read
inequality_data <- read_csv("C:/Users/zhouzhou/Desktop/GIS/wk4/homework/week4_homework/gii.csv")
world_geojson <- st_read("C:/Users/zhouzhou/Desktop/GIS/wk4/homework/week4_homework/World_Countries_.geojson")
# To view the first few rows of inequality_data
# To view the first few rows of world_geojson
head(inequality_data)
head(world_geojson)


# Check the column name and the first few rows of the world_geojson
print(names(world_geojson))
print(inequality_data)
#rename the country column in the inequality_data dataset to COUNTRY
inequality_data <- inequality_data %>% rename(COUNTRY = country)
colnames(world_geojson)
colnames(inequality_data)


#Calculate the Inequality Difference
inequality_data <- inequality_data %>%
  mutate(Inequality_Difference = gii_2010 - gii_2019)
#Merge Datasets
merged_data <- world_geojson %>%
  left_join(inequality_data, by = "COUNTRY")
#View the Merged Data
head(merged_data)
#Plotting GII for 2010 and 2019
ggplot(data = merged_data) +
  geom_sf(aes(fill = gii_2010), color = "black") +
  scale_fill_viridis_c(option = "plasma", name = "GII 2010") +
  labs(title = "Global Inequality Index (2010)") +
  theme_minimal()
ggplot(data = merged_data) +
  geom_sf(aes(fill = gii_2019), color = "black") +
  scale_fill_viridis_c(option = "plasma", name = "GII 2019") +
  labs(title = "Global Inequality Index (2019)") +
  theme_minimal()
#Plotting GII difference
ggplot(data = merged_data) +
  geom_sf(aes(fill = Inequality_Difference), color = "black") +
  scale_fill_viridis_c(option = "plasma", name = "GII difference") +
  labs(title = "Global Inequality Index difference") +
  theme_minimal()
