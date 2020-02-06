## code to prepare sportsrorts dataset goes here

library(rvest)
library(glue)
library(data.table)

scrape_rorts <- function(year, grant) {
  url <- glue::glue("https://www.sportaus.gov.au/grants_and_funding/grant_funding_report?sq_content_src=%252BdXJsPWh0dHAlM0ElMkYlMkZtYXRyaXhzc2lmcmVwb3J0LmF1c3BvcnQuZ292LmF1JTJGR3JhbnRzJmFsbD0x&recipientName=&recipientCategory={grant}&recipientType=&recipientState=&recipientYear={year}&pageSize=20000&sortOrder=name_asc")

  xml2::read_html(url) %>%
    rvest::html_nodes("table") %>%
    .[[1]] %>%
    rvest::html_table()
}

consolidate_rorts <- function(x) {
  tmp <- x %>%
    data.table::rbindlist() %>%
    unique()

  col_names <- names(tmp)

  setnames(tmp, col_names, tolower(gsub(" ", "_", col_names)))
  tmp[, funding_amount := as.numeric(gsub("[$,]", "", funding_amount))]

  tmp
}

# Move It AUS - Community Sport Infrastructure (CSI) ----------------------
grants_csi <- lapply(2008:2020, scrape_rorts, "CSI") %>%
  consolidate_rorts()

usethis::use_data(grants_csi)

# Move It AUS - Better Ageing (BA) ----------------------------------------
grants_ba <- lapply(2008:2020, scrape_rorts, "BA") %>%
  consolidate_rorts()

usethis::use_data(grants_ba)

# Active After-school Communities program (AASC) --------------------------
grants_aasc <- lapply(2008:2020, scrape_rorts, "AASC") %>%
  consolidate_rorts()

usethis::use_data(grants_aasc)

# dAIS Athlete Grant (DAS) ------------------------------------------------
grants_das <- lapply(2008:2020, scrape_rorts, "DAS") %>%
  consolidate_rorts()

usethis::use_data(grants_das)

# Elite Indigenous Travel and Accommodation Assistance program (EITAAP) ---
grants_eitaap <- lapply(2008:2020, scrape_rorts, "EITAAP") %>%
  consolidate_rorts()

usethis::use_data(grants_eitaap)

# Multicultural Youth Sports Partnership Program (MYSP) -------------------
grants_mysp <- lapply(2008:2020, scrape_rorts, "MYSP") %>%
  consolidate_rorts()

usethis::use_data(grants_mysp)

# National Sporting Organisation (NSO) ------------------------------------
grants_nso <- lapply(2008:2020, scrape_rorts, "NSO") %>%
  consolidate_rorts()

usethis::use_data(grants_nso)

# Move It AUS - Participation (PAR) ---------------------------------------
grants_par <- lapply(2008:2020, scrape_rorts, "PAR") %>%
  consolidate_rorts()

usethis::use_data(grants_par)

# State/Territory Organisations (SPD Other) -------------------------------
grants_spd <- lapply(2008:2020, scrape_rorts, "SPD") %>%
  consolidate_rorts()

usethis::use_data(grants_spd)

# Sporting Schools --------------------------------------------------------
grants_ss <- lapply(2008:2020, scrape_rorts, "Sporting+Schools") %>%
  consolidate_rorts()

usethis::use_data(grants_ss)

# Women Leaders in Sport (WLIS) -------------------------------------------
grants_wlis <- lapply(2008:2020, scrape_rorts, "WLIS") %>%
  consolidate_rorts()

usethis::use_data(grants_wlis)
