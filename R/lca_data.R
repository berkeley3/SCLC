#' Genera un dataframe da utilizzare con la funzione POLCA
#'
#' @param flusso_asa
#' @param flusso_farmaci
#' @param flusso_sdo
#'
#' @return Un database da utilizzare con la funzione POLCA
#'
#' @examples
#'
#' @export
#'



lca_data <- function(flusso_asa, flusso_farmaci, flusso_sdo){

  dd <- full_join(flusso_asa, flusso_farmaci, by = 'id_paziente')

  catc <- dd %>%
    group_by(id_paziente, atc) %>%
    summarise(ncodact = n()) %>%
    ungroup() %>%
    dplyr::select(-ncodact) %>%
    group_by(id_paziente) %>%
    mutate(count=1:n())


  datc <- spread(catc, count, atc)


  prest <- dd %>%
    group_by(id_paziente, prestaz) %>%
    summarise(nprest = n()) %>%
    ungroup() %>%
    dplyr::select(-nprest) %>%
    group_by(id_paziente) %>%
    mutate(count=1:n())

  prest <- spread(prest, count, prestaz)

  my_na <- function(x){
    ifelse(is.na(x),'no',x)
  }


  act_prest <- full_join(prest,datc, by = 'id_paziente')
  act_prest <- act_prest %>%
    mutate_all(my_na)

  n_prest <- ncol(prest)-1
  
  n_act <- ncol(datc)-1

  names(act_prest)[2:(n_prest+1)] <- paste0('prest_',1:n_prest)
  names(act_prest)[(n_prest + 2): (n_prest + 1 + n_act)] <- paste0('act_',1:n_act)

  act_prest <- full_join(act_prest, flusso_sdo, by = 'id_paziente')


  temp <- flusso_asa %>%
    dplyr::select(id_paziente, chemio_s, radio_s) %>%
    filter(id_paziente%in%act_prest$id_paziente) %>%
    unique()%>%
    group_by(id_paziente) %>%
    summarise(chemios=sum(chemio_s), radios=sum(radio_s))

  temp2 <- inner_join(act_prest, temp, by = 'id_paziente')
  temp2 <- temp2 %>%
    mutate(chemio_1 = sum(chemio, chemios, na.rm=T),
           radio_1 = sum(radio, radios, na.rm = T))


  act_prest = temp2

  lca <- act_prest
  lca$prest_2b = ifelse(lca$prest_1=='92.23.2' | lca$prest_1=='92.24.01' |
                          lca$prest_1=='92.24.02' | lca$prest_1=='92.24.1'|
                          lca$prest_1=='92.24.2' | lca$prest_1=='92.24.3' |
                          lca$prest_1=='92.24.B' | lca$prest_1=='92.25.2'
                        | lca$prest_1=='92.25.1',1,0)

  lca$prest_1 <- factor(lca$prest_1, labels = 1:length(unique(lca$prest_1)))
  lca$prest_2 <- factor(lca$prest_2, labels = 1:length(unique(lca$prest_2)))
  lca$prest_3 <- factor(lca$prest_3, labels = 1:length(unique(lca$prest_3)))

  lca$act_1 <- factor(lca$act_1, labels = 1:length(unique(lca$act_1)))
  lca$act_2 <- factor(lca$act_2, labels = 1:length(unique(lca$act_2)))
  # lca$act_3 <- factor(lca$act_3, labels = 1:length(unique(lca$act_3)))
  # lca$act_4 <- factor(lca$act_4, labels = 1:length(unique(lca$act_4)))


  labs <- unique(lca$intervento)[!is.na(unique(lca$intervento))]
  lca$intervento = factor(lca$intervento, labels=labs)

  lca <- lca %>%
    mutate(chemio = ifelse(chemio_1 >1, 1, chemio_1),
           radio = ifelse(radio_1>1,1,radio_1))

  lca$chemio = factor(lca$chemio)
  lca$radio = factor(lca$radio)

  lca$flag = with(lca, ifelse(is.na(act_1) & is.na(act_2) & chemio==0,1,0))


  lca

}
