Use FRM_assm pipeline
=====================

It is reccomended to use this pipeline in a conda environment (see [install document](INSTALL.md))

Run the bash script 
    bash ./FRM_assm.sh

### Input
The script will ask for the full path to a folder containg demultiplexed reads, a new path do deposit assembly data and the number of threads to use for assembly execution. Each set of reads must be contained in a single .fastq file, with each .fastq file in the directory denoting an independent assmebly target. The pipeline will assemble all .fastq in the directory. 

Example input directory structure:

    ./Demultiplexed_reads
    ├── BC01.fastq
    ├── BC02.fastq
    ├── BC03.fastq
    ├── BC04.fastq
    └── BC05.fastq


### Output

Finished assemblies and accompanying data are written to a directory corresponding to the input .fastq.

Example output directory structure:

    ./outputDir
    ├── BC01
    │   ├── BC01_flye
    │   ├── BC01_mm2.paf
    │   ├── BC01_polished.fasta
    │   └── BC01_trimed.fastq
    ├── BC02
    │   ├── BC02_flye
    │   ├── BC02_mm2.paf
    │   ├── BC02_polished.fasta
    │   └── BC02_trimed.fastq
    ├── BC03
    │   ├── BC03_flye
    │   ├── BC03_mm2.paf
    │   ├── BC03_polished.fasta
    │   └── BC03_trimed.fastq
    ├── BC04
    │   ├── BC04_flye
    │   ├── BC04_mm2.paf
    │   ├── BC04_polished.fasta
    │   └── BC04_trimed.fastq
    └── BC05
        ├── BC05_flye
        ├── BC05_mm2.paf
        ├── BC05_polished.fasta
        └── BC05_trimed.fastq


In this scheme, the `*_polished.fasta` file is the final output.

