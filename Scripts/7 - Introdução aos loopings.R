#### LOOPINGS COM APPLY ###

#Looping no R consistem em aplicar uma mesma função a vários objetos dentro de uma matriz, dataframe ou vetor
#A maneira mais básica de fazer isso é usando o for in

#Criar vetor de numeros
numeros <- 1:100

#Quando usamos o for in, primeiro precisamos criar um vetor vazio
res <- c()
res

for (i in numeros) {
  res[i] <- i * 10
}
res

#Vamos fazer algo mais complicado com dataframes
data(iris)
#Vamos tirar a média das colunas numericas
media_por_colunas_for <- c()
media_por_colunas_for
for (i in colnames(iris[, -5])) {
  coluna_i <- iris[,i]
  media <- mean(coluna_i)
  media_por_colunas_for[i] <- media
}
media_por_colunas_for

#Vamos tirar a média das linhas numericas
media_por_linhas_for <- c() #Cria vetor vazio para armazenar resultados
media_por_linhas_for
for (i in 1:nrow(iris)) {
  linha_i <- iris[i, -5] %>% as.numeric()
  media <- mean(linha_i)
  media_por_linhas_for[i] <- media
}
media_por_linhas_for


#A família apply facilita a apliação de loopings sem usar o for in
media_por_linhas <- apply(X = iris[, -5], #Dados 
                     MARGIN = 1, #1 para aplicar função sobree linhas, 2 para colunas
                     FUN = mean) #Função para aplicar
media_por_linhas
media_por_coluna <- apply(X = iris[, -5], #Dados 
                          MARGIN = 2, #1 para aplicar função sobre linhas, 2 para colunas
                          FUN = mean) #Função para aplicar
media_por_coluna

#A função lapply retorna os resultados em uma lista
# Separar o dataset por espécie em listas
iris_por_spp <- split(iris[, -5], iris$Species)

# Calcular a média das medidas para cada espécie usando lapply
media_por_spp <- lapply(iris_por_spp, colMeans)

#Já a função sapply retorna os resultados numa matrix ou vetor (depende das dimensões)
media_por_spp_matrix <- sapply(iris_por_spp, colMeans)
media_por_spp_matrix
class(media_por_spp_matrix) #Retorna matrix pois tem 2 dimensoes

#Média geral de todos os valores por espécie
media_por_spp_vetor <- sapply(iris[,-5], mean)
media_por_spp_vetor
class(media_por_spp_vetor) #Retorna vetor numerico pois tem apenas 1 dimensao

