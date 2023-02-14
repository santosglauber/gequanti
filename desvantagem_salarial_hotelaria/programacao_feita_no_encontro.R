empregos <- read.csv("desvantagem_salarial_hotelaria/tabela6450.csv",
                     skip=4, sep=";")
head(empregos)

empregos <- empregos[1:5570, ]

empregos[empregos=="X"] <- NA
empregos[empregos=="-"] <- NA

names(empregos)

names(empregos) <- c(
  "Município (Código)",
  "Município",
  "Total_Pessoal ocupado assalariado",
  "55.10-8 Hotéis e similares_Pessoal ocupado assalariado",
  "Total_Salários e outras remunerações",
  "55.10-8 Hotéis e similares_Salários e outras remunerações")

names(empregos)

typeof(empregos$`55.10-8 Hotéis e similares_Pessoal ocupado assalariado`)
sum(empregos$`55.10-8 Hotéis e similares_Pessoal ocupado assalariado`)

empregos <- type.convert(empregos)
typeof(empregos$`55.10-8 Hotéis e similares_Pessoal ocupado assalariado`)
sum(empregos$`55.10-8 Hotéis e similares_Pessoal ocupado assalariado`, na.rm=TRUE)

empregos$salmedecon <- empregos$`Total_Salários e outras remunerações`/
  empregos$`Total_Pessoal ocupado assalariado`

hist(empregos$salmedecon)

empregos$salmedhot <- empregos$`55.10-8 Hotéis e similares_Salários e outras remunerações`/
  empregos$`55.10-8 Hotéis e similares_Pessoal ocupado assalariado`

hist(empregos$salmedhot)

empregos$desvantagem <- empregos$salmedhot / empregos$salmedecon - 1

hist(empregos$desvantagem)

empregos$regiao <- floor(empregos$`Município (Código)`/1000000)

empregos$rica <- ifelse((empregos$regiao==3 | empregos$regiao==4), 1, 0)

table(empregos$rica)

library(rstatix)
empregos %>% group_by(rica) %>% get_summary_stats(desvantagem, type="mean_sd")

boxplot(desvantagem ~ rica, empregos)

empregos %>% t_test(desvantagem ~ rica) %>% add_significance()

hist(log(empregos$desvantagem))
