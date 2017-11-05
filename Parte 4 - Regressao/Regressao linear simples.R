################################################################
###                 Regressão Linear Simples                 ###
###                  Rodrigo Heldt Silveira                  ###
###                  rodrigoheldt@gmail.com                  ###  
################################################################

library(ftsa)
library(ggplot2)

# Ajustando modelo de regressao linear simples para a base de treinamento
reg.simples = lm(formula = SalarioPorHora ~ Idade,
               data = baseTrain)
summary(reg.simples)

reg.simplesLog = lm(formula = LogSalarioPorHora ~ Idade,
                 data = baseTrain)
summary(reg.simplesLog)


# Prevendo os valores do Log Salário por hora para a base de treinamento
y_pred = predict(reg.simplesLog, newdata = baseTrain)

# Visualizar os resultados da previsão para a base de treinamento
plot(x = baseTrain$Idade, y = baseTrain$LogSalarioPorHora, col = "Red")
lines(x = baseTrain$Idade, y = y_pred)

# Prevendo os valores do Log Salário por hora para a base de teste
y_pred = predict(reg.simplesLog, newdata = baseTest)


# Visualizar os resultados da previsão para a base de teste
plot(x = baseTest$Idade, y = baseTest$LogSalarioPorHora, col = "Red")
lines(x = baseTest$Idade, y = y_pred)

# Verificando medidas de precisão das previsões
error(true = baseTest$LogSalarioPorHora, forecast = y_pred, method = "mae")
exp(0.260642)

error(true = baseTest$LogSalarioPorHora, forecast = y_pred, method = "mape")

error(true = baseTest$LogSalarioPorHora, forecast = y_pred, method = "rmse")

#### Exercicio ####

#  E1 - Ajuste uma regressão simples a variavel dependente LogSalarioPorHora e a variavel independente Educacao em uma base de treinamento
#  E2 - Faça a previsão do LogSalarioPorHora a partir da variavel Educacao para uma base de teste
#  E3 - Cheque o mean absolut error entre os valores reais e os valores previstos de SalarioPorHora



# Visualizar os resultados da previsão para a base de treinamento - grafico mais sofisticado

ggplot() +
  geom_point(aes(x = baseTrain$Idade, y = baseTrain$LogSalarioPorHora),
             colour = 'red') +
  geom_line(aes(x = baseTrain$Idade, y = predict(reg.simplesLog, newdata = baseTrain)),
            colour = 'blue') +
  ggtitle('Log Salario por hora vs Idade (baseTrain)') +
  xlab('Idade') +
  ylab('Log Salario por hora')


# Visualizar os resultados da previsão para a base de teste - grafico mais sofisticado

ggplot() +
  geom_point(aes(x = baseTest$Idade, y = baseTest$LogSalarioPorHora),
             colour = 'red') +
  geom_line(aes(x = baseTest$Idade, y = predict(reg.simplesLog, newdata = baseTest)),
            colour = 'blue') +
  ggtitle('Log Salario por hora vs Idade (baseTest)') +
  xlab('Idade') +
  ylab('Log Salario por hora')
