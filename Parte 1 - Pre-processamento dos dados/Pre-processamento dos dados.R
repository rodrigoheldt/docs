################################################################
###  Pré-processamento dos dadoos para análises posteriores  ###
###                  Rodrigo Heldt Silveira                  ###
###                  rodrigoheldt@gmail.com                  ###  
################################################################

#### 1.1.Limpando memoria ####
rm(list=ls()) 

#### 1.2.Definindo o diretório de trabalho ####

setwd("C:/Users/Rodrigo/Dropbox/Hands on R Workshop/Parte 1 - Pré-processamento dos dados")


#### 1.3. Importando a base de dados de um arquivo csv ####
base = read.csv('Data.csv', sep = ",")

#### 1.4. Codificando variáveis categóricas ####
base$Mulher = as.factor(base$Mulher)
base$Educacao = as.factor(base$Educacao)
base$PartTime = as.factor(base$PartTime)

#### 1.5. Definindo variaveis numéricas ####
base$SalarioPorHora = as.numeric(base$SalarioPorHora)
base$LogSalarioPorHora = as.numeric(base$LogSalarioPorHora)
base$Idade = as.numeric(base$Idade)


#### 1.5. Divindindo a base em uma parte para treinamento dos modelos e outra para teste das previsões do modelo treinado ####

# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(base$SalarioPorHora, SplitRatio = 0.8)
baseTrain = subset(base, split == TRUE)
baseTest = subset(base, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)


#### 1.6 Exportar onjetos para o seu diretório de trabalho ####

# Caso eu queira exportar em csv as noovas bases criadas, posso salvar no meu diretório de trabalho os objetos do meu environment

write.csv(base, file="Data_new.csv", row.names= F)
