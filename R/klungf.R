#' Genera un vettore con codici ATC
#'
#' @param ATC vettore con codici ATC
#'
#' @return valore logico in corrispondeza ai farmaci crizotinib, alectinib,
#' osimertinib, gefitinib, erlotinib, afatinib, bevacizumab, nivolumab, pembrolizumab,
#' etoposide, topotecan, irinotecan, atezolizumab, durvalumab, ceritinib

#'
#' @examples
#'
#' @export
#'



klungf <- function(ATC){
  res = (x =='L01XE16' |                                         # crizotinib
             x =='L01XE36' |                                          # alectinib
             x =='L01XE35' |                                        # osimertinib
             x =='L01XE02' |                                          # gefitinib
             x =='L01XE03' |                                          # erlotinib
             x =='L01XE13' |                                           # afatinib
             x =='L01XC07' |                                        # bevacizumab
             x =='L01XC17' |                                          # nivolumab
             x =='L01XC18' |                                      # pembrolizumab
             x =='L01CB01' |                                          # etoposide
             x =='L01XX17' |                                          # topotecan
             x =='L01XX19' |                                         # irinotecan
             x =='L01XC32' |                                       # atezolizumab
             x =='L01XC28' |                                         # durvalumab
             x =='L01XE44' |                                         # ceritinib
             str_trunc(x, 5, side = 'right', ellipsis = '')== 'L01XA') # LOIXA: composti a base di platino

}
