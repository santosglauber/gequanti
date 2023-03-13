################################################################################
# Replicacao dos resultados do artigo 
# "City vs. Town residents’ place attachment, perceptions and support for 
# tourism development in a linear World Cultural Heritage Site"
# PlosONE 16(10): e0258365
# https://doi.org/10.1371/journal.pone.0258365


# Set-up ------------------------------------------------------------------

library(xlsx)
library(semTools)
library(semPlot)


# Download dataset --------------------------------------------------------

dataURL <- "https://ndownloader.figstatic.com/files/31050732"
temp <- tempfile(fileext = ".xlsx")
download.file(dataURL, destfile=temp, mode='wb')



# Load dataset ------------------------------------------------------------

dt <- read.xlsx(temp, sheetIndex = 1)
names(dt)



# Structural model --------------------------------------------------------

formula <- "
PI = ~ PI1 + PI3 + PI4
PD = ~ PD1 + PD2 + PD3
PAF = ~ PAF1 + PAF2 + PAF3
SB = ~ SB1 + SB2 + SB3
PP = ~ PP1 + PP2 + PP3 + PP4 + ST
NP = ~ NP1 + NP2 + NP4 + ST 
ST = ~ ST1 + ST2 + ST3 + ST4
PA = ~ PI + PD + PAF + SB + PP + NP + ST
"

fit <- sem(formula, dt)

fitMeasures(fit)
summary(fit)
standardizedSolution(fit)

semPaths(fit)
