################################################################
###                 Regressão Linear Simples                 ###
###                  Rodrigo Heldt Silveira                  ###
###                  rodrigoheldt@gmail.com                  ###  
################################################################

## 0 Carregar pacotes

#install.packages("ftsa")
library(ftsa)

## 1. Ajustando um modelo de regressão linear simples usando a base de treinamento

### 1.1 Modelo: SalarioPorHora = alpha + Idade

reg.simples = lm(formula = SalarioPorHora ~ Idade,
               data = baseTrain)
summary(reg.simples)


## 2. Prevendo os valores para a base de teste a partir dos modelos ajustes

## Prevendo os valores do SalárioPorHora para a base de teste
y_pred_simples = predict(reg.simples, newdata = baseTest)


## 3. Verificando a performance das previsões realizadas 


## Visualizar os resultados da previsão para a base de teste
plot(x = baseTest$Idade, y = baseTest$SalarioPorHora, col = "Red")
lines(x = baseTest$Idade, y = y_pred_simples)

## Verificando medidas de precisão das previsões
# Mean Absolut Error
mae <- error(true = baseTest$SalarioPorHora, forecast = y_pred_simples, method = "mae")
mae

# Mean Absolut Percentage Error
mape <- error(true = baseTest$SalarioPorHora, forecast = y_pred_simples, method = "mape")
mape

# Root Mean Square Error
rmse <- error(true = baseTest$SalarioPorHora, forecast = y_pred_simples, method = "rmse")
rmse



## 4. Exercício

###  E1 - Ajuste uma regressão simples com a variável dependente LogSalarioPorHora e a variável independente Mulher na base de treinamento


###  E2 - Faça a previsão do LogSalarioPorHora a partir da variavel Mulher na base de teste


###  E3 - Cheque o mean absolut error (mae) entre os valores reais e os valores previstos de SalarioPorHora

