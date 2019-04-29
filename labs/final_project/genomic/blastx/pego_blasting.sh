module load ncbi-toolkit
blastx -query ../trimming_and_assembling_platanus/assembling/pego_platanus_assembly/pego_pl_trimmed__contig.fa -db OR_hymenoptera -evalue 0.01 -out pego_OR_blast -outfmt "6 qseqid sseqid pident qlen length qstart qend mismatch evalue bitscore"

