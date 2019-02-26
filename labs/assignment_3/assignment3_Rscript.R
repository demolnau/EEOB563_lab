#load in biomanager if you do not already have it 
#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#load in Biostrings through biomanager
#BiocManager::install("Biostrings", version = "3.8")

library(Biostrings)

######################################################################################
pattern <- c("ALIGNME")
subject <- c("AILMENT")
pattern <- unlist(AAStringSet(pattern))
subject <- unlist(AAStringSet(subject))
pattern  # original pattern
subject  # original subject
data(BLOSUM62)
pa5 <- pairwiseAlignment(pattern, subject,
                         substitutionMatrix=BLOSUM62,
                         gapOpening=6, gapExtension=0.5)
pa5
writePairwiseAlignments(pa5, Matrix="BLOSUM62")
#######################################################################################


