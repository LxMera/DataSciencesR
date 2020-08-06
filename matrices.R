library(dslabs)
data(tissue_gene_expression)

#189 observaciones y 500 caracteristicas
dim(tissue_gene_expression$x)

#189 resultados 7 tipos
table(tissue_gene_expression$y)

#Distancia euclidiana
d <- dist(tissue_gene_expression$x)

#Distancia entre observaciones
x <- tissue_gene_expression$x
sqrt(sum((x[1,] - x[2,])^2))   #cerebelo
sqrt(sum((x[39,] - x[40,])^2)) #colon
sqrt(sum((x[73,] - x[74,])^2)) #endometrias

y=tissue_gene_expression$y

image(as.matrix(d)[order(y), order(y)])
