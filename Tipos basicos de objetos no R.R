################################################################
###               Tipo basicos de objetos no R               ###
###                  Rodrigo Heldt Silveira                  ###
###                  rodrigoheldt@gmail.com                  ###  
################################################################


#### Tipos basicos de objetos no R ####

#### 1 Vetor ####

# Vetor: e um conjunto de dados unidimensional. 

## Vetores podem ser criados utilizando a funcao c(), que concatena determinados valores
# Criando um vetor com dados numericos
x <- 2
vetor_numerico <- c(0.5, 0.6, x) 
vetor_numerico                   

# Criando um vetor com caracteres (strings)
vetor_caracteres <- c("com", "para", "de")
vetor_caracteres 

## Vetores podem ser criados utilizando direto a criacao intervalos entre dois valores
# Criando um vetor com uma sequencia de número
v <- 9:29           
v

## Buscar o valor de uma determinada posicao de um vetor
# buscar o valor que esta na terceira posicao do vetor
v[3]

## Identificando que um objeto é da classe vector
is.vector(v)


#### 2. Matriz ####

# Matriz: É um conjunto de dados com duas dimensões: linhas e colunas. Todas as coluna precisam ser de apenas uma classe (todas com número, todas com texto, etc.)

## Matrizes podem ser criadas utilizando a funcao matrix.
# Por padrao, a funcao matriz organiza o valores coluna por coluna, comecando pelo primeiro
# elemento da primeira coluna
m <- matrix(1:6, nrow = 3, ncol = 2) 
m

## Buscar o valor de uma determinada posicao de uma matriz
# buscar o valor que esta na segunda linha e terceira coluna
m[2, 1]              

# buscar todos os valores da segunda linha. 
m[2,  ]              
# buscar todos os valores da terceira coluna.
m[ , 1]              

## Utilizar a funcao 'dim' para saber as dimensoes de uma matriz 
## (quantidade de linhas e quantidade de colunas)
dim(m)

## Identificando que um objeto é da classe matrix
is.matrix(m)


#### 3 Dataframes ####

# Dataframe: É um conjunto de dados com duas dimensões: linhas e colunas. Diferenciam-se das matrizes, pois sao tabelas nas quais cada coluna representa uma variavel que pode ter classe distinta das outras colunas.

## Criar data frames utilizando a funcao data.frame, que junta, por coluna, diferentes objetos.
num = 1:4
pais = c("Brasil", "Brasil", "Espanha", "EUA")

d <- data.frame(num, pais)
d

## Buscar o valor de uma determinada posicao de um dataframe
# buscar o valor que esta na segunda linha e segunda coluna
d[2, 2]       

# buscar todos os valores da segunda linha
d[2, ]        

# buscar todos os valores da primeira coluna
d[, 1]        

# buscar todos os valores da coluna chamada "num". Equivalente a 'd[,1]'
d[,"num"]    

# buscar todos os valores da coluna chamada "num" usando $. Equivalente a 'd[,1]'
d$num        


## Utilizar a funcao 'dim' para saber as dimensoes de um dataframe (quantidade de linhas e
## quantidade de colunas)
dim(d)

## verificar as primeiras linhas do data.frame para entender quais sao os dados existentes
head(d)

## Apresenta o nome de cada coluna (variavel) do data frame
names(d)  

## Identificando que um objeto é da classe data.frame
is.data.frame(d)




