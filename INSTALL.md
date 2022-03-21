Install FRM_assm pipeline
=========================

It is possible to use this pipeline with Apple Silicon Macs, either through Rosetta2 or by building the dependencies from source.


This pipeline combines these third-party tools:

* [Porechop](https://github.com/rrwick/Porechop)
* [Flye](https://github.com/fenderglass/Flye)
* [minimap2](https://github.com/lh3/minimap2)
* [racon](https://github.com/isovic/racon)

It is reccomended to create a new conda environment with biodonda to install the dependencies:

    conda create -n FRM_assm
    conda activate FRM_assm
    conda config --add channels defaults
    conda config --add channels bioconda
    conda config --add channels conda-forge

Install dependencies to the environment through bioconda:

    conda install porechop
    conda install flye
    conda install minimap2 
    conda install racon


Install the pipeline shell script 

    git clone https://github.com/iframst/FRM_assm.git
    cd FRM_assm



