# R code for uploading and visualizing Coprnicus data in R

# install.packages("ncdf4")
# install.packages("viridis")
library(ncdf4)
library(raster)
library(RStoolbox)
library(viridis)
library(ggplot2)

# Set the working directory
setwd("~/lab/copernicus/") # Linux 
# setwd("C:/lab//copernicus/")  # windows
# setwd("/Users/name/lab/copernicus/") # mac

snow20211214 <- raster("c_gls_SCE_202112140000_NHEMI_VIIRS_V1.0.1.nc")
# to see how many layers are inside Copernicus data:
# snow20211214_ <- brick("c_gls_SCE_202112140000_NHEMI_VIIRS_V1.0.1.nc")

snow20211214

plot(snow20211214)

cl <- colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(snow20211214, col=cl)

# this is bad!
cl <- colorRampPalette(c("blue","green","red"))(100)
plot(snow20211214, col=cl)

#########à
# ggplot function
ggplot() + 
geom_raster(snow20211214, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent))  

# ggplot function with viridis
ggplot() + 
geom_raster(snow20211214, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis() 

ggplot() + 
geom_raster(snow20211214, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis(option="cividis") 

ggplot() + 
geom_raster(snow20211214, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis(option="cividis") + 
ggtitle("cividis palette")









