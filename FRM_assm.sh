# Isaac Framst
# University of Guelph, Pahtobiology 
# Supervisor: Dr. Grazieli Maboni


# FRM_assm main pipeline

#*************************************************

echo "please specify directory for demultiplexed reads"
read readDir
echo "please specify new output directory"
read outDir
echo "please specify number of threads to use for assembly"
read threads

printf "\n\n*******************************************************************************\n"
printf "Run started on $(date)\n"
printf "*******************************************************************************\n\n"


#create directory for processed data
mkdir $outDir

#main assembly pipeline contained in this loop
for file in ${readDir}/*.fastq; do

(
    #extract file name from path
    filename=$(basename ${file})
    
    #RunID is the name of the file without the extension
    runID=${filename%.*}

    #remove reads with no associated barcode
    if test "$filename" == "none.fastq" ; then echo "deleting none.fastq"; fi
    echo ${filename};
    mkdir $outDir/"$runID"

    porechop -i $file -o $outDir/$runID/${runID}_trimed.fastq -t $threads --barcode_threshold 90
    
    flye --nano-raw $outDir/$runID/${runID}_trimed.fastq --out-dir $outDir/$runID/${runID}_flye --threads $threads -i 3
    
    minimap2 -x map-ont --secondary=no -t 10 $outDir/$runID/${runID}_flye/assembly.fasta $outDir/$runID/${runID}_trimed.fastq > $outDir/$runID/${runID}_mm2.paf
    
    racon $outDir/$runID/${runID}_trimed.fastq $outDir/$runID/${runID}_mm2.paf $outDir/$runID/${runID}_flye/assembly.fasta -t $threads > $outDir/$runID/${runID}_polished.fasta
    ) 
    # &
    #uncomment the above line for parallel assembly of multiple genomes (resource intensive)
done
printf "\n\n*******************************************************************************\n"
printf "Run finished on $(date)\n"
printf "*******************************************************************************\n\n"

echo "Thanks for using FRM assembly pipeline. Please cite the following in your work:\n\n"
echo "PUBLICATION PENDING"

#EOF