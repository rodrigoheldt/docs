################################################################
###  Pré-processamento dos dados para análises posteriores  ###
###                  Rodrigo Heldt Silveira                  ###
###                  rodrigoheldt@gmail.com                  ###  
################################################################

##  Pré-processamento dos dados para análises posteriores

## 1.Limpando memoria 

rm(list=ls()) 


## 2. Carregando (e instalando) pacotes de funções necessários

# install.packages('caTools') 
# Esse comando deve ser rodado apenas na primeira vez que você usar o pacote para
# instalá-lo em seu computador. Após instalado, a cada vez que for utilizá-lo basta
# carregar o pacote usando a função library 

library(caTools)


#### 3. Definindo o diretório de trabalho ####

setwd("C:/Users/Rodrigo/Dropbox/Hands-on R Workshop/Parte 2 - Pre-processamento dos dados")


#### 4. Importando a base de dados de um arquivo csv ####

# Usar a funcao read.csv

base = read.csv(file = 'Data.csv', sep = ",")

# Visualizar as primeiras linhas da base de dados importada. Usar a funcao head

head(base)

## 5. Codificando variáveis categóricas ####
# Usar a função as.factor para que o R transforme as variáveis desejadas na classe tipo fator (categórico)

base$Mulher = as.factor(base$Mulher)
base$Educacao = as.factor(base$Educacao)
base$PartTime = as.factor(base$PartTime)

#### 6. Definindo variaveis numéricas ####

# Usar a função as.numeric para que o R transforme as variáveis desejadas na classe 
# tipo numeric (número)

base$SalarioPorHora = as.numeric(base$SalarioPorHora)
base$LogSalarioPorHora = as.numeric(base$LogSalarioPorHora)
base$Idade = as.numeric(base$Idade)


#### 7. Divindindo a base em uma parte para treinamento dos modelos e outra para teste das previsões do modelo treinado


set.seed(123)
split = sample.split(base$SalarioPorHora, SplitRatio = 0.8)
baseTrain = subset(base, split == TRUE)
baseTest = subset(base, split == FALSE)


#### 8. Extra: Exportando objetos para o seu diretório de trabalho

# Caso eu queira exportar em csv as novas bases criadas, posso salvar no meu diretório
# de trabalho os objetos do meu environment

write.csv(x = base, file="Data_new.csv", row.names= F)

