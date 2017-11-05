################################################################
###                Regressão Linear Multipla                 ###
###                  Rodrigo Heldt Silveira                  ###
###                  rodrigoheldt@gmail.com                  ###  
################################################################

# Ajustando modelo de regressao linear multipla para a base de treinamento
reg.multipla = lm(formula = SalarioPorHora ~ Idade + Mulher + Educacao + PartTime,
                 data = baseTrain)
summary(reg.multipla)


reg.multiplaLog = lm(formula = LogSalarioPorHora ~ Idade + Mulher + Educacao + PartTime,
                 data = baseTrain)
summary(reg.multiplaLog)

reg.multiplaLog = lm(formula = LogSalarioPorHora ~ Idade + Educacao + PartTime,
                     data = baseTrain)
summary(reg.multiplaLog)


# Predicting the Test set results
y_pred = predict(reg.multiplaLog, newdata = baseTest)



# Verificando medidas de precisão das previsões
error(true = baseTest$LogSalarioPorHora, forecast = y_pred, method = "mae")
exp(0.163573)

error(true = baseTest$LogSalarioPorHora, forecast = y_pred, method = "mape")

error(true = baseTest$LogSalarioPorHora, forecast = y_pred, method = "rmse")


