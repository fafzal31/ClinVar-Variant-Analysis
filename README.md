# ClinVar-Variant-Analysis

Comprehensive Curation of Clinically Significant Genetic Variants and Generation of a Standardized GRCh38 VCF Dataset
1. Project Overview
This project documents the systematic identification, curation, and formatting of clinically significant genetic variants associated with six inherited disorders. The primary objective was to extract validated variant information from public genomic databases and generate a properly structured Variant Call Format (VCF v4.2) file using GRCh38 reference genome coordinates.
The workflow simulates a targeted extraction of disease-associated variants from a whole genome sequencing (WGS) context, culminating in the creation of a standards-compliant VCF file suitable for downstream bioinformatics analysis.
This repository includes:
*Curated disease and variant metadata
*Extracted genomic coordinates (GRCh38)
*A finalized and properly formatted VCF file
*Full documentation of methodology
ClinVar annotation procedures are intentionally excluded in this documentation, as this README covers the process only up to VCF generation.

2. Disease Selection Criteria
Six genetic diseases were selected to represent both rare and relatively common inherited disorders. Classification was based on reported population frequency.
Non-Rare Genetic Disorders
1.Charcot–Marie–Tooth disease
2.Neurofibromatosis type 1
3.Cystic fibrosis
Rare Genetic Disorders
4.Prader–Willi syndrome
5.Huntington disease
6.Tay–Sachs disease
For each condition, a clinically significant variant (Pathogenic or Likely Pathogenic) was selected from ClinVar.
3. Variant Curation Process
For each selected disease, the following data were extracted and documented:
*Gene symbol
*HGVS cDNA notation
*Protein-level impact (HGVS p.)
*ClinVar Variation ID
*ClinVar accession number (VCV)
*Variant type (SNV, deletion, microsatellite expansion, etc.)
*Clinical significance
*Cytogenetic location
*Genomic coordinates (GRCh38 build)
Only GRCh38 genomic positions were used to ensure consistency and reproducibility.
4. Reference Genome Standardization
All genomic positions were standardized to:
Reference Genome: GRCh38
Coordinate System: 1-based genomic coordinates
For each variant, the following fields were verified:
*Chromosome number
*Exact base position (GRCh38)
*Reference allele
*Alternate allele
*Structural variant representation (when applicable)
Structural or complex variants were encoded using symbolic ALT alleles where necessary (e.g., <DEL>, <DUP>).
5. VCF Construction Methodology
The Variant Call Format (VCF) v4.2 specification was used as the standard output format. The following mandatory columns were included:
Field	Description
CHROM	Chromosome identifier
POS	Genomic position (1-based)
ID	ClinVar Variation ID
REF	Reference allele
ALT	Alternate allele
QUAL	Quality score (not calculated; set to ".")
FILTER	Filter status (set to ".")
INFO	Additional annotation (clinical significance)
Since this project simulates a curated WGS subset rather than raw variant calling, quality and filter metrics were not computed.
6. VCF Header Specification
The following header structure was implemented to ensure compatibility with downstream bioinformatics tools:
##fileformat=VCFv4.2
##source=Assignment1_ClinVar_GRCh38
##reference=GRCh38
##INFO=<ID=CLNSIG,Number=1,Type=String,Description="Clinical significance">
#CHROM  POS  ID  REF  ALT  QUAL  FILTER  INFO
Each variant entry follows strict tab-delimited formatting.
7. Variant Types Represented
The curated dataset includes multiple variant classes:
Single nucleotide variants (SNVs)
Missense mutations
Nonsense mutations
Single-base deletions
Frameshift variants
Microsatellite expansion
Structural variation (symbolic allele representation)
This diversity reflects real-world heterogeneity observed in clinically relevant genetic variation.
8. Data Processing Workflow
The overall workflow consisted of:
1.Disease selection based on prevalence classification
2.Variant identification from ClinVar
3.Extraction of GRCh38 genomic coordinates
4.Standardization of allele representation
5.Compilation of variant metadata in Excel
6.Programmatic formatting into a valid VCF file
7.Verification of structural integrity and formatting compliance
The final output is a VCF file structured according to accepted genomic data standards.
9. Repository Structure
├── assign1.xlsx
│   Raw curated dataset including disease metadata and variant details
│
├── Assignment1_GRCh38_final.vcf
│   Final standardized VCF file (GRCh38-based)
│
└── README.md
    Project documentation and methodology
10. Academic Context
This project models a real-world bioinformatics task in which clinically relevant variants are extracted, standardized, and formatted for computational analysis. It reflects fundamental competencies in:
Variant interpretation
Genomic coordinate handling
Reference genome consistency
Bioinformatics data formatting standards
VCF structure and specification compliance
The resulting VCF file is suitable for downstream analysis workflows, including variant annotation, filtering, and integrative genomic studies.
