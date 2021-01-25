#'
#'
#' @param flusso_specialistica
#'
#' @return database con nuova variable radio_s 0/1 indicante una prestazioni radioterapica (in corrispondenza ai codici 92.23.2, 92.24.01,
#' 92.24.02, 92.24.1, 92.24.2, 92.24.3, 92.24.B, 92.25.1, 92.25.2)
#'
#'
#' @examples
#'
#' @export
#'



radio_asa <- function(flusso_specialistica){
  dat <- flusso_specialistica %>%
    mutate(radio_s = ifelse(prestazione == '92.23.2' | prestazione ==' 92.24.01' |
                              prestazione == '92.24.02' | prestazione == '92.24.1'|
                              prestazione == '92.24.2' | prestazione == '92.24.3' |
                              prestazione == '92.24.B' | prestazione == '92.25.1' |
                              prestazione == '92.25.2',1,0 ))


    dat
}



