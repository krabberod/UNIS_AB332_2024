- Script for running cutadapt on the HPC cluster Saga
- The main script is called "cutadapt_paired_primertags.sh"
- It reads the *batch_file.tx* which contain an overview of the sequencing files and heir correpsonding primer pairs with tags used for demultplexing
- The scripts processes sense and anti-sense separately
     
Structure of **batch_file.txt**

| R1-sequences      | R2-sequences      | FWD primers       | REV Primers       |
| ----------------- | ----------------- | ----------------- | ----------------- |
| file1_R1.fastq.gz | file1_R2.fastq.gz | FWD-primer1.fasta | REV-primer1.fasta |
| file2_R1.fastq.gz | file2_R2.fastq.gz | FWD-primer2.fasta | REV-primer2.fasta |
| Etc...            | Etc...            | Etc...            | Etc...            |
