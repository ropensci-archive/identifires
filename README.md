identifires
=====



[![Build Status](https://travis-ci.org/ropenscilabs/identifires.svg?branch=master)](https://travis-ci.org/ropenscilabs/identifires)
[![codecov.io](https://codecov.io/github/ropenscilabs/identifires/coverage.svg?branch=master)](https://codecov.io/github/ropenscilabs/identifires?branch=master)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/identifires)](https://github.com/metacran/cranlogs.app)
[![cran version](http://www.r-pkg.org/badges/version/identifires)](https://cran.r-project.org/package=identifires)

identifiers.org API Client

## identifiers API Docs

See <https://identifiers.org/restws>

## Install

Development version


```r
devtools::install_github("ropenscilabs/identifires")
```


```r
library("identifires")
```

## Examples

collections


```r
idf_collections()
#> # A tibble: 644 x 8
#>    id           name   pattern  definition  prefix url   prefixed synonyms
#>  * <chr>        <chr>  <chr>    <chr>       <chr>  <chr>    <int> <list>  
#>  1 MIR:00000002 ChEBI  "^CHEBI… Chemical E… chebi  http…        1 <NULL>  
#>  2 MIR:00000003 Ensem… "^((ENS… Ensembl is… ensem… http…        0 <NULL>  
#>  3 MIR:00000004 Enzym… "^\\d+\… The Enzyme… ec-co… http…        0 <chr [3…
#>  4 MIR:00000005 UniPr… "^([A-N… The UniPro… unipr… http…        0 <chr [6…
#>  5 MIR:00000006 Taxon… "^\\d+$" The taxono… taxon… http…        0 <chr [3…
#>  6 MIR:00000007 BioMo… "^((BIO… BioModels … biomo… http…        0 <chr [1…
#>  7 MIR:00000008 MIRIA… "^MIR:0… MIRIAM Reg… miria… http…        0 <chr [2…
#>  8 MIR:00000009 ICD    "^[A-Z]… The Intern… icd    http…        0 <NULL>  
#>  9 MIR:00000010 IntAct "^EBI\\… IntAct pro… intact http…        0 <NULL>  
#> 10 MIR:00000011 Inter… "^IPR\\… InterPro i… inter… http…        0 <NULL>  
#> # ... with 634 more rows
```

resources


```r
idf_resources()
```

validate


```r
idf_validate()
```

metadata


```r
idf_metadata()
```

prefixes


```r
idf_prefixes()
```

## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/identifires/issues).
* License: MIT
* Get citation information for `identifires` in R doing `citation(package = 'identifires')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
