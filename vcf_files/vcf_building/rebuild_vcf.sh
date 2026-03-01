#!/bin/bash

# Input files
CLINVAR_VCF="clinvar.vcf.gz"
ID_FILE="clinvar_ids.txt"
OUTPUT_VCF="Assignment1_clean.vcf"

# Create VCF header
echo "##fileformat=VCFv4.2" > $OUTPUT_VCF
echo "##reference=GRCh38" >> $OUTPUT_VCF
echo -e "#CHROM\tPOS\tID\tREF\tALT\tQUAL\tFILTER\tINFO" >> $OUTPUT_VCF

# Extract each ClinVar variant by ID
while read ID; do
    bcftools view $CLINVAR_VCF | \
    awk -v id="$ID" '$3==id {print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t.\t.\t."}' \
    >> $OUTPUT_VCF
done < $ID_FILE

echo "VCF rebuild complete: $OUTPUT_VCF"

