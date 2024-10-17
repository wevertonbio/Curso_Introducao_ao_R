####Tentando resolver erros com o chatgpt####
data(iris)

#No R, Porque essa função esta retornando NA?
numeros <- c(1:100, NA)
mean(numeros)

#Porque esse pacote não carrega no R?
library(dplir)


#No R, com o dataset iris, como selecionar apenas os valores da espécie setora?


#No R, usando o dataset iris como exemplo, porque o looping não está armazenando os resultados em um objeto?
data(iris)
#Vamos tirar a média das colunas numericas
for (i in colnames(iris[, -5])) {
  coluna_i <- iris[,i]
  media <- mean(coluna_i)
}


#No R, usando o dataset iris como exemplo, como calcular a média do comprimento da petala e criar uma nova coluna indicando se o tamanho está acima ou abaixo da média?

#Agora, como fazer isso considerando a media por espécie?

#No R, crie um exemplo reproduzivel de modelo linear para testar se a densidade de presas está correlacionada com a densidade de predadores. Gostaria que, nesse exemplo, a densidade de predadores afetasse negativamente a densidade de presas. Me explique detalhadamente como interpretar o output dos models.

#Agora, me ajude a fazer um plot mostrando os resultados desse modelo usando o ggplot


###Agora, elabore suas perguntas:
#Peça detalhes sobre os argumentos do ggplot
#Pergunte como salvar o plot do ggplot
