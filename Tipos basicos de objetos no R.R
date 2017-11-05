################################################################
###               Tipo basicos de objetos no R               ###
###                  Rodrigo Heldt Silveira                  ###
###                  rodrigoheldt@gmail.com                  ###  
################################################################

#### 1 Tipos basicos de objetos no R ####

#### 1.1 Vetor ####

# Vetor: é um conjunto de dados unidimensional. 

# Vetores podem ser criados utilizando a funcao c(), que concatena determinados valores
vetor_numerico <- c(0.5, 0.6, x) # Criando um vetor
vetor_numerico                   ## 0.5  0.6  10.0

vetor_caracteres <- c("com", "para", "de")
vetor_caracteres 

# Vetores podem ser criados utilizando direto a criacao intervalos entre dois valores
v <- 9:29           # Criando um vetor
v                   ## 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29


#### 2.2. Matrizes ####

# Matriz: É um conjunto de dados com duas dimensões: linhas e colunas. Todas as coluna precisam ser de apenas uma classe (todas com número, todas com texto, etc.)

# Matrizes podem ser criadas utilizando a funcao matrix().
m <- matrix(1:6, nrow = 3, ncol = 2) # por padrao, a funcao matriz organiza o valores coluna por coluna, comecando pelo primeiro elemento da primeira coluna
m
#      [,1] [,2]
#[1,]     1    4
#[2,]     2    5
#[3,]     3    6


# Buscar o valor de uma determinada posicao de uma matriz
m[2, 1]              # buscar o valor que esta na segunda linha e terceira coluna
m[2,  ]               # buscar todos os valores da segunda linha. Assim, crio um vetor
m[ , 1]               # buscar todos os valores da terceira coluna. Assim, crio um vetor


# Utilizar a funcao 'dim' para saber as dimensoes de uma matriz (quantidade de linhas e quantidade de colunas)
dim(m)


#### 2.3 Dataframes ####

# Dataframe: É um conjunto de dados com duas dimensões: linhas e colunas. Diferenciam-se das matrizes, pois sao tabelas nas quais cada coluna representa uma variavel que pode ter classe distinta das outras colunas.

# Posso criar data frames utilizando a funcao data.frame, que junta, por coluna, diferentes objetos.
num = 1:4
pais = c("Brasil", "Brasil", "Espanha", "EUA")

d <- data.frame(num, pais)
d
#  num    pais
#    1  Brasil
#    2  Brasil
#    3 Espanha
#    4     EUA

class(d[ , 1])  # A primeira coluna tem classe "integer" (numero inteiro)
# "integer"
class(d[ , 2])
# "factor"   # A segunda coluna tem classe "factor" (categorico)

# Buscar o valor de uma determinada posi??o de um dataframe
d[2,2]       # buscar o valor que est? na segunda linha e terceira coluna
d[2,]        # buscar todos os valores da segunda linha
d[,1]        # buscar todos os valores da terceira coluna
d[,"num"]    # buscar todos os valores da coluna chamada "num". Equivalente a 'd[,1]'
d$num        # buscar todos os valores da coluna chamada "num". Equivalente a 'd[,1]'


# Utilizar a funcao 'dim' para saber as dimensoes de um dataframe (quantidade de linhas e quantidade de colunas)
dim(d)

# verificar as primeiras linhas do data.frame para entender quais sao os dados existentes
head(d)

# Apresenta o nome de cada coluna (variavel) do df
names(d)  




