################################################################
###                Regressão Linear Multipla                 ###
###                  Rodrigo Heldt Silveira                  ###
###                  rodrigoheldt@gmail.com                  ###  
################################################################

## 0 Carregar pacotes

#install.packages("ftsa")
library(ftsa)


## 1. Ajustando um modelo de regressão linear múltipla usando a base de treinamento

### 1.1 Modelo: SalarioPorHora = alpha + Idade + Mulher + Educacao + PartTime

reg.multipla = lm(formula = SalarioPorHora ~ Idade + Mulher + Educacao + PartTime,
                  data = baseTrain)
summary(reg.multipla)

# Os resultados acima indicam que a variável Mulher não é significativa
# Assim, ajusta-se um novo modelo sem essa variável

reg.multipla = lm(formula = SalarioPorHora ~ Idade + Educacao + PartTime,
                  data = baseTrain)
summary(reg.multipla)



## 2. Prevendo os valores para a base de teste a partir dos modelos ajustes

## Prevendo os valores do SalárioPorHora para a base de teste
y_pred_multipla = predict(reg.multipla, newdata = baseTest)



## 3. Verificando a performance das previsões realizadas 

## Verificando medidas de precisão das previsões
# Mean Absolut Error
mae <- error(true = baseTest$SalarioPorHora, forecast = y_pred_multipla, method = "mae")
mae

# Mean Absolut Percentage Error
mape <- error(true = baseTest$SalarioPorHora, forecast = y_pred_multipla, method = "mape")
mape

# Root Mean Square Error
rmse <- error(true = baseTest$SalarioPorHora, forecast = y_pred_multipla, method = "rmse")
rmse



## 4. Exercício

###  E1 - Ajuste uma regressão multipla com a variável dependente LogSalarioPorHora e as variáveis independentes Idade, Mulher, Educacao e PartTime na base de treinamento

###  E2 - Faça a previsão do LogSalarioPorHora a partir das variaveis presentes no modelo final para a base de teste

###  E3 - Cheque o mean absolut percentage error (mape) entre os valores reais e os valores previstos de LogSalarioPorHora

