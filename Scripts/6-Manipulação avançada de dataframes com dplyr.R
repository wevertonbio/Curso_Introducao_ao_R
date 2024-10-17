#### MANIPULAÇÃO DE DATAFRAMES COM dplyr####

#Resumo das funções do dplyr:
#https://nyu-cdsc.github.io/learningr/assets/data-transformation.pdf


#Primeiro, carregue os pacotes
library(data.table)
library(dplyr) #Preste atenção nos warnings de sobreposição de funções
library(tidyr)

#Vamos continuar usando o dataset iris
data("iris")

#The following objects are masked from 'package:data.table': between, first, last
#Isso significa que as funções between, first e last existem nos dois pacotes, dplyr e data.table
#Como dplyr foi carregado por ultimo, por padrão ele sempre vai considerar as funções do pacote dplyr
#Para usar essas funções do pacote data.table, você precisa especificar com data.table::nome da função
?between
?dplyr::between
?data.table::between

#### Operador pipe ####
#Os pacotes dplyr e tidyr vem com o operador %>% (pipe), que ajuda a deixar a leitura do código de uma maneira mais humana (da esquerda pra direita)

#Sem pipe (O QUE TÁ ACONTECENDO AQUI??????????)
round(sd(c(sum(c(mean(iris$Sepal.Length), 10)), 100, 100)), digits = 3)


#Com pipe
mean(iris$Sepal.Length) %>% 
  c(10) %>% 
  sum %>% 
  c(100, 100) %>% 
  sd %>% 
  round(digits = 3)
  
#Com pipe, o resultado da função da esquerda entra como primeiro argumento da função a direita
#DICA: use e abuse da tecla TAB dentro das funções do dplyr, pois elas mostram os argumentos e as colunas disponiveis
####Exemplos de funções do pacote dplyr

# Filtrar apenas as observações da espécie "setosa"
?filter
iris_setosa <- iris %>%
  filter(Species == "setosa")
#Filtre as outras duas espécies



#Unir dois dataframes (colar um embaixo do outro)
setosa_versicolor <- iris_setosa %>% bind_rows(iris_versicolor)

#Una os 3 dataframes (setosa, versicolor e virginica) usando bind_rows


# Selecionar apenas as colunas "Sepal.Length", "Sepal.Width" e "Species"
?select
iris_selected <- iris %>%
  select(Sepal.Length, Sepal.Width, Species)

#Selecione apenas as colunas Species, Pepal.Length" e "Pepal.Width"

# Remover as colunas "Sepal.Length", "Sepal.Width"
#select: se usar - antes do nome da coluna, remove colunas
iris_removed <- iris %>%
  select(-Sepal.Length, -Sepal.Width)

# Remova as colunas "Pepal.Length", "Pepal.Width"

# Criar coluna com o índice de proporção entre comprimento da pétala e sépala 
?mutate
iris_modified <- iris %>%
  mutate(Petal.Sepal.Length.Ratio = Petal.Length / Sepal.Length)

#No mesmo dataframe (iris_modified), crie coluna com o índice de proporção entre largura (width) da pétala e sépala 

# Ordenar o dataset pela largura da pétala (Petal.Width) em ordem decrescente
?arrange
iris_sorted_petal <- iris %>%
  arrange(desc(Petal.Width))

# Ordene o dataset pelo comprimento da pétala (Petal.Width) em ordem crescente


# Calcular  média e desvio padrão geral da largura da pétala (Petal.Width)
?summarise
iris_summary_by_species <- iris %>%
  summarise(
    Mean_Petal_Width = mean(Petal.Width),
    SD_Petal_Width = sd(Petal.Width)
  )

# Calcular o numero de ocorrencias, média e desvio padrão da largura da pétala (Petal.Width) por espécie
?group_by
?n
iris_summary_by_species <- iris %>%
  group_by(Species) %>%
  summarise(
    Number_of_occurrences = n(),
    Mean_Petal_Width = mean(Petal.Width),
    SD_Petal_Width = sd(Petal.Width)
  )

# Calcule a mediana (median) e desvio padrão do comprimento da pétala (Petal.length) por espécie





#Por fim, limpe o ambiente e colete o lixo (da memória)