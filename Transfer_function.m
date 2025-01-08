

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