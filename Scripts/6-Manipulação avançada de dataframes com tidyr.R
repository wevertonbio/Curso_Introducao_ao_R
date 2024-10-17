#### MANIPULAÇÃO DE DATAFRAMES COM tidyr####

#Resumo das funções do dplyr e tidyr
#https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf


#### Formato wider to longer (e vice-versa)####
#O tidyr é muito util para modificar o formato de dataframes.
#Por exemplo, transformar fatores/valores unicos dentro de colunas em colunas (longer to wider format)
#Ou para tranformar valores dentro de várias colunas em uma unica coluna (wider para longer format)

#Primeiro, carregue os pacotes
library(dplyr) 
library(tidyr)

#Vamos utilizar os dados de "fish_encounters"
?fish_encounters
data("fish_encounters")
View(fish_encounters)
#Esses dados estão no formato wider (valores armazenados em várias colunas) ou longer (armazenados em uma unica coluna)

#Podemos usar a função pivot_wider para obter um dataframe no formato wider, onde os fatores/valores unicos dentro uma coluna se transformam em colunas
#Muito util para transformar dados em uma matriz de presença e ausência, com as espécies nas colunas e os locais nas linhas
fish_wider <- fish_encounters %>% pivot_wider(names_from = fish, #Coluna para manter como coluna
                                            values_from = seen) #Coluna com valores para expandir em mais colunas
ncol(fish_encounters)
ncol(fish_wider)
#Podemos preencher os NAs com 0, indicando ausência
fish_pam <- fish_encounters %>% pivot_wider(names_from = fish, #Coluna para manter como coluna
                                            values_from = seen, #Coluna com valores para expandir em mais colunas
                                            values_fill = 0) #Valor para substiuir NAs

#Para voltar ao formato longer (mais linhas), usamos a função pivot_longer
fish_longer <- fish_wider %>% pivot_longer(cols = !station, #Coluna para preservar como coluna 
                                           names_to = "Peixe", #Nome da coluna que vai receber as colunas como fatores
                                           values_to = "Presença") #Nome da coluna que vai receber os valores
#Se adicionarmos na.omit, o dataframe se torna identico ao fish_encounters original
fish_longer2 <- fish_wider %>% pivot_longer(cols = !station, #Coluna para preservar como coluna 
                                           names_to = "Peixe", #Nome da coluna que vai receber as colunas como fatores
                                           values_to = "Presença") %>% #Nome da coluna que vai receber os valores
  na.omit()


####Separar valores dentro de uma coluna usando delimitador####
library(florabr)

#Vamos usar os dados da flora do brasil
#Antes, precisamos baixar os dados da flora do Brasil
#Crie uma pasta para salvar esses dados
dir.create("flora do brasil")
#Obter dados
?get_florabr
get_florabr(output_dir = "flora do brasil")
#Agora, podemos importar os dados baixados
bf <- load_florabr(data_dir = "flora do brasil")

#Vamos selecionar apenas as espécies de árvores nativas que são Angiospermas e com nome aceito
arvores <- bf %>% filter(taxonRank == "Species",
                         Group == "Angiosperms",
                         taxonomicStatus == "Accepted",
                         Origin == "Native")
#Agora, selecione apenas as colunas Species e Biome
arvores_bioma <- plantas %>% select(species, Biome)
#Perceba que os biomas de ocorrencia de cada espécie estão em uma coluna só, separado por ;
#Podemos usar a função separate_rows para separar esses valores
?separate_rows
arvores_sep <- arvores_bioma %>% separate_rows("Biome", sep = ";") %>%
  distinct() #Obter valores unicos

#Agora, podemos transformar o dataframe arvores_sep em uma matriz de presença e ausência (espécies nas linhas e Biomas nas colunas)
arvores_pam <- arvores_sep %>%
  mutate(presence = 1) %>% #Criar coluna com valor indicando presença
  pivot_wider(names_from = species, #Coluna para preservar como coluna 
              values_from = presence,
              values_fill = 0)
              

#Exercicio 1
#Da flora do Brasil, escolha uma outra forma de vida  e obtenha uma matriz de presença e ausência nos biomas
#Escolha somente espécies com nomes aceitos, nativas e endemicas do Brasil
#Dica: acesse os valores unicos de taxonRank, lifeForm, Origin, Group, taxonomicStatus, Biome e Endemism



#Quais as familias mais ricas da sua base de dados?
#Dica: use a função count() ou group_by() com summarize(n)
#Também pode usar arrange()

#Construa uma matriz de presença e ausência dos generos ao longos dos biomas
#Dica: use a função pivot_wider
#Atenção: matriz por genero, não espécie!
