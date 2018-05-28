# Repository

What is the effect of growing aquaculture on wild fish stocks?

## Repository structure 

```
-- AquaForce.Rproj
-- data
   |__all_salmon_lobster.csv
   |__data_for_model.csv
   |__data_for_salmon_lobster_model.csv
   |__FAO_data.csv
   |__FAO_data.rds
   |__fao_salmon_lobster.csv
   |__sau_data.rds
-- docs
   |__analysis.html
   |__analysis.Rmd
   |__exploring_data
   |__FishBae.Rmd
   |__FishBaeSTAN.rds
   |__FishBaeSTAN.stan
   |__model.html
   |__model.Rmd
   |__salmon_lobster.html
   |__salmon_lobster.Rmd
   |__se_DiD
   |__table.html
-- FishBae_GLM_R.Rmd
-- FishBaeSTAN.stan
-- raw_data
   |__FAO
   |__RAM
   |__SAU
-- README.md
-- scripts
   |__catch_country.R
   |__make_robust.R
   |__value_country.R
```
--------- 

# Data description

- FAO
   - Year-country-species aquaculture production and value
   - Year-country-region-species wildcaught fisheries production
- SAU
   - Year-country-species wildcaught fisheries production ("Reconstrucuted catches") and value
   - Obtained with [this](https://github.com/jcvdav/AquaForce/blob/master/scripts/catch_country.R) and [this](https://github.com/jcvdav/AquaForce/blob/master/scripts/value_country.R) functions
   Scientific names are not available in our thata, but this [pull request](https://github.com/ropensci/seaaroundus/pull/28) incorporates it into the [ropensci/seaaroundus](https://github.com/ropensci/seaaroundus) package. Just modify the functions above to select `sci_name = TRUE`
- RAM
   - RAM Legacy stock assessment database

# What we've tried

## [Data exploration](https://rawgit.com/jcvdav/AquaForce/master/docs/exploring_data/exploring_data.html)
- [Compare SAU and FAO catches](https://rawgit.com/jcvdav/AquaForce/master/docs/exploring_data/exploring_data.html#plot_sau_vs_fao)
- [Looked into Salmon as a possible case study] (https://rawgit.com/jcvdav/AquaForce/master/docs/exploring_data/exploring_data.html#looking_into_salmon)
- [First comparison of Salmon and Lobster (never had aquaculture)](https://rawgit.com/jcvdav/AquaForce/master/docs/exploring_data/exploring_data.html#get_salmon_and_lobster_data)

## [Analysis](https://github.com/jcvdav/AquaForce/blob/master/docs/analysis.Rmd)
- This first assessment looked good, so we moved forward. We [identified treated and control groups](https://rawgit.com/jcvdav/AquaForce/master/docs/analysis.html#identify_treatment_and_control_groups) and tried to run the analysis with different model specifications (equations found in link above).

## [Back to S-L](https://github.com/jcvdav/AquaForce/blob/master/docs/salmon_lobster.Rmd)
- It got to messy, so to meet with Chris we dialed back to [Salmon and lobster](https://rawgit.com/jcvdav/AquaForce/master/docs/salmon_lobster.html)

Our regressions and data are right, but we don't think that we have the economic theory to back-up our claims and generalize our results.

-------------

All (most?) models were also run in Stata by Albert.





