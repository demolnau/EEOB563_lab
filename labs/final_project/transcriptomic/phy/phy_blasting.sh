module load ncbi-toolkit
blastx -query ../../fig_wasp_transcriptomes/Trinity.Physo.fasta -db ../../assembling_genomes/OR_tree/OR_hymenoptera -evalue 0.05 -out phy_OR_blast_transcriptome_redo.txt -outfmt "6 qseqid sseqid pident qlen length qstart qend mismatch evalue bitscore"

