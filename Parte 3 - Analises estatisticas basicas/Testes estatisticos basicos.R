################################################################
###               Testes estatisticos basicos                ###
###                  Rodrigo Heldt Silveira                  ###
###                  rodrigoheldt@gmail.com                  ###  
################################################################

#### Carregar pacotes ####
#install.packages("corrplot")
library(corrplot)


#### 1. Testes de diferencas de medias  ####

#### 1.1 Teste t-student ####

# Teste t-student: utilizado quando tem-se dois grupos (ex.: homens e mulheres) e uma variavel intervalar ou de razao (ex.: altura) 
#                  para a qual se quer se ha ou nao difenrenca entre as medias dos dois grupos.
#                  Utilizar a funcao 't.test()'

# H0 = nao ha diferenca entre as medias dos dois grupos
# H1 = ha diferenca entre as medias dos dois grupos

#### 1.1.1. Exemplo 1: SalarioPorHora X Mulher/Homem

# Contar quantas observacoes de cada grupo existem usando a funcao 'table'
table(base$Mulher) 

# Verificar se ha diferenca significativa entre as medias de salario dos grupos mulher e homem. 
t.test(base$SalarioPorHora ~ base$Mulher) # p-value = 6.394e-09   
                                          # p-value menor do que 0.05, entao ha diferenca significativa entre as medias de salario dos grupos Mulher e Homem.

# Fazer um boxplot para visualizar as medidas descritivas entre os dois grupos
plot(base$SalarioPorHora ~ base$Mulher) 

#### 1.1.2. Exemplo 1: Idade X PartTime/NonPartTime job


# Verificar se ha diferenca significativa entre as medias de idade dos grupos part-time e nao part-time job. 
t.test(base$Idade ~ base$PartTime)        # p-value = 2.2e-16 
                                          # p-value menor do que 0.05, entao ha diferenca significativa entre as medias de idade dos grupos part-time e nao part-time job.

# Fazer um boxplot para visualizar as medidas descritivas entre os dois grupos
plot(base$Idade ~ base$PartTime) 


#### 1.2 Analysis of Variance (ANOVA) #### 

# ANOVA: Esse teste e utilizado principalmente para medir a diferenca entre as medias quando tenho 3 ou mais grupos analisados de forma conjunta. 

# H0 = nao ha diferenca entre as medias dos dois grupos
# H1 = ha diferenca entre as medias dos dois grupos

anova <- aov(base$SalarioPorHora ~ base$Educacao)   
summary(anova)                                      # p-value = 2e-16   
                                                    # p-value menor do que 0.05, entao ha diferenca significativa entre as medias niveis de educacao 1, 2, 3 e 4.

# Fazer teste post hoc para verificar entre quais grupos ha diferenca de medias
TukeyHSD(anova) # Os resultados evidenciam que apenas a diferenca de médias entre os níveis 2 e 1 de educação nao sao significativas


#### 2. Análise de Correlacao ####

# Analise de Correlacao utilizando a funcao 'cor.test()' 
cor.test(base$SalarioPorHora, base$Idade)   # cor=0.50 / p-value = 2.2e-16 
                                            # p-value < 0.05, entao significante
cor.test(base$LogSalarioPorHora, base$Idade)   # cor=0.50 / p-value = 2.2e-16 
# p-value < 0.05, entao significante

m <- cor(base[, c("SalarioPorHora","LogSalarioPorHora", "Idade")])
corrplot(m)


##### Exercicio:
###

## E1: Verifique se ha diferenca de medias de Idade entre os grupos Mulheres x Homens

## E2: Verifique se ha diferenca de medias Idade por hora entre os grupos 1, 2, 3 e 4 de níveis de educacao

