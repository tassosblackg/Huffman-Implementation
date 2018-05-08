%askshsh4h
pkg load communications;
pkg load queueing;
pkg load statistics;
clear;
clc;
%-----------------------CODE-----------------------------------------------------------------------------
symbols=1:5;

%transition propability array--every possible transition from state to state
p=[1/2 1/8 1/8 1/8 1/8; 1/4 1/8 1/16 1/16 1/2;1/4 1/8 1/8 1/4 1/4;1/8 0 1/2 1/4 1/8;0 1/2 1/4 1/4 0]

%s=sum(p);
a=1;
b=5;
N=100;

%%4.1|
A=[1/2 5/4 5/4 9/8 1;9/8 1/8 9/8 1 3/2; 9/8 17/16 1/8 3/2 5/4; 9/8 17/16 5/4 1/4 5/4; 9/8 3/2 5/4 9/8 0];
Y=[1;1;1;1;1];
PP=A\Y; %limit distirbution
en=-sum(PP.*log2(PP)); %entropy for limit distirbution



%%4.2|
%b|markov chain --with P Xn|Xn-1
mc=dtmc(p); %just for checking we can see that mc is equal to PP

%calculate error while encoding and decoding
total_error1=total_error2=total_error3=total_error4=total_error5=0;
mn_l=mn_l1=mn_l2=mn_l3=mn_l4=mn_l5=0;

%Monte carlo 1000 iterations
for j=1:1000
  Xn=round(randsrc(1,N,[symbols,PP']));

  %%a| --Huffman for limit disturbution
  dicta={[0 0],[1 0 0],[0 1],[1 0 1],[1 1]};
  coda=huff_enco(Xn,dicta);
  deca=huff_deco(coda,dicta);

  %%b|--Huffman Markov chain rule disturbution

  %create huffman dictionary
  %dictb = huffmandict(symbols,mc);
  %codb=huffmanenco(Xn,dictb);
  %decb=huffmandeco(codb,dictb);
  Xn1=round(randsrc(1,N,[symbols,p(1,:)]) );
  dict1={[0],[1 0 0], [1 0 1],[1 1 0],[1 1 1]};
  cod1=huff_enco(Xn1,dict1);
  dec1=huff_deco(cod1,dict1);
  error1=count_error(Xn1,dec1);
  
  Xn2=round(randsrc(1,N,[symbols,p(2,:)]) );
  dict2={[0 0],[0 1 0], [0 1 1 0],[0 1 1 ],[1]};
  cod2=huff_enco(Xn1,dict2);
  dec2=huff_deco(cod2,dict2);
  error2=count_error(Xn1,dec2);
  
  Xn3=round(randsrc(1,N,[symbols,p(3,:)]) );
  dict3={[0 0],[0 1 0],[0 1 1],[1 0],[1 1]};
  cod3=huff_enco(Xn3,dict3);
  dec3=huff_deco(cod3,dict3);
  error3=count_error(Xn3,dec3);
  
  Xn4=round(randsrc(1,N,[symbols,p(4,:)]) );
  dict4={[0 0 0 0],[0 0 0 1], [1],[0 1],[0 0 1]};
  cod4=huff_enco(Xn4,dict4);
  dec4=huff_deco(cod4,dict4);
  error4=count_error(Xn4,dec4);
  
  Xn5=round(randsrc(1,N,[symbols,p(4,:)]) );
  dict5={[0 0 0 0],[1], [0 1],[0 0 1],[0 0 0 1]};
  cod5=huff_enco(Xn5,dict5);
  dec5=huff_deco(cod5,dict5);
  error5=count_error(Xn5,dec5);


  %mean error error /1000??
  total_error1=total_error1+error1;
  total_error2=total_error2+error2;
  total_error3=total_error3+error3;
  total_error4=total_error4+error4;
  total_error5=total_error5+error5;

  
  %entropy length
  l=length(coda)/N;
  mn_l=mn_l+l;
  %entropy length
  l1=length(cod1)/N;
  mn_l1=mn_l1+l1;
  l2=length(cod2)/N;
  mn_l2=mn_l2+l2;
  l3=length(cod3)/N;
  mn_l3=mn_l3+l3;
  l4=length(cod4)/N;
  mn_l4=mn_l4+l4;
  l5=length(cod5)/N;
  mn_l5=mn_l5+l5;

  
endfor

%total_error
mn_l=mn_l/1000;
mn_l1=mn_l1/1000;
mn_l2=mn_l2/1000;
mn_l3=mn_l3/1000;
mn_l4=mn_l4/1000;

mn_l5=mn_l5/1000;

mm=(mn_l1+mn_l2+mn_l3+mn_l4+mn_l5)/5;
