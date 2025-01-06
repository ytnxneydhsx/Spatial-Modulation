function x=modulation(N_t,code)
code(1,end)=2*code(1,end)-1;
x=zeros(1,N_t);
index=bin2dec_matrix( code(1,1:log2(N_t) ) );
x(1,index+1)=code(1,end);
end 