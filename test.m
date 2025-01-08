


clc;
clear;

N_t=4;
N_r=4;
N0=1;
E_b_N0=1000;

map_length=log2(N_t);
code_length=1e4*(map_length+1);
num_differences_sum=0;

for code_recycle=1:code_length/(map_length+1)
    
    code=bpsk_code(map_length+1); 
    H=rayleigh_channel(N_t,N_r,N0);

 
    
    x=modulation(N_t,code);

    
    noise=get_complex_noise(N_r,0);
    receive_data=H*(x')+noise;  %这里x普通转置
    
    x_demodulation=demodulation_optimal(N_t,E_b_N0,H,receive_data,code);
    difference_matrix = x_demodulation ~= code;
    num_differences = sum(difference_matrix(:));

%     x_demodulationh=demodulation_mesleh(N_t,receive_data,H);
    num_differences_sum=num_differences+num_differences_sum;
    
    
end
ber=num_differences_sum/code_length;