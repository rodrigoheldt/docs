################################################################
###               Testes estatisticos basicos                ###
###                  Rodrigo Heldt Silveira                  ###
###                  rodrigoheldt@gmail.com                  ###  
################################################################

## 0.1. Carregar pacotes
#install.packages("corrplot")
library(corrplot)

## 0.2. Importando a base de dados de um arquivo csv

base <- read.csv("C:/Users/Rodrigo/Dropbox/Hands-on R Workshop/Parte 2 - Pre-processamento dos dados/Data.csv", 
                 sep = ",")

base$Educacao <- as.factor(base$Educacao)


## 1. Testes de diferença de médias

### 1.1 Teste t-student

#### Teste t-student: utilizado quando tem-se dois grupos (ex.: homens e mulheres) e uma variável intervalar ou de razão (ex.: altura) para a qual se quer se há ou não diferença entre as médias dos dois grupos.
#### Teste de hipótese: 
#### H0 = não há diferença entre as médias dos dois grupos
#### H1 = há diferença entre as médias dos dois grupos

#### 1.1.1. Exemplo 1: SalarioPorHora X Mulher/Homem


## Contar quantas observacoes de cada grupo existem usando a funcao 'table'
table(base$Mulher) 

## Verificar se ha diferenca significativa entre as medias de salario dos grupos mulher e homem. 
# p-value = 6.394e-09   
# p-value menor do que 0.05, entao ha diferenca significativa entre as medias de salario dos
# grupos Mulher e Homem.

t.test(base$SalarioPorHora ~ base$Mulher) 


## Fazer um boxplot para visualizar as medidas descritivas entre os dois grupos
boxplot(base$SalarioPorHora ~ base$Mulher) 

#### 1.1.2. Exemplo 1: Idade X PartTime/NonPartTime job

## Verificar se ha diferenca significativa entre as medias de idade dos grupos part-time e nao
## part-time job. 
# p-value = 2.2e-16 
# p-value menor do que 0.05, entao ha diferenca significativa entre as medias de idade dos 
# grupos part-time e nao part-time job.
t.test(base$Idade ~ base$PartTime) 

# Fazer um boxplot para visualizar as medidas descritivas entre os dois grupos
boxplot(base$Idade ~ base$PartTime) 



### 1.2 Análise de Variância (ANOVA) 

#### ANOVA: Esse teste e utilizado principalmente para medir a diferença entre as médias quando tem-se 3 ou mais grupos analisados de forma conjunta. 

#### Teste de hipótese: 
#### H0 = não há diferença entre as médias dos dois grupos
#### H1 = há diferença entre as médias dos dois grupos

#### 1.2.1. Exemplo 1: SalarioPorHora X Nível de educação


## Calucar as medias de SalarioPorHora por nivel de educacao
by(data = base$SalarioPorHora, INDICES = base$Educacao, FUN = mean)

## Verificar se ha diferenca significativa entre as medias de SalarioPorHora dos grupos 
## entre os grupos por nivel de educacao. 

# p-value = 2e-16   
# p-value menor do que 0.05, entao ha diferenca significativa entre as medias 
# niveis de educacao 1, 2, 3 e 4.

anova <- aov(base$SalarioPorHora ~ base$Educacao)   
summary(anova)                                      

## Fazer teste post hoc para verificar entre quais grupos ha diferenca de medias
# Os resultados evidenciam que apenas a diferenca de médias entre os níveis 2 e 1 de educação 
# nao e significativa
TukeyHSD(anova) 


## 2 Análise de Correlação

#### 2.1. Exemplo1: SalarioPorHora X Idade

# Analise de Correlacao utilizando a funcao 'cor.test()' 
# cor=0.50 / p-value = 2.2e-16 
# p-value < 0.05, entao significante
cor.test(base$SalarioPorHora, base$Idade)   

#### 2.2. Exemplo2: LogSalarioPorHora X Idade

# cor=0.50 / p-value = 2.2e-16 
# p-value < 0.05, entao significante
cor.test(base$LogSalarioPorHora, base$Idade)   


#### 2.3. Plotar correlações

m <- cor(base[, c("SalarioPorHora","LogSalarioPorHora", "Idade")])
corrplot(m)   



## 3. Exercício

## E1: Verifique se há diferença de médias de Idade entre os grupos Mulheres e Homens

## E2: Verifique se há diferença de médias de Idade entre os grupos 1, 2, 3 e 4 de níveis de educação



