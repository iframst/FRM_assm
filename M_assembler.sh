# Isaac Framst
# University of Guelph, Pahtobiology 
# PI: Dr. Grazieli Maboni


#*************************************************

echo "please specify directory for demultiplexed reads"
read readDir

printf "\n\n*******************************************************************************\n"
printf "Run started on $(date)\n"
printf "*******************************************************************************\n\n"

mkdir mycout

for file in ${readDir}/*.fastq; do

(
    #extract file name from path
    filename=$(basename ${file})
    
    #RunID is the name of the file without the extension
    
    runID=${filename%.*}
    #remove reads with no barcode
    if test "$filename" == "none.fastq" ; then echo "deleting none.fastq"; fi
    echo ${filename};
    mkdir mycout/"$runID"

    porechop -i $file -o mycout/$runID/${runID}_trimed.fastq -t 10 --barcode_threshold 90
    
    flye --nano-raw mycout/$runID/${runID}_trimed.fastq --out-dir mycout/$runID/${runID}_flye --threads 10 -i 3
    
    minimap2 -x map-ont --secondary=no -t 10 mycout/$runID/${runID}_flye/assembly.fasta mycout/$runID/${runID}_trimed.fastq > mycout/$runID/${runID}_mm2.paf
    
    racon mycout/$runID/${runID}_trimed.fastq mycout/$runID/${runID}_mm2.paf mycout/$runID/${runID}_flye/assemnly.fasta -t 10 mycout/$runID/${runID}_polished.fasta
    )
done


