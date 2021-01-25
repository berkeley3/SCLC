#' Genera un vettore logico per selezionare le diagnosi di K polmone
#'
#' @param diagnosi_sdo vettore con codici diagnosi principale o secondaria
#'
#' @return valore logico in corrispondeza alle diagnosi principali o secondaria 1 162.x o 231.2
#'
#' @examples
#'
#' @export
#'


klung <- function(diagnosi_sdo){
  res = (str_trunc(as.character(x), 3, side = 'right', ellipsis = '')=='162'
         | x =='2312')
}

