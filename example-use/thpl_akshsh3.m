clear
clc
%askshsh 3h 
%p1=1/2;
%p2=1/4;
%p3=p4=1/8;
%symbols and propability of each symbol
symbols = 1:4;
p=[0.5 0.25 0.125 0.125];
de=[0 2 6 7];
%calculate entropy
entropy=-sum(p.*log2(p));

N=100;
a=1;
b=4;

total_error=0;
mn_l=0;
%Monte Carlo random expirements
for j=1:1000

  %create an N size vector
  x= round(a + (b-a).*rand(N,1));

  %%huffman coding
  dict = huff_dict(symbols,de);
  cod= huff_enco(x,dict); %encode huffman
  dec= huff_deco(cod,dict); %decode huffman symbols
  if((j==5))
    d5=cod;
    figure(1)
    title("katanomh d5")
    xlabel("bit value")
    ylabel("number of bit values")
    histfit(d5)
   elseif(j==6)
    d6=cod;
    figure(2)
    title("katanomh d6")
    xlabel("bit value")
    ylabel("number of bit values")
    histfit(d6)
     
  endif

  %find errors
  %--if count is 0 no errors occured during encoding and deconding
  count =0;
  for i=1:N
    if(x(i)~=dec(i))
      count++;
     endif
  endfor  
  
  error=count/N ;%error per iteration or per vector
  %mean error error /1000??
  total_error=total_error+error;
  %entropy length
  l=length(cod)/N;
  mn_l=mn_l+l;
endfor 
 d5_6=cat(2, d5, d6); 
 figure(3)
 title("apo-koinou katanomh")
 xlabel("bit value")
 ylabel("number of bit values")
  
 histfit(d5_6)

%total_error
mn_l=mn_l/1000;

%error= immse(x,dec)
%er =x-dec %mean((x-dec).^2)
%%Monte carlo 1000
%for i=1:10000 repeat the above code 