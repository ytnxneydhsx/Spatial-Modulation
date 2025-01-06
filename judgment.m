function judgment_value = judgment(value)

distance_1=real(value-1)^2+imag(value);

distance_0=real(value+1)^2+imag(value);

    if distance_1>distance_0
        judgment_value=0;      
    else
        judgment_value=1;
    end

end