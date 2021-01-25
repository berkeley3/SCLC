#' Genera un dataframe con prestazioni selezionate
#'
#' @param flusso_specialistica
#'
#' @return database con prestazioni selezionate sui codici 87.03.1, 87.41, 87.41.1, 88.01.1, 88.01.2,
#' 88.01.5, 88.01.6, 88.91.1 , 88.91.2 ,  92.11.7 ,   92.18.6,  99.25 ,   99.25.4 , 99.25.5 , 92.23.2 ,
#' 92.24.01 , 92.24.02 ,92.24.1,  92.24.2 , 92.24.3 , 92.24.B , 92.25.2, 92.25.1
#'
#'
#' @examples
#'
#' @export
#'



select_asa <- function(flusso_specialistica){
  dat <- flusso_specialistica %>%
    filter(PRESTAZ=='87.03.1' | PRESTAZ == '87.41' | PRESTAZ == '87.41.1' |
             PRESTAZ == '88.01.1' | PRESTAZ == '88.01.2' |
             PRESTAZ == '88.01.5' | PRESTAZ == '88.01.6' |
             PRESTAZ == '88.91.1' | PRESTAZ == '88.91.2' |
             PRESTAZ == '92.11.7' | PRESTAZ == '92.18.6'|
             PRESTAZ == '99.25' | PRESTAZ == '99.25.4' |
             PRESTAZ == '99.25.5' |
             PRESTAZ=='92.23.2' |
             PRESTAZ=='92.24.01' |
             PRESTAZ=='92.24.02' |PRESTAZ=='92.24.1'|
             PRESTAZ=='92.24.2' | PRESTAZ=='92.24.3' |
             PRESTAZ=='92.24.B' | PRESTAZ=='92.25.2'
           | PRESTAZ=='92.25.1')


  dat
}



