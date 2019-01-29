# Heatmaps_in_R
In this workshop we will be going over how to generate Heatmaps, a type of visualization popular for describing high-dimensional datasets (such as genomic or spatial) through the use of colour grids. Participants will learn how to generate these maps using the heatmap() function in base R, and interactive heatmaps using the package heatmaply, which works on top of ggplot2. This workshop will be geared towards beginners.

Participants are encouraged to come in with a basic knowledge of R functions and syntax structure, as well as some basic graphical knowledge including hex colour codes. Because this workshop will be made to be as accessible as possible, we would highly encourage tentative participants to come anyway.

Requirements

At bare minimum, R and RStudio. The most recent versions are preferred but because heatmap() functions remain largely the same you can stick with what you have if need be. Heatmaply requires R versions above 3.0.0 and it's dependencies.

Please run the following code ahead of time:

    install.packages('heatmaply')

Small datasets will be available for you to download during the workshop, but if you need one you can definitely use mtcars. Just run

    install.packages('mtcars')
