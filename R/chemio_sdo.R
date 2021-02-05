#' Aggiunge al flusso sdo una variabile chemio_dia e cjemio_int corrispondenti ai ricoveri con codici chemioterapici
#'
#'
#' @param flusso_sdo
#'
#' @return aggiunge al flusso sdo una variabile chemio_dia e chemio_int corrispondenti ai ricoveri con codici chemioterapici V5811, V5812, 9225
#'
#' @examples
#'
#' @export
#'



chemio_sdo <- function(flusso_sdo){
  dat <- flusso_sdo %>%
    mutate(chemio_dia = ifelse(cod_pat_principale=='V5811' | 
                                 cod_pat_secondario_1=='V5811'| 
                                 cod_pat_secondario_2=='V5811' | 
                                 cod_pat_secondario_3=='V5811' | 
                                 cod_pat_secondario_4=='V5811' | 
                                 cod_pat_secondario_5=='V5811' |
                                 cod_pat_principale=='V5812' | 
                                 cod_pat_secondario_1=='V5812'| 
                                 cod_pat_secondario_2=='V5812' | 
                                 cod_pat_secondario_3=='V5812' | 
                                 cod_pat_secondario_4=='V5812' | 
                                 cod_pat_secondario_4=='V5812' ,1,0),
           chemio_int = ifelse(cod_int_principale=='9925' | 
                                 cod_int_secondario_1=='9925' | 
                                 cod_int_secondario_2=='9925' | 
                                 cod_int_secondario_3=='9925' | 
                                 cod_int_secondario_4=='9925' | 
                                 cod_int_secondario_5=='9925' 
                                 ,1,0)) %>%
    mutate(chemio = ifelse(chemio_dia + chemio_int ==2,1,0))


  dat
}


