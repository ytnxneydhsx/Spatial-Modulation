

function H=rayleigh_channel(N_t,N_r,N0)
H=zeros(N_r,N_t);
H=rayleigh_distribution(N0, H);
end