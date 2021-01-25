#'
#'
#' @param sdo flusso sdo
#'
#' @return un database con pazienti selezionati per per diagnosi principale o secondatia
#'
#' @examples
#'
#' @export
#'



select_incidenti <- function(sdo){
  dat <- sdo %>%
    mutate(dia_prin_or = COD_PAT_principale,
           dia_uno_or = COD_PAT_secondario_1) %>%
    mutate_at(vars(dia_prin, dia_uno), klung) %>%
    filter(dia_prin | dia_uno)

  dat
}

