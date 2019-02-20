# scSimulator: a nonparametric scRNA-seq simulator

This is an R package for simulating scRNA-seq data for complex cell populations and lineages. The method can simulate all of the scRNA-seq platforms. The method can also simulate transcriptome signature with respect to cell type and state.

## Installation

```R
# dependency
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("preprocessCore", version = "3.8")

# install.packages("devtools")
## install without vignettes
# devtools::install_github("homopolymer/scSimulator")

## install with vignettes
git clone https://github.com/homopolymer/scSimulator.git
devtools::install(PATH_TO_SCSIMULATOR, build=TRUE, build_vignettes=TRUE, dependiences=TRUE, force=TRUE)
```

## Example of simulating neutrophil development
```R
library(scSimulator)
vignette("neutrophil")
```

Contributions of any size or form are welcome!
