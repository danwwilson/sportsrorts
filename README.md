# sportsrorts

<!-- badges: start -->
<!-- badges: end -->

The goal of sportsrorts is to consolidate the publicly available data for successful grants from [Sports Australia](https://www.sportaus.gov.au), particularly in relation to the Community Sports Infrastructure (CSI) grants that were given by the Australian government in the lead up to the 2019 federal election.

The grants came under question in early 2020, and were seen as a slush fund to get the Liberal National coalition re-elected. This package has no opinion on the motives of people, however only aims to provide an accessible version of the published data.

## Installation

You can install the development version of this package with:

``` r
remotes::install_github("danwwilson/sportsrorts")
```

To use the package, first load it into memory

``` r
library(sportsrorts)
```


## Contents

At the moment the package maintains separate datasets for each of the grant types administered by Sports Australia. While the column structures may be consistent between datasets, sometimes the data may use a different format (particularly the `financial_year` column).

The grant data currently available is:

 - Community Sports Infrastructure (CSI) - `grants_csi`
 - Better Ageing (BA) - `grants_ba`
 - Active After-Schools Communities program (AASC) - `grants_aasc`
 - dAIS Athlete Grant (DAS) - `grants_das`
 - Elite Indigenous Travel and Accommodation Assistance program (EITAAP) - `grants_eitap`
 - Multicultural Youth Sports Partnership Program (MYSP) - `grants_mysp`
 - National Sporting Organisation (NSO) - `grants_nso`
 - Move It AUS - Participation (PAR) - `grants_par`
 - State/Territory Organisations (SPD Other) - `grants_spd`
 - Sporting Schools - `grants_ss`
 - Women Leaders in Sport (WLIS) - `grants_wlis`

``` r
grants_csi

#                                                 recipient_name recipient_type category home_state financial_year funding_amount
#   1:                   20107023157 Burwood District Bowls Club   Organisation      CSI        VIC    2018 / 2019          49850
#   2: ACT and Southern New South Wales Rugby Union Brumbies Ltd   Organisation      CSI        ACT    2018 / 2019         159168
#   3:                 Adelong Service Citizens and Bowling Club   Organisation      CSI        NSW    2018 / 2019          47280
#   4:                          Alexander Park Dressage Club Inc   Organisation      CSI        NSW    2018 / 2019          60000
#   5:                        Alice Springs Baseball Association   Organisation      CSI         NT    2018 / 2019          81801
#  ---                                                                                                                           
# 750:                                   Woden Valley Gymnastics   Organisation      CSI        ACT    2019 / 2020         160000
# 751:                     Wonthaggi Power Football Netball Club   Organisation      CSI        VIC    2019 / 2020          37857
# 752:                                       Yass Valley Council   Organisation      CSI        NSW    2019 / 2020         100000
# 753:                      Yeppoon Australian Football Club Inc   Organisation      CSI        QLD    2019 / 2020         146200
# 754:                   Yiyili Community Indigenous Corporation   Organisation      CSI         WA    2019 / 2020          58320
```

## Contributing

There is much to do to improve the useability of these data sets. At present the data doesn't have any loation information assigned to it. To make it useful it will be valuable to include some geographic information, at least a state and postcode, or possibly some local government area related to electoral areas.

Please note that the 'sportsrorts' project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.