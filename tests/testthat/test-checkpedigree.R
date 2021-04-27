test_that("check_unique_id", {
  tbl_test_pedigree <- tibble::tibble(ID = c(1,1), sire = c(NA,NA), dam = c(NA,NA))
  readr::write_delim(tbl_test_pedigree, path = "/tmp/test_pedigree.txt")
  l_test_result <- check_pedigree(ps_ped_file = "/tmp/test_pedigree.txt")
  expect_equal(l_test_result$unique_id, FALSE)
})
