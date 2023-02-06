################################################################################
# INTRODUÇÃO AO R
# Oficina do NEAT-USP para o grupo de estudos de análise quantitativa de dados


# Aspectos introdutórios --------------------------------------------------
# R
# R Studio
# Painéis do R Studio
# Objetos
# Scripts
# Referências de comandos e gerais


# Instalação e carregamento de pacotes ------------------------------------
# Instalar o pacote data.table
# install.packages("data.table")
library(data.table) # carregar o pacote data.table


# Importação de dados -----------------------------------------------------
# Baixar o arquivo de 2022 com os dados oficiais das chegadas de turistas ao Brasil
# Disponível em https://dados.turismo.gov.br/dataset/chegada-de-turistas-internacionais
# Salvar o arquivo em seu computador
dt <- fread("introducao_ao_r/chegadas_2022.csv") # importação de arquivo .csv para objeto data.table. Se necessário, ajuste o caminho do arquivo no seu computador.
head(dt) # ver as primeiras linhas do banco de dados. Note que as palavras acentuadas foram importadas com erros
dt <- fread("introducao_ao_r/chegadas_2022.csv", encoding = "Latin-1") # importação com encoding
head(dt) # agora os acentos foram importados corretamente


# Visualização de dados ---------------------------------------------------
head(dt) # apresenta as PRIMEIRAS linhas do banco de dados
tail(dt) # apresenta as ÚLTIMAS linhas do banco de dados
View(dt) # abre o banco de dados em uma nova aba (atenção: primeira letra do comando em maiúscula)
names(dt) # apresenta nomes das variáveis


# Organizacao de dados ----------------------------------------------------
dt[Via=="Aéreo"] # selecionar linhas com valores específicos
dt_aereo <- dt[Via=="Aéreo"] # salvar objeto da seleção
dt[, .(Continente, Chegadas)] # seleciona colunas
dt[, -c("Continente")] # seleciona todas as colunas, exceto as indicadas
dt[Continente=="Oceania", .(País, Chegadas)] # seleciona linhas e colunas


# Tabelas de contingência -------------------------------------------------
table(dt$Continente) # tabela de contagem simples
table(dt$Continente, dt$Via) # tabela de contagem cruzada
prop.table(table(dt$Continente, dt$Via), 1) # tabela de contingência com 100% nas linhas. Note que o atual banco de dados tem 3 linhas para cada país.
prop.table(table(dt$Continente, dt$Via), 2) # tabela de contingência com 100% nas colunas


# Medidas de resumo -------------------------------------------------------
sum(dt$Chegadas) # soma
mean(dt$Chegadas) # média
median(dt$Chegadas) # mediana
sd(dt$Chegadas) # desvio-padrão


# Medidas de resumo por categoria -----------------------------------------
dt[, sum(Chegadas), by=Continente] # soma de uma variável numérica por categoria de outra variável nominal
dt[, sum(Chegadas), by=.(Continente, País)] # soma de uma variável numérica por categorias duas variáveis nominais
dt[, .(media=mean(Chegadas), desvpad=sd(Chegadas)), by=Continente] # duas medidas resumo


# Gráficos R base ---------------------------------------------------------

# Gráfico de barras
dt_barplot <- dt[, .(Chegadas=sum(Chegadas)), by=Continente] # salvar soma por continente
dt_barplot
barplot(dt_barplot$Chegadas, names.arg = dt_barplot$Continente)

# Boxplot
dt_boxplot <- dt[Continente=="Oceania", .(Chegadas=sum(Chegadas)), by=.(País, Mês)]
dt_boxplot
boxplot(Chegadas ~ País, dt_boxplot)

# Gráfico de dispersão
dt_scatter <- dt[, .(Chegadas=sum(Chegadas)), by=.(País, Via)]
dt_scatter
dt_scatter <- dcast(dt_scatter, País ~ Via, value.var = "Chegadas")
dt_scatter
plot(dt_scatter$Aérea, dt_scatter$Terrestre)

# Gráfico de pizza
pie(dt_barplot$Chegadas, labels = dt_barplot$Continente)

# Histograma
dt_hist <- dt[Continente=="América do Sul", .(Chegadas=sum(Chegadas)), by=.(País)]
dt_hist
hist(dt_hist$Chegadas)