data<-read.csv(file.choose(),header=T)
head(data)
is.null(data)
library(corrplot)
summary(data)
dim(data)
iris<-data[-6]
head(iris)
as.data.frame(scale(iris))
corrplot(cor(iris), method = "number")
install.packages("cluster")
library(cluster)
library(NbClust)
kmm = kmeans(iris,3,nstart = 50,iter.max = 15) #we keep number of iter.max=15 to ensure the algorithm converges and nstart=50 to #ensure that atleat 50 random sets are choosen  
kmm
install.packages("factoextra")

#Elbow Method for finding the optimal number of clusters
set.seed(123)
# Compute and plot wss for k = 2 to k = 15.
iris.max <- 15
data <- iris
wss <- sapply(1:k.max, 
              function(k){kmeans(data, k, nstart=50,iter.max = 15 )$tot.withinss})
wss
plot(1:k.max, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",ylab="Total within-clusters sum of squares")
# Compute k-means with k = 4
set.seed(123)
km.res <- kmeans(data, 4, nstart = 25)
# Print the results
print(km.res)     
library(factoextra)
fviz_cluster(km.res, data, geom = "point", ellipse.type = "convex",  ggtheme = theme_bw())
