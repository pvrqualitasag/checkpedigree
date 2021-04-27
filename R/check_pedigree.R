
#' @title Check Pedigree
#'
#' @description
#' Simple check of pedigrees
#'
#' @details
#' Details about the function
#'
#' @importFrom readr read_delim
#'
#' @param ps_ped_file path to pedigree input file
#' @return list of check results
#'
#' @export check_pedigree
check_pedigree <- function(ps_ped_file){
  cat(" * Check pedigree file: ...", ps_ped_file, "\n")

  ## Reading Pedigree File
  tbl_ped <- readr::read_delim(file = ps_ped_file, delim = "|")

  ## Check Uniqueness of ID
  l_result <- list(unique_id = length(unique(tbl_ped$ID)) == nrow(tbl_ped))

  ## Check Sex of Parents
  vec_sire <- unique(tbl_ped$sire)
  vec_sire <- vec_sire[!is.na(vec_sire)]
  vec_sire_wrong_sex <- vec_sire[tbl_ped$sex[vec_sire] != "m"]
  l_result[["sire_wrong_sex"]] <- vec_sire_wrong_sex


  ## Result
  return(l_result)

}
