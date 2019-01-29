###------HEATMAPS IN R------
#if you need a dataset 
#install.packages("mtcars")
#others
#install.packages("heatmaply")

library("heatmaply")
library("mtcars")
library("RColorBrewer")


##import in mtcars as matrix 
mtcars <- as.matrix(mtcars)
head(mtcars)
View(mtcars)

### scale data to mean=0, sd=1 and convert to matrix
mtscaled <- as.matrix(scale(mtcars))

heatmap(mtcars)
heatmap(mtcars, scale="column")

##clusterization notes
#You may be noticed that order of both rows and columns is different compare to the native mtcar matrix. This is because heatmap do a reordering using clusterisation: it calculates the distance between each pair of rows and columns and try to order them by similarity. Moreover, the corresponding dendrogram are provided beside the heatmap. We can avoid it and just visualize the raw matrix: use the Rowv and Colv arguments as follow.

#plot raw matrix without reordering, this automatically excludes the dendrogram
#No dendrogram nor reordering for neither column or row
heatmap(mtcars, Colv = NA, Rowv = NA, scale="column")


###------colour palette customization------
#there are basic colour palettes you can use that come with base R, with more options being available in the RColorBrewer package
#cyan-magenta in base
heatmap(mtcars, scale ="column", col=cm.colors(256))
#terrain 
heatmap(mtcars, scale ="column", col=terrain.colors(256))

#rcolorbrewer palettes
display.brewer.all()
heatmap(mtcars, scale = "column", col=brewer.pal(8, "BuGn"))


##publication prep
#add x and y labels
heatmap(mtcars, Colv = NA, Rowv = NA, scale = "column", col=brewer.pal(8, "BuGn"), xlab = "Variables", ylab = "Cars", main = "Mtcars Heatmap")
#edit labrow labels, size, and margins
heatmap(mtcars, Colv = NA, Rowv = NA, scale = "column", col=brewer.pal(8, "BuGn"), 
        xlab = "Variables", ylab = "Cars", main = "Mtcars Heatmap",
        cexRow = 1, cexCol = 1,
        labRow = paste(rownames(mtcars), sep = ""),
        labCol = paste(colnames(mtcars), sep = ""), 
        margins=c(5,10))
  
##adding in a colour guide using RowSideColors
guide=as.numeric(as.factor(substr(rownames(mtcars), 1, 1)))
guide_col=brewer.pal(9, "BuGn")[guide]
substr

##print final heatmap made in base R
baser_heatmap <- heatmap(mtcars, Colv = NA, Rowv = NA, scale = "column", col=brewer.pal(8, "BuGn"), 
        xlab = "Variables", ylab = "Cars", main = "Mtcars Heatmap",
        cexRow = 1, cexCol = 1,
        labRow = paste(rownames(mtcars), sep = ""),
        labCol = paste(colnames(mtcars), sep = ""), 
        RowSideColors = guide_col, 
        margins=c(5,10))

#######################Using Heatmaply 
heatmaply(mtcars)
#By default heatmaply tries to fix the margins of the plot based on the length of the labels, but this system is not perfect. Hence, we sometimes need to manually fix the margins (hopefully this will be fixed in future versions of plotly). This is also helpful when including xlab/ylab/main texts.
#add in some titles and edit margins
heatmaply(mtcars, xlab = "Features", ylab = "Cars", 
          main = "Heatmap of mtcars with Heatmaply",
          margins = c(60,100,40,20))
#scale using columns
heatmaply(mtcars, xlab = "Features", ylab = "Cars", 
          main = "Scaled Heatmap of mtcars with Heatmaply",
          margins = c(60,100,40,20),
          scale = "column")

#map the variables against themselves to create a correlation heatmap 
heatmaply(cor(mtcars), margins = c(40, 40),
          k_col = 2, k_row = 2,
          xlab = "", ylab = "", 
          main = "Correlation with Heatmaply")

#normalize the variables
heatmaply(normalize(mtcars), xlab = "Features", ylab = "Cars", 
          main = "Normalized Heatmap of mtcars with Heatmaply'",
          margins = c(60,100,40,20))

#identifying NA's using heatmaply_na()
heatmaply_na(mtcars, k_col =3, k_row = 3, margins = c(55, 30))
#testing it out on a dataset that actually has NA's
heatmaply_na(airquality, k_col =3, k_row = 3, margins = c(55, 30))



#changing colours 
display.brewer.all()
BuGn <- colorRampPalette(brewer.pal(9, "BuGn"))

heatmaply(mtcars, xlab = "Features", ylab = "Cars", 
          main = "Scaled Heatmap of mtcars with Heatmaply",
          margins = c(60,100,40,20),
          colors = BuGn,
          scale = "column")

#saving it as well
heatmaply(cor(mtcars), margins = c(40, 40),
          k_col = 2, k_row = 2,
          colors = BuGn,
          limits = c(-1,1),
          file = "folder/heatmaply_plot.png",
          browseURL("folder/heatmaply_plot.png"))

##saving the plot
#interactive version
dir.create("heatmaps")
heatmaply(mtcars, file = "heatmaps/heatmaply_plot.html")
browseURL("folder/heatmaply_plot.html")

webshot::install_phantomjs()

#static version
heatmaply(mtcars, file = "heatmaps/heatmaply_plot.png")
browseURL("heatmaps/heatmaply_plot.png")
