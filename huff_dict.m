function dict=huff_dict(sym,dec_coded_w)
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % (sym) is vector of symbols
  % (dec_coded_w) is a vector of decimal representation for binary coded_word
  %@returns dict, dictionary array
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  %Xn=round((a+ (b-a).*rand(N,1)));
 
  dict={};
 
  for i=1:length(sym)
    
    dict{i}=fliplr(de2bi(dec_coded_w(i)));
    
  endfor

  %test_symbol=3;
  %c=dict{1,test_symbol}
  
end




