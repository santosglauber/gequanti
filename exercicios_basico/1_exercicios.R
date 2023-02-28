
# Exercícios - Curso R - Capítulo 3 ---------------------------------------

#3.2.4
(1+sqrt(5))/2 #alternativa 1
(1+5^0.5)/2 #alternativa 2

#3.3.1
33 / 11 # Código 1
divisao <- 33 / 11 # Código 2
divisao
divisao^3
divisao-2
class(divisao)
rm(divisao)

#3.3.2
idade_em_meses <- 42*12
idade_em_dias <- idade_em_meses*30
idade_em_dias

#3.3.3
meu-objeto <- 1
meu==TRUE
meu=="Glauber"
`meu-objeto` <- 1
`meu-objeto`
`meu novo objeto` <- 10

#3.3.4
meu.objeto <- 1
meu.objeto
meu_objeto <- 1
meu_objeto

mtcars
iris

#3.5.1
nome <- "Glauber Eduardo de Oliveira Santos"
nome

#3.5.2
cidade <- "Santos"
estado <- "São Paulo"
nchar(cidade)
nchar(estado)
nchar("estado")

paste(cidade, estado)
paste0(cidade, estado)
paste(cidade, estado, sep = " - ")
paste(cidade, estado, sep = "")
paste(cidade, estado, sep = "|  ")
?paste


paste(cidade, estado, sep = " - ")
paste(cidade, "-", estado)
paste0(cidade, " (", estado, ")")


