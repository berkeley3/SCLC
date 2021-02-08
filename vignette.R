# if(!require(pacman)) install.packages('pacman', dependencies = T)
# 
# p_load(arm,
#        arsenal,
#        dplyr,
#        here,
#        knitr,
#        janitor,
#        lubridate,
#        magrittr,
#        readxl,
#        tableone,
#        tidyr,
#        tidyverse
# )
# 
# 
# 
# wdir <- here::here()
# input_data <- file.path(wdir, 'data')
# 
# datatest <- read_excel(file.path(input_data, 'datatest.xlsx'))
# datatest <- datatest %>% 
#   clean_names()
# 
# flusso_sdo <- datatest %>% 
#   select(id_paziente:cod_int_secondario_5)
# flusso_sdo <- select_sdo(flusso_sdo)
# 
# flusso_sdo <- chemio_sdo(flusso_sdo)
# flusso_sdo <- radio_sdo(flusso_sdo)
# 
# 
# flusso_asa <- datatest %>% 
#   select(id_paziente, prestaz)
# 
# flusso_asa <- chemio_asa(flusso_asa)
# flusso_asa <- radio_asa(flusso_asa)
# 
# 
# flusso_farmaci <- datatest %>% 
#   select(id_paziente,atc, dt_erog)
# 
# library(poLCA)
# db_lca <- lca_data(flusso_sdo = flusso_sdo,
#          flusso_asa = flusso_asa,
#          flusso_farmaci = flusso_farmaci)
# 
# mod <- cbind(act_1, act_2, prest_1)~1
# my_lca_1 <- poLCA(mod, db_lca, nclass = 2)
# 
# plot(my_lca_1)
# poLCA(mod)
