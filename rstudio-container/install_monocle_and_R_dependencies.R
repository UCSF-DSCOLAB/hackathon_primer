install.packages(c('BiocManager', 
                   'devtools'), 
                 repos='https://cloud.r-project.org')

devtools::install_version('RcppAnnoy', version='0.0.20', repos='https://cloud.r-project.org')

BiocManager::install(c('Rhdf5lib',
                       'png',
                       'BiocGenerics',
                       'DelayedArray',
                       'DelayedMatrixStats',
                       'limma',
                       'S4Vectors',
                       'SingleCellExperiment',
                       'SummarizedExperiment',
                       'MAST',
                       'batchelor',
                       'chromVAR',
                       'motifmatchr',
                       'DirichletMultinomial',
                       'TFBSTools',
                       'celldex', 
                       'SingleR',
                       'clusterProfiler',
                       'ComplexHeatmap',
                       'DESeq2',
                       'edgeR',
                       'GEOquery',
                       'scRepertoire'),
                       update=TRUE, site_repository='https://cloud.r-project.org')

BiocManager::install('dittoSeq')

install.packages(c('usethis',
                   'reticulate',
                   'xml2',
                   'systemfonts',
                   'units',
                   'grr',
                   'Matrix.utils',
                   'pbmcapply',
                   'pheatmap',
                   'proxy',
                   'pscl',
                   'rsample',
                   'RhpcBLASctl',
                   'slam',
                   'spdep',
                   'speedglm',
                   'RcppProgress',
                   'RcppArmadillo',
                   'Rcpp',
                   'rlang',
                   'tibble',
                   'irlba',
                   'ggplot2',
                   'tidyr',
                   'cowplot',
                   'dplyr',
                   'tidyverse',
                   'ape',
                   'ggpubr',
                   'spatstat',
                   'ggplot.multistats',
                   'ggExtra',
                   'ggraster',
                   'plotly',
                   'knitr',
                   'magmaR',
                   'optparse',
                   'UpSetR',
                   'ggalluvial',
                   'ggnewscale',
                   'yaml',
                   'SoupX',
                   'dsb',
                   'immunarch',
                   'enrichR'),
                 repos='https://cloud.r-project.org')

remotes::install_github('chris-mcginnis-ucsf/DoubletFinder')                 
remotes::install_github('cole-trapnell-lab/leidenbase', version = "0.1.9", upgrade=FALSE)
remotes::install_github('cole-trapnell-lab/monocle3', version = '1.3.1', upgrade=FALSE)
remotes::install_github('immunogenomics/harmony', version = '0.1.1', upgrade=FALSE)
remotes::install_github('satijalab/azimuth', version = '0.4.6')
remotes::install_github('satijalab/seurat', version = '5.1.0', upgrade=FALSE)
remotes::install_github("satijalab/seurat-data", version = "0.2.2")
remotes::install_github("mojaveazure/seurat-disk", version = '0.0.0.9020')
