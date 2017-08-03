temp=0;
start_pat=1;
end_pat=[];
scrambled_Y_t=[]
total_recalled=0;
pat_counter=1;
for i=1:(numel(pat_code_num)-1)
    if pat_code_num(i)~=pat_code_num(i+1)
        end_pat(pat_counter)=i;
        start_pat(pat_counter+1)=i+1;        
        total_recalled=sum(Y_array_t(start_pat(pat_counter):end_pat(pat_counter)));
        prob_recall=total_recalled/(end_pat(pat_counter)-start_pat(pat_counter));
        for j=start_pat(pat_counter):end_pat(pat_counter)
            x=rand;
              if x>prob_recall
                  scrambled_Y_t(j)=0;
              else
                  scrambled_Y_t(j)=1;
              end;
        end;
      pat_counter=pat_counter+1;
    end;
end;
last_pat_total_recall=sum(Y_array_t(end_pat(pat_counter-1):numel(pat_code_num)));
last_pat_prob_recall=last_pat_total_recall/(numel(pat_code_num)-end_pat(pat_counter-1));
   for j=end_pat(pat_counter-1):numel(pat_code_num)
    x=rand;
              if x>prob_recall
                  scrambled_Y_t(j)=0;
              else
                  scrambled_Y_t(j)=1;
              end;
        end;
