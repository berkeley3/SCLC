#' Genera  Un database con la selezione delle sdo sulla base degli interventi principale e secondatio (codici 31-35)
#'
#'
#' @param flusso_sdo
#'
#' @return Un database con la selezione delle sdo sulla base degli interventi principale e secondatio (codici 31-35) e crea una variabile intervento con ccodice 33
#'
#' @examples
#'
#' @export
#'



select_sdo <- function(flusso_sdo){
  dat <- flusso_sdo %>%
    mutate(intervento_p = str_trunc(as.character(cod_int_principale), 2, 'right', ellipsis = ''),
           intervento_1 = str_trunc(as.character(cod_int_secondario_1), 2, 'right', ellipsis = ''),
           intervento_2 = str_trunc(as.character(cod_int_secondario_2), 2, 'right', ellipsis = ''),
           intervento_3 = str_trunc(as.character(cod_int_secondario_3), 2, 'right', ellipsis = ''),
           intervento_4 = str_trunc(as.character(cod_int_secondario_4), 2, 'right', ellipsis = ''),
           intervento_5 = str_trunc(as.character(cod_int_secondario_5), 2, 'right', ellipsis = '')) %>%
    mutate_at(vars(intervento_p, intervento_1, intervento_2, intervento_3, intervento_4, intervento_5), as.numeric) %>%
    filter(intervento_p>31 & intervento_p < 35 |
             intervento_1>31 & intervento_1 < 35 |
             intervento_2>31 & intervento_2 < 35 |
             intervento_3>31 & intervento_3 < 35 |
             intervento_4>31 & intervento_4 < 35 |
             intervento_5>31 & intervento_5 < 35) %>%
    mutate(intervento = ifelse(intervento_p==33 | intervento_1==33 | intervento_2==33 | intervento_3==33 | intervento_4==33 | intervento_5==33,1,0))


  dat
}


