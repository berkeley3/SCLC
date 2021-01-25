#'
#'
#' @param flusso_farmaci
#'
#' @return Un database con la selezione dei farmaci
#'
#' @examples
#'
#' @export
#'



select_farmaci <- function(flusso_farmaci){
  dat <- flusso_farmaci %>%
   mutate(selection = klungf(ATC)) %>%
    filter(selection)

  dat
}



