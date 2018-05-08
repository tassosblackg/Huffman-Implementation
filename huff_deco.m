function decode_sig=huff_deco(coded_Xn, dict)
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Xn is a random generated sequence of symbols
  % dict is the dictionary cell arrayfun
  % @returns cod_Xn aka coded signal
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  len_di=cellfun('length',dict); %length of each cell 
  max_len=max(len_di); %maximum length
  sig=[];
  i=1;
  l=length(coded_Xn);
  %for i=1:length(coded_Xn)
 while(l!=0) %%while coded_xn is not empty
    vec=coded_Xn(1);
    i=1;
    indx=search_dict(vec,dict);
    while((indx ==-1)) % while not match
      
      vec=[vec,coded_Xn(i+1)]; %add new element
      i++;
      indx=search_dict(vec,dict);
    endwhile
    
    sig=[sig,indx]; %decoded signal
    coded_Xn=coded_Xn(length(vec)+1:length(coded_Xn) ); %remove allread passed of coded_Xn
    l=length(coded_Xn); %reduce length
    
  
  endwhile 