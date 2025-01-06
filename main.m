clc;
clear;

%%Mesleh参数配置
%%%%
N_t=2;
N_r=4;
N0=1;

%%%
H=rayleigh_channel(N_t,N_r,N0);

map_length=log2(N_t);
code_longth=1e4*(map_length+1);

% H=[-0.5377-0.1229i,-0.6175-0.15162;
%    -0.5450-0.0964i,-0.3271-0.0006i;
%    0.4624-0.2680i , 0.2058+0.3171i;
%    0.2854-0.1493i ,-0.5190-0.2767i];
for code_recycle=1:code_longth/(map_length+1)
%     code=bpsk_code(map_length+1); 
    H=rayleigh_channel(N_t,N_r,N0);
      code=[0,0];
%     code=[0,1];
%     code=[1,0];
%     code=[1,1];
    
    x=modulation(N_t,code);
    noise=get_complex_noise(N_r,0);
    receive_data=H*(x')+noise;  %这里x普通转置
    x_demodulation_mesleh=demodulation_mesleh(N_t,receive_data,H);
    
    difference_matrix = x_demodulation_mesleh ~= code;
    num_differences = sum(difference_matrix(:));
    if num_differences~=0
        a=1;
    end
    x_demodulation_mesleh=demodulation_mesleh(N_t,receive_data,H);
end

