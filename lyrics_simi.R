library(igraph)
library(tidyverse)
library(stringr)

dtm<-read.csv('/Users/jason/Desktop/artist_file_50.csv')
dtm2<-dtm[1:10000,]
dtm3<-dtm[dtm$Similarity>0.9,]
dtm4<-dtm3[dtm3$Artist1=="coldplay",]

#create edge list
edge_list <- df %>% select(Artist1, Artist2, Similarity)
edge_list <- edge_list %>% drop_na()
graph <- graph.data.frame(edge_list,directed=FALSE)

plot(graph,vertex.size = 15)


df<-dtm[dtm$Artist1=="coldplay",]


ecount(graph)
vcount(graph)
summary(graph)

aa<-(scale(dtm4$Similarity)+1)*10
aa<-??standardize(dtm4$Similarity, centerFun = mean, scaleFun = sd)

E(graph)$weight <- scale(dtm4$Similarity)+1
plot(graph,vertex.label = NULL,vertex.size = 15,edge.width=E(graph)$weight)
write.graph(graph = graph, file = "/Users/jason/Desktop/campnet.gml", format = "gml")


group_by(factor(dtm$Artist1))

a <-dtm%>%filter() %>% group_by(Artist1)  %>%count()
a


dtm2[,1]=as.character(dtm2[,1])
dtm2[,2]=as.character(dtm2[,2])
dtm2=as.matrix(dtm2) #igraph needs the edgelist to be in matrix format
g=graph.edgelist(dtm2[,1:2]) #We first greate a network from the first two columns, which has the list of vertices
E(g)$weight=as.numeric(dtm2[,3])

  
plot(g,vertex.size = 2)



