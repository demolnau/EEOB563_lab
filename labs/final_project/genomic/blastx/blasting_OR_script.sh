module load ncbi-toolkit
blastx -query ../trimming_and_assembling_platanus/assembling/het1_platanus_assembly/het1_pl_trimmed__contig.fa -db OR_hymenoptera -evalue 0.01 -out het1_OR_blast -outfmt "6 qseqid sseqid pident qlen length qstart qend mismatch gapope evalue bitscore"
blastx -query ../trimming_and_assembling_platanus/assembling/het2_platanus_assembly/het2_pl_trimmed__contig.fa -db OR_hymenoptera -evalue 0.01 -out het2_OR_blast -outfmt "6 qseqid sseqid pident qlen length qstart qend mismatch gapope evalue bitscore"
blastx -query ../trimming_and_assembling_platanus/assembling/pego_platanus_assembly/pego_pl_trimmed__contig.fa -db OR_hymenoptera -evalue 0.01 -out pego_OR_blast -outfmt "6 qseqid sseqid pident qlen length qstart qend mismatch gapope evalue bitscore"
blastx -query ../trimming_and_assembling_platanus/assembling/LO1_platanus_assembly/LO1_pl_trimmed__contig.fa -db OR_hymenoptera -evalue 0.01 -out LO1_OR_blast -outfmt "6 qseqid sseqid pident qlen length qstart qend mismatch gapope evalue bitscore"
blastx -query ../trimming_and_assembling_platanus/assembling/SO1_platanus_assembly/SO1_pl_trimmed__contig.fa -db OR_hymenoptera -evalue 0.01 -out SO1_OR_blast -outfmt "6 qseqid sseqid pident qlen length qstart qend mismatch gapope evalue bitscore"
blastx -query ../trimming_and_assembling_platanus/assembling/SO2_platanus_assembly/SO2_pl_trimmed__contig.fa -db OR_hymenoptera -evalue 0.01 -out SO2_OR_blast -outfmt "6 qseqid sseqid pident qlen length qstart qend mismatch gapope evalue bitscore"
blastx -query ../trimming_and_assembling_platanus/assembling/phy_platanus_assembly/phy_pl_trimmed__contig.fa -db OR_hymenoptera -evalue 0.01 -out phy_OR_blast -outfmt "6 qseqid sseqid pident qlen length qstart qend mismatch gapope evalue bitscore"

 
