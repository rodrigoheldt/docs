################################################################
###               Analises Descritivas basicas               ###
###                  Rodrigo Heldt Silveira                  ###
###                  rodrigoheldt@gmail.com                  ###  
################################################################

## 0. Importando a base de dados de um arquivo csv

base = read.csv("C:/Users/Rodrigo/Dropbox/Hands-on R Workshop/Parte 2 - Pre-processamento dos dados/Data.csv", 
                sep = ",")


### 1. Analises descritivas 

## Media
mean(base$SalarioPorHora)    

## Desvio padrao
sd(base$SalarioPorHora)      

## Minimo
min(base$SalarioPorHora)     

## Maximo
max(base$SalarioPorHora)     

## Mediana
median(base$SalarioPorHora)  

## Resumo com diversas estatíticas descritivas: 
## Minimo, Primeiro Quartil, Mediana, Mediam, Terceiro Quartil e Maximo
summary(base$SalarioPorHora)


### 2. Analises graficas basicas:

## Scatter plot de SalarioPorHora e Idade

plot(base$SalarioPorHora,             
     base$Idade,
     main = "Idade x Salario por hora",
     xlab = "Salario por hora", 
     ylab = "Idade")    

## Scatter plot de LogSalarioPorHora e Idade

plot(base$LogSalarioPorHora,           
     base$Idade,
     main = "Idade x Log salario por hora",
     xlab = "Log salario por hora", 
     ylab = "Idade") 

## Histograma
hist(base$SalarioPorHora)           

## Boxplot
boxplot(base$SalarioPorHora)        

# Grafico de barras com as medias do SalarioPorHora por sexo
media.salario.sexo <- by(data = base$SalarioPorHora, INDICES = base$Mulher, FUN = mean) 
bb <- barplot(media.salario.sexo, 
              xlab = "Homem = 0 / Mulher = 1",
              ylab = "Media de Salario por hora")
text(bb, media.salario.sexo-5, labels=round(media.salario.sexo))



## 3. Exercício

### E1 - Aplique a função summary sobre a variável Idade para verificar as medidas descritivas 

### E2 - Calcule o desvio padrão da variável Idade.

### E3 - Fazer um histograma da variável LogSalarioPorHora.

