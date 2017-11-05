################################################################
###               Analises Descritivas básicas               ###
###                  Rodrigo Heldt Silveira                  ###
###                  rodrigoheldt@gmail.com                  ###  
################################################################


#### 1. Analises descritivas ####

mean(base$SalarioPorHora)    # Media: 114.9
sd(base$SalarioPorHora)      # Desvio padrao: 55.15
min(base$SalarioPorHora)     # Minimo: 32
max(base$SalarioPorHora)     # Maximo: 384
median(base$SalarioPorHora)  # Mediana: 100
summary(base$SalarioPorHora)
# Min.  1st Qu.  Median    Mean  3rd Qu.    Max. 
# 32.0     72.0   100.0   114.9    144.0   384.0 


# 1.2 Analises graficas basicas:

plot(base$SalarioPorHora,            # grafico de pontos    
     base$Idade,
     main = "Idade x Salario por hora",
     xlab = "Salario por hora", 
     ylab = "Idade")    

plot(base$LogSalarioPorHora,            # grafico de pontos    
     base$Idade,
     main = "Idade x Log salario por hora",
     xlab = "Log salario por hora", 
     ylab = "Idade") 


hist(base$SalarioPorHora)            # histograma
boxplot(base$SalarioPorHora)         # boxplot
barplot(sort(base$SalarioPorHora))   # grafico de barras da variavel 'base$SalarioPorHora' ordenado em ordem crescente


##### Exercicio
###

## E1 - Aplique a funcao summary sobre a variável Idade para verificar medidas descritivas 

## E2 - Calcule o desvio padrao da variavel Idade.

## E3 - Fazer um grafico de pontos plotando apenas a variavel Idade no grafico.

