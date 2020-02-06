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

grants_csi <- lapply(2008:2020, scrape_rorts, "CSI") %>%
  rbindlist() %>%
  unique()

col_names <- names(grants_csi)

setnames(grants_csi, col_names, tolower(gsub(" ", "_", col_names)))
grants_csi[, funding_amount := as.numeric(gsub("[$,]", "", funding_amount))]

usethis::use_data(grants_csi)

grants_ba <- lapply(2008:2020, scrape_rorts, "BA") %>%
  rbindlist() %>%
  unique()

col_names <- names(grants_ba)

setnames(grants_ba, col_names, tolower(gsub(" ", "_", col_names)))
grants_ba[, funding_amount := as.numeric(gsub("[$,]", "", funding_amount))]

usethis::use_data(grants_ba)

grants_aasc <- lapply(2008:2020, scrape_rorts, "AASC") %>%
  rbindlist() %>%
  unique()

col_names <- names(grants_aasc)

setnames(grants_aasc, col_names, tolower(gsub(" ", "_", col_names)))
grants_aasc[, funding_amount := as.numeric(gsub("[$,]", "", funding_amount))]

usethis::use_data(grants_aasc)

grants_das <- lapply(2008:2020, scrape_rorts, "DAS") %>%
  rbindlist() %>%
  unique()

col_names <- names(grants_das)

setnames(grants_das, col_names, tolower(gsub(" ", "_", col_names)))
grants_das[, funding_amount := as.numeric(gsub("[$,]", "", funding_amount))]

usethis::use_data(grants_das)

