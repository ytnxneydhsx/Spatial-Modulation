function x_demodulation_mesleh=demodulation_mesleh(N_t,receive_data,H)
g=zeros(1,size(H,2));
x_demodulation_mesleh=zeros(1,log2(N_t)+1);

g=H'*receive_data;
 g_abs=abs(g);
 
[max_value, linear_index] = max( g_abs(:));
[row, col] = ind2sub(size(g_abs), linear_index);
index=row;
code_map = dec2bin_matrix(index-1,log2(N_t));  %偏移量 -1
x_demodulation_mesleh(1,1:log2(N_t))=code_map;
value=g(index,1);
x_demodulation_mesleh(1,log2(N_t)+1) = judgment(value);
end