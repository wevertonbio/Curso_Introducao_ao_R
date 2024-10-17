#### FUNÇÕES DO R####
#Diferentemente dos objetos, as funções podem receber argumentos.
#Argumentos são os valores que colocamos dentro dos parênteses e que as funções precisam para funcionar (calcular algum resultado).
#Por exemplo, a função c() precisa saber quais são os valores que formarão o vetor que ela irá criar.
nomes <- c("Eduardo", "Eduarda", "Vitória", "Rafaela", "Luana", "Licet", 
           "Marcos", "Maria", "André", "Laryssa", "Suzel", "Luiza",
           "Heloisa", "Urias", "Amanda", "Rafaela", "Isabella", "Liliane", "Aline")
nomes
#A função sum() precisa saber quais numeros somar
sum(c(1, 2, 10))
sum(1, 2, 10)
#A função mean() precisa saber de quais numeros calcular a média
mean(1, 2, 10) #Não funciona como sum...
mean(c(1, 2, 10)) #precisa colocar dentro de um vetor

#Existem várias maneiras de saber quais argumentos a função precisa
#1 Ao abrir parenteses, aparece pop-up com uma prévia dos argumentos
#2 Com o cursor dentro do parenteses, tecle Tab (também aparece descrição dos argumentos)
seq.int()

#Para obter uma ajuda mais detalhada da função, peça ajuda (para a própria função)
?seq.int
?seq.int()
#Atalho: posicione o cursor na função (sem o ? no começo) e tecle F1 
seq.int()

#Exercicio: obtenha ajuda das funções mean, median, sum, class, na.omit, which(), dput e c()

#Utilize a função seq.int para criar uma sequencia de numeros de 0 a 100 de 2 em 2
seq.int(from = 0, to = 100, by = 2)

#Se você usar ??, o R irá procurar pela função (ou funções parecidas) em todos os pacotes instalados
??median
