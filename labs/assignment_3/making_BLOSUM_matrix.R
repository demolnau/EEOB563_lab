library(Biostrings)
library(rlang)
data("BLOSUM62")
columns<-colnames(BLOSUM62)
rows<-rownames(BLOSUM62)

read_in_data<-function(string1){
  testing_seq<-c(string1)
  y<-testing_seq[1]
  sequence<-substring(y,seq(1,nchar(y),1),seq(1,nchar(y),1))
  return(sequence)
}

#sequence1<-read_in_data("GRQTAGL")
sequence1<-read_in_data("ALIGNME")

sequence1
#sequence2<-read_in_data("GTAYDL")
sequence2<-read_in_data("AILMENT")
sequence2

get_index_in_BLOSUM62<-function(sequence){
  col_index_seq1=c("25")
  for (i in 1:length(sequence)){
    col_index_seq1[i+1] <- which(columns==sequence[i])
  }
  return(col_index_seq1)
}
col_index_seq1<-get_index_in_BLOSUM62(sequence1)
col_index_seq2<-get_index_in_BLOSUM62(sequence2)

#setting the first row and first column of the row to -8 and setting the alignment to 0 for *,*
changing_gap_score<-function(){
  BLOSUM62[,25]<-as.numeric("-8")
  BLOSUM62[25,]<-as.numeric("-8")
  BLOSUM62[25,25]<-as.numeric("0")
  return(BLOSUM62)
}
#BLOSUM62<-changing_gap_score()

#creates a score matrix
get_score_matrix_BLOSUM62<-function(index_vector_1,index_vector_2){
  counter=0
  alignment_1<-c()
  for (i in 1:length(index_vector_1)){
    for (j in 1:length(index_vector_2)){
      counter=counter+1
    #temp<-c(as.numeric(index_vector_1[i]),as.numeric(index_vector_2[j]))
    #print(temp)
      alignment_1[counter]<-BLOSUM62[as.numeric(index_vector_1[i]),as.numeric(index_vector_2[j])]
    }
  }
  alignment_matrix<-matrix(alignment_1,
                           nrow = length(col_index_seq2), 
                           ncol = length(col_index_seq1), 
                           byrow=FALSE,
                           dimnames = list(prepend(sequence2,"*",before=1),prepend(sequence1,"*",before=1)))
  return(alignment_matrix)
}
alignment_matrix<-get_score_matrix_BLOSUM62(col_index_seq1,col_index_seq2)
alignment_matrix

blosum_alignment<-function(gap_penalty){
#sets the open gap penalty and the extension penalty
open_gap_penalty<-gap_penalty
counter=0
max_list<-c()
directions<-c()
for (i in 1:length(col_index_seq2)){
  for (j in 1:length(col_index_seq1)){
    counter=counter+1
    if ((i==1)&(j==1)){
      max_list[counter]<-alignment_matrix[i,j]
      directions[counter]<-"none"
    }
    else if ((i==1)& (j!=1)){
      penalty<-open_gap_penalty
      which_one<-c(max_list[(length(max_list))]+penalty)
      #print(which_one)
      max_list[counter]<-max(which_one)
      directions[counter]<-"Left"
    }
    else if ((i!=1)&(j==1)){
      penalty<-open_gap_penalty
      one_above<-max_list[(length(max_list)-((length(col_index_seq1))-1))]+penalty
      which_one<-c(one_above)
      #print(which_one)
      max_list[counter]<-max(which_one)
      directions[counter]<-"Above"
    }
    else {
      penalty<-open_gap_penalty
      diagonal_before=max_list[(length(max_list))-(length(col_index_seq1))]
      current_score=alignment_matrix[i,j]
      one_to_left<-max_list[(length(max_list))]+penalty
      one_above<-max_list[(length(max_list)-((length(col_index_seq1))-1))]+penalty
      which_one<-c((diagonal_before+current_score),one_above,one_to_left)
      #print(duplicated(which_one))
      max_list[counter]<-max(which_one)
      print(which_one)
      duplicated_vector<-duplicated(which_one)
      print((duplicated_vector))
      if (TRUE %in% duplicated_vector){
        #directions[counter]="combo"
        two_directions<-which(which_one==which_one[which(duplicated_vector)])
        print(which(which_one==which_one[which(duplicated_vector)]))
        if ((two_directions[1]==1)&(two_directions[2]==2)){
          #print("Diag/Above")
          directions[counter]<-"D/A"
        }
        if ((two_directions[1]==1)&(two_directions[2]==3)){
          #print("Diag/Left")
          directions[counter]<-"D/L"
        }
        if ((two_directions[1]==2)&(two_directions[2]==3)){
          #print("Above/Left")
          directions[counter]<-"A/L"
        }
      }
      else {
      if (max(which_one)==(diagonal_before+current_score)){
        #print("Diagonal")
        directions[counter]<-"Diag"
      }
      else if (max(which_one)==one_above){
        #print("Above")
        directions[counter]<-"Above"
      }
      else if (max(which_one)==one_to_left){
        #print("Left")
        directions[counter]<-"Left"
      }
      }
    }
  }
}

print(matrix(directions,nrow = length(col_index_seq2),
             ncol=length(col_index_seq1),
             byrow = TRUE,
             dimnames = list(prepend(sequence2,"*",before=1),prepend(sequence1,"*",before=1))))
return(matrix(max_list, 
              nrow = length(col_index_seq2),
              ncol=length(col_index_seq1),
              byrow=TRUE,
              dimnames = list(prepend(sequence2,"*",before=1),prepend(sequence1,"*",before=1))))
}
scoring_matrix<-blosum_alignment(-4)
scoring_matrix

