#### Data frames e matrizes ####

#data.frame são as tabelas do R, equivalente as planilhas eo Excel
#São basicamente vetores (da mesma classe ou diferentes classes) enfileirados como colunas

#Vamos importar um dataframe de examplo do próprio R
data(iris)

#Exercicio: peça ajuda do R para saber o que faz a função data() e o que é iris

#Texto na wikipedia bem legal sobre o conjunto de dados:
#https://pt.wikipedia.org/wiki/Conjunto_de_dados_flor_Iris

#Existem 3 maneiras de visualizar um data.frame
iris #Mostra no console
View(iris) #Abre uma tabela ao lado do script
#Ou simplesmente clique no icone de tabela no environment

#Podemos ver as primeiras 6 linhas do dataframe usando a função head()
head(iris)
#E as 6 ultimas usando tail()
tail(iris)

#Acessando coluns com o operador $
colnames(iris) #Obter nomes das colunas
iris$Sepal.Length
#Exercicio: acesse as outras colunas de iris usando $
#Dica: após digitar $, utilize a tecla tab para autocompletar



#Exercicio: quais as classes de cada uma das colunas de iris? Qual a classe da coluna Species?


#Factor é um character organizado em niveis (variaveis categoricas)
#A diferença, é que internamente o R lê os factors como numeros representando categorias
#Classe factor é essencial em modelos estatísticos que utilizam variavel resposta binária (0 ou 1)
#Podemos converter character, numeric e logical para classe factor usando as.factor()
as.factor(c(TRUE, FALSE))
class(as.factor(c(TRUE, FALSE)))
as.factor(c(1, 2, 3))
class(as.factor(c(1, 2, 3)))

#Fatores também podem ser convertidos para outras classes
as.logical(as.factor(c(TRUE, FALSE)))
class(as.logical(as.factor(c(TRUE, FALSE))))
#Depois vamos aprender como evitar colocar funções dentro de funções :)

#Também podemos acessar uma previa e a classe das colunas usando a função str()
str(iris) #Veja os valores da coluna Species

#Como cada coluna é um vetor, podemos fazer operações com ela
mean(iris$Sepal.Length)
sum(iris$Petal.Width)
iris$Sepal.Length * iris$Sepal.Width

#Para colunas character, é util obter os valores unicos com unique()
#Tente usar a função unique para ver os valores unicos da coluna "Species"

#Agora, use a função table() com a coluna de espécies.


#Como as colunas são vetores, podemos acessar a posição de elementos dentro delas
iris$Sepal.Width[1] #Primeiro valor (ou primeira linha) de Sepal.Width (confira na tabela se é isso mesmo)
iris$Species[100] #Espécie na linha 100 (veja que também aparecem os levels do vetor)


#Podemos descubrir em quais posições da tabela estão os valores da espécie versicolor. Confira na tabela se o resultado está correto
indices_versicolor <- which(iris$Species == "versicolor")


#Exercicio: Em quais posições da tabela estão os valores das outras espécies? crie objetos para salvar esses indices


#Como a tabela possui duas dimensões (linhas x colunas - nessa ordem), podemos selecionar valores considerando essas 2 dimensões
iris[100, 1] #Linha 100, coluna 1
iris[1, 5] #Linha 1, coluna 5
iris[79, 3] #Linha 79, coluna 1
#Cudiado para não inverter a ordem linhas x colunas
iris[1, 100] #Linha 1, coluna 100????
iris[3, 79] #Linha 3, coluna 79????
#O NULL (nulo) representa a ausência de um objeto. 

#Para selecionar todos os valores de uma coluna ou de uma linha, basta deixar o espaço em branco
iris[100, ] #Todas as colunas da linha 1
iris[, 2] #Todas os valoes das linhas da coluna 2
iris[, "Sepal.Length"] #Todos os valoes das linhas da coluna Sepal.Length (mesma coisa que iris$Sepal.Length )
iris$Sepal.Length #mesma coisa que iris[, "Sepal.Length"]
iris[10:20, 2] #Valores 10 A 20 das linhas da coluna 2
iris[c(10,20), 2] #Valores 10 E 20 das linhas da coluna 2

#Podemos usar os indices de cada espécies armazenados anteriormente para selecionar as tabelas
iris_versicolor <- iris[indices_versicolor, ]
#Faça o mesmo com as outras espécies (setosa e virginica)


#Exercicios:
#crie um objeto chamado setosa_virginica e selecione apenas os valores dessas espécies
#Lembre do operador |

#Crie um objeto chamado big_petal e selecione somente os valores de Petal.Length (comprimento da pétala) que estão acima da média
#Lembre da função mean() para obter a média
#Utilize as funções min() para se certificar que o menor valor selecionado em big_petal é maior que a média

#Quantas ocorrencias de cada espécie possuem petalas com comprimentos acima da média?
#Lembre da função table()

#Utilize a função max() para obter o maior valor de Petal.Length em iris
#Qual espécie tem o maior valor de Petal.Lenght?
#Dica: use iris$Species[indice indicando a posição do maior valor de petal lenght]


#Criando colunas
#Podemos criar colunas simplesmente colocando o nome da nova coluna após $ e preenchendo com valores
iris$Collector <- "Edgar Anderson"
#Crie uma coluna chamado Year (ano) e preencha com o ano em que Anderson coletou os dados (1935)

## Crie uma coluna chamada Petal.Sepal.Length.Ratio com o índice de proporção entre comprimento da pétala e sépala
# Petal.Length/Sepal.Length

#A maneira mais fácil de remover uma unica coluna, é atribuindo o valor null e ela
iris$Collector <- NULL
#Remova as colunas Year e Petal.Sepal.Length.Ratio


#### Listas ###
#Todo dataframe é uma lista! Por isso, podemos converter um dataframe em lista usando a função as.list()
iris_lista <- as.list(iris)
class(iris_lista)
View(iris_lista)
#Porém, as dimensões dentro de uma lista funcionam de maneira diferente de um dataframe
iris[1,1] #Selecionar primeiro valor da primeira coluna (dataframe)
iris_lista[1, 1] #Selecionar primeiro valor da primeira coluna (lista) - ERROR! 

#Listas geralmente são aninhadas (temos listas dentro de listas)
iris_lista[1]
class(iris_lista[1])
iris_lista[[1]]
class(class(iris_lista[1]))
#Por isso, geralmente usamos [[]] ao invés de [] para selecionar o primeiro elemento da lista
#Após seleciomnar qual elemento da lista você quer na maior hierarquia, basta selecionar o item colocando um outro colchetes a frente
iris[1] #Todos os itens do primeiro elemento (como lista)
iris_lista[[1]] #Todos os itens do primeiro elemento
iris_lista[[1]][1] #Primeiro valor do primeiro elemento
iris_lista[[1]][2] #Segundo valor do primeiro elemento
iris[2] #Todos os itens do segundo elemento (como lista)
iris[[2]] #Todos os itens do segundo elemento (como character)
iris_lista[[2]][1] #Primeiro valor do segundo elemento
iris_lista[[2]][2] #Segundo valor do segundo elemento

#Quando as posições de uma lista tem nome, podemos acessar seus valores diretamente utilizando o operador $
iris_lista$Sepal.Length
#Veja os outros elementos da lista

#Listas podem ser bastantes complicadas (listas aninhadas dentro de listas aninhadas dentro de listas aninhadas...)
#Por isso é importante nomear os elementos de todas as listas
#Veja como é mais dificil acessar os elementos de uma lista sem nome
lista_sem_nome <- iris_lista
names(lista_sem_nome)
names(lista_sem_nome) <- NULL
lista_sem_nome
View(lista_sem_nome)

#Podemos converter uma lista nomeada para um dataframe usando a função as.data.frame()
iris_df <- as.data.frame(iris_lista)

#Mas é melhor não fazer isso com uma lista sem nomes...
iris_df <- as.data.frame(lista_sem_nome)

#Por fim, podemos dividir um dataframe de acordo com uma coluna (de preferencia character ou factor)
#Para isso, use a função split()
iris_por_especie <- split(x = iris, #Data.frame
                          f = iris$Species) #Coluna para dividir
iris_split
names(iris_por_especie)
#Exercicio: acesse os dataframes dentro de iris_por_especie e veja os valores unicos de espécie

#Antes de passar para a proxima etapa, vamos exportar os dados de iris
#Primeiro, crie uma pasta chamado "Meus_dados"
dir.create("Meus_dados") #Cheque sua pasta para ver a pasta criada
#Caso não saiba onde está a pasta de trabalho, utilize getwd()
getwd()
#Você também pode checar a aba Files aqui do lado.

#Vamos salvar os dados em tres formatos: csv (comma separate value), txt (texto), RDS (R Data Structure) e RData
write.csv(x = iris, #Dados para salvar
          file = "Meus_dados/iris.csv", #Pasta e nome do arquivo (NÃO ESQUECE DO .csv)
          row.names = FALSE) #Não salva numero da linha como coluna
#Importante: mude o nome do arquivo. Se você nomear o arquivo com o nome de um arquivo que já existe na pasta, o R vai sobrepor sem avisar!
#Vamos usar a função write.csv2 para ver a diferença
write.csv2(x = iris, #Dados para salvar
          file = "Meus_dados/iris2.csv", #Pasta e nome do arquivo (NÃO ESQUECE DO .csv)
          row.names = FALSE) #Não salva numero da linha como coluna
#E, por fim, em txt
write.table(x = iris, #Dados para salvar
           file = "Meus_dados/iris.txt", #Pasta e nome do arquivo (NÃO ESQUECE DO .csv)
           row.names = FALSE) #Não salva numero da linha como coluna
#Salvar em RDS
saveRDS(object = iris, file = "Meus_dados/iris.RDS") #Agora com final RDS
#Salvar Rdata
save(list = c("iris", "iris_por_especie"), #Lista de arquivos para salvar
     file = "Meus_dados/iris.RData") #Agora com final RData

#Abra os arquivos externamente com o bloco de notas para ver a diferença
#O que separa as colunas? E qual o separador decimal?
#Qual deles abre corretamente com o Excel?

#Limpar o environment pela lista de comando
rm(list = ls())
gc()
#Por ultimo, salve o arquivo que abriu corretamente com o Excel no formato csv como iris3.csv

