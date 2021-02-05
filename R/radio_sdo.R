#' aggiunge al flusso sdo una variabile radio_dia e radio_int corrispondenti ai ricoveri con codici radiologici
#'
#'
#' @param flusso_sdo
#'
#' @return aggiunge al flusso sdo una variabile radio_dia e radio_int corrispondenti ai ricoveri con codici radiologici V580, 9229, 9221,
#' 9222, 9223, 9224, 9225, 9226, 9227, 9228, 9229, 9230, 9231, 9232, 9239
#'
#' @examples
#'
#' @export
#'



radio_sdo <- function(flusso_sdo){
  dat <- flusso_sdo %>%
        mutate(radio_dia = ifelse(cod_pat_principale=='V580' | cod_pat_secondario_1=='V580'| cod_pat_secondario_2=='V580' | cod_pat_secondario_3=='V580' | cod_pat_secondario_4=='V580' | cod_pat_secondario_5=='V580' ,1,0),
           radio_int = ifelse(cod_int_principale=='9229' | cod_int_secondario_1=='9220' | cod_int_secondario_2=='9220' | cod_int_secondario_3=='9220' | cod_int_secondario_4=='9220' | cod_int_secondario_5=='9220' |
                                cod_int_principale=='9221' | cod_int_secondario_1=='9221' | cod_int_secondario_2=='9221' | cod_int_secondario_3=='9221' | cod_int_secondario_4=='9221' | cod_int_secondario_5=='9221' |
                                cod_int_principale=='9222' | cod_int_secondario_1=='9222' | cod_int_secondario_2=='9222' | cod_int_secondario_3=='9222' | cod_int_secondario_4=='9222' | cod_int_secondario_5=='9222' |
                                cod_int_principale=='9223' | cod_int_secondario_1=='9223' | cod_int_secondario_2=='9223' | cod_int_secondario_3=='9223' | cod_int_secondario_4=='9223' | cod_int_secondario_5=='9223' |
                                cod_int_principale=='9224' | cod_int_secondario_1=='9224' | cod_int_secondario_2=='9224' | cod_int_secondario_3=='9224' | cod_int_secondario_4=='9224' | cod_int_secondario_5=='9224' |
                                cod_int_principale=='9225' | cod_int_secondario_1=='9225' | cod_int_secondario_2=='9225' | cod_int_secondario_3=='9225' | cod_int_secondario_4=='9225' | cod_int_secondario_5=='9225' |
                                cod_int_principale=='9226' | cod_int_secondario_1=='9226' | cod_int_secondario_2=='9226' | cod_int_secondario_3=='9226' | cod_int_secondario_4=='9226' | cod_int_secondario_5=='9226' |
                                cod_int_principale=='9227' | cod_int_secondario_1=='9227' | cod_int_secondario_2=='9227' | cod_int_secondario_3=='9227' | cod_int_secondario_4=='9227' | cod_int_secondario_5=='9227' |
                                cod_int_principale=='9228' | cod_int_secondario_1=='9228' | cod_int_secondario_2=='9228' | cod_int_secondario_3=='9228' | cod_int_secondario_4=='9228' | cod_int_secondario_5=='9228' |
                                cod_int_principale=='9229' | cod_int_secondario_1=='9229' | cod_int_secondario_2=='9229' | cod_int_secondario_3=='9229' | cod_int_secondario_4=='9229' | cod_int_secondario_5=='9229' |
                                cod_int_principale=='9230' | cod_int_secondario_1=='9230' | cod_int_secondario_2=='9230' | cod_int_secondario_3=='9230' | cod_int_secondario_4=='9230' | cod_int_secondario_5=='9230' |
                                cod_int_principale=='9231' | cod_int_secondario_1=='9231' | cod_int_secondario_2=='9231' | cod_int_secondario_3=='9231' | cod_int_secondario_4=='9231' | cod_int_secondario_5=='9231' |
                                cod_int_principale=='9232' | cod_int_secondario_1=='9232' | cod_int_secondario_2=='9232' | cod_int_secondario_3=='9232' | cod_int_secondario_4=='9232' | cod_int_secondario_5=='9232' |
                                cod_int_principale=='9233' | cod_int_secondario_1=='9233' | cod_int_secondario_2=='9233' | cod_int_secondario_3=='9233' | cod_int_secondario_4=='9233' | cod_int_secondario_5=='9233' |
                                cod_int_principale=='9239' | cod_int_secondario_1=='9239' | cod_int_secondario_2=='9239' | cod_int_secondario_3=='9239' | cod_int_secondario_4=='9239' | cod_int_secondario_5=='9239' ,1,0)) %>%
    mutate(radio = ifelse(radio_dia + radio_int ==2,1,0))


  dat
}


