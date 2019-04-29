module load ncbi-toolkit
blastx -query ../trimming_and_assembling_platanus/assembling/LO1_platanus_assembly/LO1_pl_trimmed__contig.fa -db OR_hymenoptera -evalue 0.01 -out LO1_OR_blast -outfmt "6 qseqid sseqid pident qlen length qstart qend mismatch gapope evalue bitscore"

