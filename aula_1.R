# Colocando valores nos objetos para fazer calculos!
a <- 10
b <- 5
c <- a + b

quinze <- 15
trinta <- 30

# O R diferencia maiúsculas de minúsculas. Use apenas 'a' minúsculo se 'A' não existir.
A;a
quinze
trinta

# Comandos de ajuda.
help(plot)
?sum


# Verificar o diretório atual.
getwd() 

# Configurar o novo diretório (Atenção: no Windows, mude as barras para / ou use \\).
setwd("C:\\Users\\caleb\\OneDrive\\Desktop\\repositorios\\ATIVO\\R\\1-dados") 

# Listar os arquivos do diretório
dir() 

# Criar uma nova pasta.
dir.create("secao_1") 

readLines("CGIL_CNIg_2024.csv", 10)

# Ler arquivo CSV.
read.csv2() 

dados <- read.csv2("CGIL_CNIg_2024.csv", fileEncoding = "UTF-8")
names(dados)
dim(dados) #Número de Linhas e Colunas
nrow(dados) # Número de Linhas
ncol(dados) # Número de Colunas

# objeto.[linhas,colunas]
dados[,2] # Dados da coluna 2 
dados[2,] # Dados da linha 2 
dados[10:100,1:5] # Dados das linhas 10 a 100 das colunas 1 a 5 

a <- dados$andamento # Sequencia de dados em uma variavel.
a


dados$andamento # apresentar dados da coluna tal...

table(dados$andamento) # filtra a quantidade de dados iguais em determinada coluna e apresenta a chave e a quantidade de repetições.


c(7, 8, 9, 10) %in% c(8, 9) # Interseção ! Verifica se tais dados estão dentro de um vetor.


dados_deferidos <- dados[dados$andamento == "DEFERIDO",] # Pegar todas as colunas e dados que possuiem dado com valor "DEFERIDO".
head(dados_deferidos) # Apresenta os primeiros dados que foram guardados nessa variavel .

dados_ano_andamento <- dados[c("ano", "andamento")] # Concatenando daos! 

dados25 <- read.csv2("CGIL_CNIg_2024.csv", fileEncoding = "UTF-8")

dados25_filtrados25 <- dados25 [
                              dados25$andamento == "DEFERIDO" &
                              dados25$mes %in% c(8, 9) &
                              dados25$modalidade == "CGIL" &
                              dados25$ano =="2025",
                              c("tipo_visto", "andamento", "amparo_legal", "modalidade", "mes", "ano", "valor_investimento_ajustado", 
                              "uf_estrangeiro", "data_nascimento", "genero", "escolaridade", "pais", "codigo_cbo")
                              ]

dados_filtrados <- dados [
                          dados$andamento == "DEFERIDO" &
                          dados$mes %in% 9 &
                          dados$modalidade == "CGIL" &
                          dados$ano =="2024",
                          c("tipo_visto", "andamento", "amparo_legal", "modalidade", "mes", "ano", "valor_investimento_ajustado", 
                          "uf_estrangeiro", "data_nascimento", "genero", "escolaridade", "pais", "codigo_cbo")
                          ]

names(dados_filtrados)
names(dados25_filtrados25)
names(dados_filtrados) == dados25_filtrados25

dados_finais <- rbind.data.frame(dados_filtrados, dados25_filtrados25)
names(dados_finais)

table(dados_finais$tipo_visto)

table(dados$tipo_visto)
table(dados25$tipo_visto)
