#'
#'
#' @param flusso_specialistica
#'
#' @return database con nuova variable chemio_s 0/1 indicante una prestazioni radioterapica (in corrispondenza ai codici 999.25, 99.25.4, 99.25.5)
#'
#'
#' @examples
#'
#' @export
#'



chemio_asa <- function(flusso_specialistica){
  dat <- flusso_specialistica %>%
    mutate(chemio_s = ifelse( prestaz == '99.25' |
                                prestaz == '99.25.4' |
                                prestaz == '99.25.5'|
                                prestaz == '992501' |
                                prestaz == '8901F0' ,1,0))


  dat
}



