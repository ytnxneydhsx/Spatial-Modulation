
function   noise=get_complex_noise(N_r,N0)
input=zeros(N_r,1);
noise=rayleigh_distribution(N0, input);
end