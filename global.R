library(dplyr)
library(rgdal)
library(sp)

HKG0 <- readRDS("data/HKG_adm0.rds")
HKG1 <- readRDS("data/HKG_adm1.rds")

#HKG0 <- readOGR("data/HKG_adm_shp/HKG_adm0.shp", layer= "HKG_adm0")
#HKG1 <- readOGR("data/HKG_adm_shp/HKG_adm1.shp", layer= "HKG_adm1")

allzips <- readRDS("data/superzip.rds")
allzips$latitude <- jitter(allzips$latitude)
allzips$longitude <- jitter(allzips$longitude)
allzips$college <- allzips$college * 100
allzips$zipcode <- formatC(allzips$zipcode, width=5, format="d", flag="0")
row.names(allzips) <- allzips$zipcode

cleantable <- allzips %>%
  select(
    City = city.x,
    State = state.x,
    Zipcode = zipcode,
    Rank = rank,
    Score = centile,
    Superzip = superzip,
    Population = adultpop,
    College = college,
    Income = income,
    Lat = latitude,
    Long = longitude
  )

allzips[allzips$zipcode == "01001",]
