# Título: SAZONALIDADE DA SOJA BRASILEIRA
# Autor: Relatório por: Ricardo Aguirre Leal (ricardo.leal@furg.br)
# Data: Versão 1.0 -- format(Sys.time(), "%d de %B de %Y")

# Bibliotecas
library(readxl)
library(fda)
library(KernSmooth)
library(foreach)
library(stargazer)
library(seasonal) # para X13-ARIMA/SEATS
library(dynlm)
library(tsDyn)
library(strucchange)
library(forecast)
library(vars)
# library(doParallel); (ncores=detectCores())
# library(beepr); library(iterators)
# library(foreign); library(visreg)
# ---------
# Tydiverse:
library(dplyr)
library(tidyr)
library(ggplot2)
library(tibble)
library(lubridate)
library(purrr)    # MASKED "accumulate"; and "when" from foreach
# ---------
library(magrittr) # MASKED '%>%' from dplyr; 'extract' from tidyr; and 'set_names' from purrr
library(seasonalview) # "view" masked by tibble


# Caminho dos dados
main_dir <- getwd()
exp_path <- file.path(main_dir, "exportacao.xlsx")

# Leitura dos dados
export <- read_xlsx(exp_path)

# Cabeçalho das tabelas de dados
head(export)

# Função para criar as séries de tempo
f_ts <- function(x, a, m) ts(x, start = c(a, m), freq = 12)

# Série temporal
ts_export = f_ts(select(export, "qtd_exp"), a=export$ano[1], m=1)

# Ajuste sazonal via X13-Arima com transformação log
seas_export = seas(ts_export, transform.function = "log", x11 = "")
summary(seas_export)

### Sazonalidade da exportação de soja: Quantidade exportada
# Usando sazonalidade variando no tempo, com X13_ARIMA/SEATS
autoplot(seas_export)

ssazon = seas_export$series$d10
autoplot(ssazon)
ggmonthplot(ssazon)

### Ajustando modelo ARIMA e sazonalidade manualmente (seas)
regarima1 = seasonalview::view(seas_export)

### Ajustando modelo ARIMA automaticamente
(regarima1 = auto.arima(select(export, 5), seasonal = T) )

### Definindo modelo SARIMA manualmente
(regarima3 = arima(x = select(export, 5), c(2,1,1), seasonal = c(1,0,0)))
(regarima4 = arima(x = select(export, 5), c(2,1,1), seasonal = c(0,0,0)))

# ---------
# Testes de ajuste dos modelo
Acf(ts_export, 36)
Pacf(ts_export, 36)

Acf(resid(seas_export))
Pacf(resid(seas_export))

Acf(resid(regarima1))
Pacf(resid(regarima1))

shapiro.test(resid(regarima1))
shapiro.test(resid(seas_export))
hist(resid(seas_export))
# um valor de p < 0.05 indica que você rejeitou a hipótese nula
# ou seja, seus dados não possuem distribuição normal

time_index = 1:length(ts_export)
efp_res <- efp(ts_export ~ time_index)
plot(efp_res)
# (H0): Não há diferença nos parâmetros do modelo 
# antes e depois do ponto de quebra.

#++++++++++++++
#Correlação

var1 = rnorm(100, 30, 20)
var2 = var1 + runif(100, 20, 50)
cor(var1, var2)
reg1 = lm(var2 ~ var1)
summary(reg1)
plot(var1, var2, main = "Dispersão e Linha Regressão", 
     xlab = "Var1", ylab = "Var2")
abline(reg1, col = "blue", lwd = 20)

# Grafico com ggplot2
dados <- data.frame(var1, var2)
ggplot(dados, aes(x = var1, y = var2)) +
  geom_point() +                         # Plota os pontos
  geom_smooth(method = "lm", se = T, color = "red") +  # Adiciona a linha de regressão
  labs(title = "Gráfico de Dispersão com Linha de Regressão",
       x = "Var1",
       y = "Var2")




