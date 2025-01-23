


function ber_analysis=get_ber_analysis(N_t,E_b_N0)

M=2;
simga_a_square=E_b_N0/2;
u_a=0.5*(1-sqrt( simga_a_square/( 1+simga_a_square) ) );

Transfer=Transfer_function(N_t,u_a);


ber_analysis=0;
for i=1:M
    for j= 1:M
        if i==j
            N=0;
        else
            N=1;
        end
   ber_analysis =ber_analysis+(N_t*N*Transfer)/M;
    end
end
end

function Transfer=Transfer_function(N_t,u_a)
    
sum=0;
for i=0:N_t-1
    
    c= nchoosek(N_t-1+i,i);
    x=(1-u_a).^i;
    sum=sum+c*x;
end
k=u_a.^N_t;

Transfer=sum*k;

end
