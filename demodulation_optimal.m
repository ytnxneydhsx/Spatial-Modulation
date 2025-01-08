
function x=demodulation_optimal(N_t,H,receive,snr_linear)

q=[1,-1];
M=2;
temp_min=100000000;
i_min=0;
j_min=0;
for j=1:N_t
    for i=1:M
    h_j=H(:,j);    
    g=h_j*q(1,i);
    k1= sqrt( snr_linear )*( norm(g).^2);
    k2=2*real( (receive') *g)  ;%%这里为共轭转置
    temp=k1-k2;
    if temp<temp_min
        temp_min=temp;
       i_min=i;
       j_min=j;
    end
    end
end
    
bin_matrix = dec2bin_matrix(j_min-1,log2(N_t));
    if i_min==1
         x=[bin_matrix,1];
    else
         x=[bin_matrix,0];
    end  
end