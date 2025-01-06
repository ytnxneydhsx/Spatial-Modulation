function output=rayleigh_distribution(N0, input)


real    = sqrt(N0/2) * randn(size(input,1), size(input,2));
imaginary= sqrt(N0/2) * randn(size(input,1), size(input,2));

output=real+imaginary*1i;




end