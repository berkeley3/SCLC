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
        mutate(radio_dia = ifelse(COD_PAT_principale=='V580' | COD_PAT_secondario_1=='V580'| COD_PAT_secondario_2=='V580' | COD_PAT_secondario_3=='V580' | COD_PAT_secondario_4=='V580' | COD_PAT_secondario_5=='V580' ,1,0),
           radio_int = ifelse(COD_INT_principale=='9229' | COD_INT_secondatio_1=='9220' | COD_INT_secondario_2=='9220' | COD_INT_secondario_3=='9220' | COD_INT_secondario_4=='9220' | COD_INT_secondario_5=='9220' |
                                COD_INT_principale=='9221' | COD_INT_secondatio_1=='9221' | COD_INT_secondario_2=='9221' | COD_INT_secondario_3=='9221' | COD_INT_secondario_4=='9221' | COD_INT_secondario_5=='9221' |
                                COD_INT_principale=='9222' | COD_INT_secondatio_1=='9222' | COD_INT_secondario_2=='9222' | COD_INT_secondario_3=='9222' | COD_INT_secondario_4=='9222' | COD_INT_secondario_5=='9222' |
                                COD_INT_principale=='9223' | COD_INT_secondatio_1=='9223' | COD_INT_secondario_2=='9223' | COD_INT_secondario_3=='9223' | COD_INT_secondario_4=='9223' | COD_INT_secondario_5=='9223' |
                                COD_INT_principale=='9224' | COD_INT_secondatio_1=='9224' | COD_INT_secondario_2=='9224' | COD_INT_secondario_3=='9224' | COD_INT_secondario_4=='9224' | COD_INT_secondario_5=='9224' |
                                COD_INT_principale=='9225' | COD_INT_secondatio_1=='9225' | COD_INT_secondario_2=='9225' | COD_INT_secondario_3=='9225' | COD_INT_secondario_4=='9225' | COD_INT_secondario_5=='9225' |
                                COD_INT_principale=='9226' | COD_INT_secondatio_1=='9226' | COD_INT_secondario_2=='9226' | COD_INT_secondario_3=='9226' | COD_INT_secondario_4=='9226' | COD_INT_secondario_5=='9226' |
                                COD_INT_principale=='9227' | COD_INT_secondatio_1=='9227' | COD_INT_secondario_2=='9227' | COD_INT_secondario_3=='9227' | COD_INT_secondario_4=='9227' | COD_INT_secondario_5=='9227' |
                                COD_INT_principale=='9228' | COD_INT_secondatio_1=='9228' | COD_INT_secondario_2=='9228' | COD_INT_secondario_3=='9228' | COD_INT_secondario_4=='9228' | COD_INT_secondario_5=='9228' |
                                COD_INT_principale=='9229' | COD_INT_secondatio_1=='9229' | COD_INT_secondario_2=='9229' | COD_INT_secondario_3=='9229' | COD_INT_secondario_4=='9229' | COD_INT_secondario_5=='9229' |
                                COD_INT_principale=='9230' | COD_INT_secondatio_1=='9230' | COD_INT_secondario_2=='9230' | COD_INT_secondario_3=='9230' | COD_INT_secondario_4=='9230' | COD_INT_secondario_5=='9230' |
                                COD_INT_principale=='9231' | COD_INT_secondatio_1=='9231' | COD_INT_secondario_2=='9231' | COD_INT_secondario_3=='9231' | COD_INT_secondario_4=='9231' | COD_INT_secondario_5=='9231' |
                                COD_INT_principale=='9232' | COD_INT_secondatio_1=='9232' | COD_INT_secondario_2=='9232' | COD_INT_secondario_3=='9232' | COD_INT_secondario_4=='9232' | COD_INT_secondario_5=='9232' |
                                COD_INT_principale=='9233' | COD_INT_secondatio_1=='9233' | COD_INT_secondario_2=='9233' | COD_INT_secondario_3=='9233' | COD_INT_secondario_4=='9233' | COD_INT_secondario_5=='9233' |
                                COD_INT_principale=='9239' | COD_INT_secondatio_1=='9239' | COD_INT_secondario_2=='9239' | COD_INT_secondario_3=='9239' | COD_INT_secondario_4=='9239' | COD_INT_secondario_5=='9239' ,1,0)) %>%
    mutate(radio = ifelse(radio_dia + radio_int ==2,1,0))


  dat
}


