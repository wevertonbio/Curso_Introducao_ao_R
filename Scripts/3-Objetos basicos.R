#### 2 - Criando objetos básicos no R####

#Um objeto é simplesmente um nome que guarda um valor.
#Para criar um objeto, utilizamos o operador <-.
resultado <- 1 + 1 #Observe o Environment
resultado
print(resultado) #Desnecessário usar print


#JAMAIS USE ESPAÇO PARA NOMEAR OBJETOS!!!!
resultado b <- 2 * 4
#EVITE USAR CARACTERES~^ESPECIAIS, CAPSLOCK E Letras Maisculas
#O nome deve começar com uma letra, mas pode ter numeros no meio ou final
2resultado <- 2 + 5
resultado2 <- 2 + 5
#Voce pode fazer operações usando objetos
resultado3 <- resultado * resultado2
#Use nomes curtos, mas que tenham algum significado
#Ex: res para resultado, mod ou m para mod, sp para espécie
#Cuidado para não nomear o objeto com o nome de uma função
#Cuidado para não sobrepor objetos
resultado
resultado <- 7 * 4
resultado

#O operador <- pode ser usado ao contrário  (não recomenado)
7 * 4 -> resultado4
resultado4

#Atividade
# Salve sua idade em um objeto chamado minha_idade.
#Em seguida, multiplique esse objeto por 365 e salve o resultado em um objeto chamado idade_em_dias


#### Classes de objetos ####
#A classe de um objeto é muito importante dentro do R. É a partir dela que as funções e operadores conseguem saber exatamente o que fazer com um objeto.
#Por exemplo, podemos somar dois números, mas não conseguimos somar duas letras (texto):

#Numero
class(minha_idade)
class(idade_em_dias)

#Texto (character)
#Crie um objeto chamado meu_nome e coloque seu nome
meu_nome <- "Weverton" #Para texto, use aspas
class(meu_nome)
#CUIDADO: UM NUMERO ENTRE PARENTESES NÃO É UM NUMERO
numero_texto <- "13"
class(numero_texto)
#Tente usar o falso numero em uma operação matematica
numero_texto * 2
meu_nome * numero_texto

# As classes mais básicas dentro do R são: numeric, character(texto) e logical
#Logical é simplesmente TRUE ou FALSO
teste_jovem <- minha_idade < 25 #ou
teste_jovem <- minha_idade <= 25
teste_jovem
class(teste_jovem)
teste_jovem <- TRUE
teste_jovem
class(teste_jovem)

#Agora, tente adivinhar a classe dos objetos abaixo (numeric, character e logical)
#Primeiro, abra o objeto. Depois, para conferir, use a função class()
obj1 <- 30
obj2 <- c(1, 2, 3, 4, 5, 6)
obj3 <- 1:100 
obj4 <- sample(x = 1:100, size = 15)
obj4b <- sample(x = obj3, size = 15)
obj5 <- "Objeto"
obj6 <- letters[1:10]
obj7 <- LETTERS[5:15]
obj8 <- obj1 %in% obj2
obj9 <- obj5 %in% tolower(obj6)

#Alguns objetos é da classe integer (nada mais é que um numero inteiro). Podemos converter para numeric usando a função as.numeric (Substitua X pelo numero do objeto)
obj4_numeric <- as.numeric(obj4)

#Agora, tente converter um dos objetos de texto para Numerico

#Tente converter um dos objetos numericos/integer para character


#### Trabalhando com vetores e index ####
#Quando um objeto é formado por vários items da mesma classe (numero, texto ou logico), chamamos esse objeto de vetor (numérico, de texto, lógico, etc)
#Exemplo de vetor numerico
obj3
obj4
#Exemplo de vetor de texto
obj6
obj7
#Exemplo de vetor lógico
obj8
obj9

#Você pode criar um vetor manualmente. Para isso, junte os items usando c()
vetor_numerico <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
vetor_numerico


##Com vetores numéricos, podemos fazer operações básicas
vetor_numerico * 2
vetor_numerico
vetor_numerico / 0 #Perceba o Inf de infinito e o NaN indicando indefinição matemática
10^350 #Inf também representa valores muito grandes para ser representado no computador
log(vetor_numerico) #Perceba o -Inf, de infinito (negativo)
vetor_numerico * vetor_numerico
#A situação pode ficar um pouco complicada quando temos vetores de tamanhos diferentes
vetor_numerico_diferente <- c(2, 3)
vetor_numerico_diferente * vetor_numerico

#Existem outros operadores especiais, como o multiplicador de matrix
vetor_numerico_diferente %*% vetor_numerico_diferente
#Operação acima é igual a:
2 * 2 + 3 * 3
vetor_numerico %*% vetor_numerico
#Operação acima é igual a:
0*0 + 1*1 + 2*2 + 3*3 + 4*4 + 5*5 + 6*6 + 7*7 + 8*8 + 9*9  + 10*10

#Sempre lembrando, não conseguimos fazer operações com character e logical
vetor_numerico * "a"
vetor_numerico * "2"

#Vamos agora trabalhar com vetores de texto
nomes <- c("Eduardo", "Eduarda", "Vitória", "Rafaela", "Luana", "Licet", NA,
           "Marcos", "Maria", "André", "Laryssa", "Suzel", "Luiza", NA,
           "Heloisa", "Urias", "Amanda", "Rafaela", "Isabella", "Liliane", "Aline",
           "Weverton", NA)
nomes
#Perceba que a maneira como criamos um vetor é diferente da maneira como o vetor é exibido no R:
#Não conseguimnos simplesmente copiar e colar os nomes se não forem separados por virgula
#Tente criar um objeto chamado nomes2 fazendo isso, apenas copiando e colando do console

#Podemos usar a função dput para obter no console uma versão "copiável" do vetor
dput(nomes)
dput(vetor_numerico)

#Tente criar um objeto chamado nomes2 fazendo isso, agora copiando o output de dput()

#Para ver os nomes em ordem alfabetica, use sort()
sort(nomes)

#Crie um objeto chamado nomes_em_ordem com os nomes em ordem alfabetica

#####################CHECK POINT - ALGUMA DÚVIDA?###########################

####TRABALHANDO COM INDICES DE VETORES####
#Qual o primeiro item do vetor nomes?
nomes
nomes[1]
#E o segundo, e o ultimo?
nomes[2]
nomes[19]
nomes[20]
nomes[22]
nomes[100]

#Para selecionar indices, use []. Se usar (), o R entende que o objeto é uma função:
nomes(1)


#No R, NA significa vazio. As vezes, é importante identificar os items vazios de um vetor
#Para identificar se existem itens vazios numa lista, utilize a função is.na
is.na(nomes)
any(is.na(nomes)) #Apenas diz se existem items duplicados (não diz qual)
which(is.na(nomes)) #Apenas diz se existem items duplicados (não diz qual)

#Para remover NA, utilize a função na.omit()
na.omit(nomes)
na.exclude(nomes)
#Exercicio: remova os NA do objeto nomes


#Perceba que o vetor ganhou duas novas caractreristas (atributos)
nomes
attributes(nomes)
#Para remover os atributos, podemos apenar converter o vetor para o formaro desejado (as.character ou as.numeric) ou atribuir o valor NULL para o atributo
#Usando conversão
nomes_sem_atributos <- as.character(nomes)
nomes_sem_atributos
#Atribuindo atributo nulo
nomes_sem_atributos <- nomes
attributes(nomes_sem_atributos) <- NULL
nomes_sem_atributos

#Exercicio: remova os atributos de nomes


#Em qual posição está seu nome no objeto nomes
nomes
#Podemos testar quais nomes são iguais a um nome, usando ==
nomes == "Weverton"
#ATENÇÃO: SE USAR APENAS UM =, VOCÊ ESTARÁ CRIANDO UM NOVO OBJETO
#Podemos testar quais nomes NÃO são iguais a um nome, usando !=
nomes != "Weverton"
#Podemos usar a função which() para saber a posição dos valores que retornam TRUE
which(nomes == "Weverton")
which(nomes != "Weverton")

#Temos pessoas com o mesmo nome?
duplicated(nomes) #Pega o ultimo item duplicado
duplicated(nomes, fromLast = TRUE ) #Pega o primeiro item duplicado
any(duplicated(nomes)) #Apenas diz se existem items duplicados (não diz qual)
sum(duplicated(nomes)) #Quantas duplicatas? (R soma apenas os TRUE)
which(duplicated(nomes)) #Pega o ultimo item duplicado
which(duplicated(nomes, fromLast = TRUE)) #Pega o primeiro item duplicado

#Mudar nomes nos indices
nomes[4] <- "Rafaela Bonet"
nomes[16] <- "Rafaela Passos"
nomes
duplicated(nomes)
any(duplicated(nomes)) #Apenas diz se existem items duplicados (não diz qual)
sum(duplicated(nomes)) #Quantas duplicatas? (R soma apenas os TRUE)
#Podemos usar o resultado do teste para selecionar items de um vetor e salvar num novo objeto
meu_nome <- nomes[nomes == "Weverton"]
meu_nome
meu_nome_2 <- nomes[which(nomes == "Weverton")]
meu_nome_2
outros_nomes <- nomes[which(nomes != "Weverton")]
outros_nomes
outros_nomes2 <- nomes[which(nomes != meu_nome)]
outros_nomes2
meu_nome == outros_nomes
outros_nomes == meu_nome

#Para selecionar mais de um indice, separe os indices usando c()
#Por exemplo, para selecionar as Rafaelas
nomes[c(4, 16)]
#Precisa usar o c(), sem isso não funciona
nomes[4, 16]
#Um vetor tem apenas uma dimensão.
#data.frames e matrizes possuem 2 dimensões
#é possivel criar objetos de n dimensões

#Usando grep e grepl para pattern match
which(nomes == "Rafaela") #Match exato
grepl("Rafaela", nomes) #pattern match: retorna TRUE e FALSE
which(grepl("Rafaela", nomes)) #pattern match: retorna indices por causa do which
grep("Rafaela", nomes) #pattern match: retorna indices sem which
which(rep("Rafaela", nomes)) #erro, porque grep já retorna indice

#Exercicio: crie um objeto chamado rafaelas e selecione os nomes das Rafaelas usando grepl ou grep

#Como selecionar mais de um nome de uma vez?
#Utilize o simbolo | que signica "ou"
nomes == "Weverton" | nomes == "Marcos"
which(nomes == "Weverton" | nomes == "Marcos")
nomes %in% c("Weverton", "Marcos")
which(nomes %in% c("Weverton", "Marcos"))

#Exercicio: crie um objeto chamado multiplos_nomes e selecione 3 nomes

#Com grepl, devemos colocar os strings separados por | dentro do parenteses
grepl("Rafaela", nomes) | grepl("Weverton", nomes)
grepl("Rafaela|Weverton", nomes)
grep("Rafaela|Weverton", nomes)

#Exercicio: crie um objeto chamado rafaela_et_al e selecione as Rafaelas e mais 3 nomes


#Para limpar o environment (remover todos os objetos) temos várias alternativas
#Remover objetos de um em um
rm(nomes)
rm(nomes)
rm(nomes_sem_atributos)
rm("rafaela_et_al") #Também funciona com objeto indicado como character
rm(list = c("meu nome", "vetor_numerico")) #Elementos listados em uma lista
rm(list = c("obj1", "obj2")) #Elementos listados em uma lista

#Ou simplesmente clique na vassourinha em Environment para remover tudo
#Após limpar o environment, é recomendável usar a função gc() para realizar a coleta de lixo da memória ram (remover objetos da memória ram)
?gc()
gc()
