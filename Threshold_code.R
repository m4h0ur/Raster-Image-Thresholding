####################################################################
#Thresholding code for Remote Sensing Image Data (Sentinel-1)
#This code is contributed by Milad Mahour for educational purposes
#Email: m.mahour@utwente.nl
####################################################################
rm(list=ls(all=TRUE))
graphics.off()

#Loading "rgdal" library for reading image data
require(rgdal)

#Defining the root directory
Root <- setwd("~/Document/FolderName")

# Image input
inputimage <- "subset_sentinel1.tif"
sentinel1 <- readGDAL(inputimage)
names(sentinel1)<- "band1"


threshold <- 5.0
sentinel1.data <- sentinel1@data[,1]

sentinel1.thr <- sentinel1.data
sentinel1.thr[] <- 0
sentinel1.thr[sentinel1.data <threshold] <- 1

sentinel1$threshold <- sentinel1.thr
windows()
image(sentinel1,attr="threshold",col=gray((0:255)/255),axes=TRUE)

