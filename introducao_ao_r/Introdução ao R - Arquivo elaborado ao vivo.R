library(data.table)

dt <- fread("introducao_ao_r/chegadas_2022.csv", 
            encoding = "Latin-1") # UTF-8 é outra alternativa
dt
head(dt)
tail(dt)
View(dt)
names(dt)

dt$Via

table(dt$Via)
table(dt$Mês)

sum(dt$Chegadas)

dt[Via=="Marítima"]
dt[Mês=="Janeiro"]
dt[Via=="Marítima", Chegadas]
dt[Via=="Marítima", sum(Chegadas)] # Calcula o total de chegadas marítimas
dt[Via=="Marítima", sum(Chegadas), by=.(País)] # Calcula o total de chegadas marítimas por país

dt[, sum(Chegadas), by=.(País, Mês)] # Calcula o total de chegadas por país e mês
dt[, .(Soma=sum(Chegadas), Média=mean(Chegadas)), by=.(País)] # Calcula o total e a média de chegadas por país

dt[(País=="Argentina" & Via=="Terrestre"), .N] # Contar número de linhas

dt <- dt[, -c("cod continente", "cod pais")]
names(dt)

table(dt$País)
prop.table(table(dt$País))
table(dt$Continente, dt$Via)
prop.table(table(dt$Continente, dt$Via))
prop.table(table(dt$Continente, dt$Via), 1)
prop.table(table(dt$Continente, dt$Via), 2)

tabela_paises <- dt[, sum(Chegadas), by=.(País)]
write.csv(tabela_paises, "introducao_ao_r/tabela_paises.csv")

hist(dt$Chegadas)

dtg <- dt[, sum(Chegadas), by=.(Continente)]
dtg
barplot(dtg$V1, names.arg = dtg$Continente)
