# 🧬 ClinVar Variant Analysis

> Comprehensive curation of clinically significant genetic variants and generation of a standardized **GRCh38 VCF dataset**.

![Genome](https://img.shields.io/badge/Reference%20Genome-GRCh38-blue) ![VCF](https://img.shields.io/badge/Format-VCF%20v4.2-green) ![Diseases](https://img.shields.io/badge/Diseases-6-orange) ![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

---

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Disease Selection](#-disease-selection)
- [Variant Curation Process](#-variant-curation-process)
- [Reference Genome Standardization](#-reference-genome-standardization)
- [VCF Construction](#-vcf-construction)
- [VCF Header Specification](#-vcf-header-specification)
- [Variant Types](#-variant-types-represented)
- [Data Processing Workflow](#-data-processing-workflow)
- [Repository Structure](#-repository-structure)
- [Academic Context](#-academic-context)

---

## 🔬 Project Overview

This project documents the **systematic identification, curation, and formatting** of clinically significant genetic variants associated with six inherited disorders. The primary objective was to extract validated variant information from public genomic databases and generate a properly structured **Variant Call Format (VCF v4.2)** file using GRCh38 reference genome coordinates.

The workflow simulates a targeted extraction of disease-associated variants from a whole genome sequencing (WGS) context, culminating in a standards-compliant VCF file suitable for downstream bioinformatics analysis.

### This repository includes

| Asset | Description |
|---|---|
| 📊 Variant Metadata | Curated disease and variant metadata |
| 📍 Genomic Coordinates | Extracted GRCh38 positions |
| 🗂️ VCF File | Finalized, properly formatted VCF |
| 📄 Documentation | Full methodology documentation |

> ⚠️ **Note:** ClinVar annotation procedures are intentionally excluded. This README covers the process only up to VCF generation.

---

## 🦠 Disease Selection

Six genetic diseases were selected to represent both rare and relatively common inherited disorders, classified by **reported population frequency**.

### Non-Rare Genetic Disorders

| # | Disease |
|---|---------|
| 1 | Charcot–Marie–Tooth disease |
| 2 | Neurofibromatosis type 1 |
| 3 | Cystic fibrosis |

### Rare Genetic Disorders

| # | Disease |
|---|---------|
| 4 | Prader–Willi syndrome |
| 5 | Huntington disease |
| 6 | Tay–Sachs disease |

For each condition, a clinically significant variant (**Pathogenic** or **Likely Pathogenic**) was selected from ClinVar.

---

## 🔍 Variant Curation Process

For each selected disease, the following data were extracted and documented:

| Field | Description |
|---|---|
| Gene Symbol | HGNC-approved gene identifier |
| HGVS cDNA Notation | Coding DNA sequence change |
| Protein Impact | HGVS p. notation |
| ClinVar Variation ID | Unique variant identifier |
| ClinVar Accession | VCV accession number |
| Variant Type | SNV, deletion, microsatellite expansion, etc. |
| Clinical Significance | Pathogenic / Likely Pathogenic |
| Cytogenetic Location | Chromosomal band |
| Genomic Coordinates | GRCh38 build |

> Only **GRCh38** genomic positions were used to ensure consistency and reproducibility.

---

## 🗺️ Reference Genome Standardization

All genomic positions were standardized to the following specifications:

| Parameter | Value |
|---|---|
| Reference Genome | GRCh38 |
| Coordinate System | 1-based genomic coordinates |

For each variant, the following fields were verified: chromosome number, exact base position (GRCh38), reference allele, alternate allele, and structural variant representation (when applicable).

Structural or complex variants were encoded using **symbolic ALT alleles** where necessary (e.g., `<DEL>`, `<DUP>`).

---

## 🏗️ VCF Construction

The **Variant Call Format (VCF) v4.2** specification was used as the standard output format.

| Column | Field | Description |
|---|---|---|
| 1 | `CHROM` | Chromosome identifier |
| 2 | `POS` | Genomic position (1-based) |
| 3 | `ID` | ClinVar Variation ID |
| 4 | `REF` | Reference allele |
| 5 | `ALT` | Alternate allele |
| 6 | `QUAL` | Quality score (`"."` — not calculated) |
| 7 | `FILTER` | Filter status (`"."` — not computed) |
| 8 | `INFO` | Additional annotation (clinical significance) |

> Since this project simulates a curated WGS subset rather than raw variant calling, quality and filter metrics were not computed.

---

## 📝 VCF Header Specification

The following header structure was implemented to ensure compatibility with downstream bioinformatics tools:

```vcf
##fileformat=VCFv4.2
##source=Assignment1_ClinVar_GRCh38
##reference=GRCh38
##INFO=<ID=CLNSIG,Number=1,Type=String,Description="Clinical significance">
#CHROM  POS  ID  REF  ALT  QUAL  FILTER  INFO
```

Each variant entry follows strict **tab-delimited** formatting.

---

## 🧩 Variant Types Represented

The curated dataset includes multiple variant classes, reflecting real-world heterogeneity observed in clinically relevant genetic variation:

- Single nucleotide variants (SNVs) — missense and nonsense mutations
- Single-base deletions — frameshift variants
- Microsatellite expansions
- Structural variations — represented using symbolic alleles

---

## ⚙️ Data Processing Workflow

```
1. Disease Selection     →  Based on prevalence classification
2. Variant Identification →  Queried from ClinVar database
3. Coordinate Extraction  →  GRCh38 genomic positions retrieved
4. Allele Standardization →  REF/ALT alleles normalized
5. Metadata Compilation  →  Organized in Excel (assign1.xlsx)
6. VCF Formatting        →  Programmatic conversion to VCF v4.2
7. Validation            →  Structural integrity and format compliance verified
```

---

## 📁 Repository Structure

```
ClinVar-Variant-Analysis/
│
├── assign1.xlsx
│   └── Raw curated dataset including disease metadata and variant details
│
├── Assignment1_GRCh38_final.vcf
│   └── Final standardized VCF file (GRCh38-based)
│
└── README.md
    └── Project documentation and methodology
```

---

## 🎓 Academic Context

This project models a real-world bioinformatics task in which clinically relevant variants are extracted, standardized, and formatted for computational analysis. It reflects fundamental competencies in:

- **Variant Interpretation** — clinical significance classification
- **Genomic Coordinate Handling** — working with GRCh38 positions
- **Reference Genome Consistency** — single-build standardization
- **Bioinformatics Data Formatting** — structured data pipelines
- **VCF Specification Compliance** — adherence to v4.2 standards

The resulting VCF file is suitable for downstream analysis workflows, including **variant annotation**, **filtering**, and **integrative genomic studies**.

---

*Data sourced from [ClinVar](https://www.ncbi.nlm.nih.gov/clinvar/) — NCBI's public archive of human variants and their relationships to phenotypes.*