#### Importando objetos ####

#Para importar uma tabela, se atente a 3 questões:
#Onde está o arquivo?
#Qual o separador de colunas?
#Qual o separador decimal?

#Um erro comum é tentar abrir um arquivo que não está na pasta
d <- read.csv("iris.csv")
#Você pode listar os arquivos e pastas no diretório com list.files()
list.files() #Lista todos os arquivos e pastas na pasta de trabalho atual

#Se você usar a opção recursive, você obtem os arquivos dentros das pastas também
list.files(recursive = TRUE)

#Se quiser listar apenas as pastas, use list.dirs()
list.dirs() #Por padrão, lista recursivamente
list.dirs(recursive = FALSE) #Apenas diretorios na pasta atual

#Agora, tente abrir o arquivo "iris.csv" salvo anteriormente com a função read.csv
#Leia o arquivo e atribua ao objeto d
#Dica: ao abrir aspas, tecle TAB para acessar arquivos e pastas
d <- read.csv("Meus_dados/iris.csv")

#Agora, tente abrir o "iris2.csv" a função read.csv (crie objeto d2)


#Agora, tente abrir iris2.csv com read.csv2


#Agora, tente abrir iris3.csv com read.csv e read.csv2 (crie objeto d3)


#Agora, tente abrir iris.txt com read.csv e read.csv2 (crie objetos d4 e d5)


#Agora, tente abrir iris.txt com read.table (crie objeto d6) - VEJA A PRIMEIRA LINHA


#Agora, tente abrir iris.txt com read.table() e adicionando o argumento header = TRUE (crie objeto d7)
#Veja a primeira linha DE NOVO


#Para entender porque alguns deram certo e outros não, abra o help da função read.csv
#A resposta para essas diferenças está nessas tres questões:
#Qual o separador de colunas?
#Qual o separador decimal?
#O arquivo tem cabeçalho?

#A verdade é que podemos abrir qualquer tabela com qualquer uma das funções acima, basta especificar o separador de colunas (sep), o separador decimal (dec) e se tem ou não cabeçalho (header)

#Exercícios
# Abra o arquivo "iris2.csv" com a função read.csv e cheque o numero de linhas (nrow) e colunas (ncol)
# Abra o arquivo "iris.csv" com a função read.table e cheque o numero de linhas e colunas
# Abra o arquivo "iris.txt" com a função read.csv2 e cheque o numero de linhas e colunas


#E como abris os arquivos RDS e RData?
d_rds <- readRDS("Meus_dados/iris.RDS")
d_rdata <- load("Meus_dados/iris.RData")

#Dicas:
# Quer abrir o arquivo com Excel? Salve e leia com write.csv2 e read.csv2
# Está trabalhando com uma tabela muito grande? Salve como RDS (só pode abrir no R)
# Para material suplementar de revista internacional, use write.csv ou RDS

#### Importando tabela com o pacote data.table ####
dt <- fread("Meus_dados/iris.csv")
#Faltou carregar o pacote :)
library(data.table)
#Tente usar a função fread para ler os arquivos csv e txt, veja a classe doS objetos e as classes das colunas
#Dica para ver classes das colunas de uma vez: str()


#Os arquivos foram lidos 100% corretamente?

#fread do pacote data.table quase sempre consegue detectar automaticamente o separador de colunas, mas não o separador decimal...
#Acesse o help da função fread para entender o porquê

#Tente novamente ler os arquivos iris2.csv e iris.txt com fread, mas agora especificando o separador decimal

#Também podemos salvar tabelas com o pacote data.table usando fwrite(). Tente fazer isso.

#Por fim, limpe o ambiente e colete o lixo (da memória)

#Se tiverem alguma tabela que queiram tentar abrir no R...