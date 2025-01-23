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

%十进制转为二进制
function bin_matrix = dec2bin_matrix(decimal_value, num_bits)
    % 输入：decimal_value，十进制数
    %        num_bits，二进制矩阵的位数（指定转换后的二进制数长度）
    % 输出：bin_matrix，二进制矩阵，表示对应的二进制数
    
    % 检查 num_bits 是否大于等于所需的位数
    if nargin < 2
        % 默认的 num_bits 为 8 位
        num_bits = ceil(log2(decimal_value + 1));
    end
    
    % 将十进制数转换为二进制字符串
    binary_str = dec2bin(decimal_value, num_bits);
    
    % 将二进制字符串转换为二进制矩阵（行向量）
    bin_matrix = arrayfun(@(x) str2double(x), binary_str);

end


function judgment_value = judgment(value)

distance_1=real(value-1)^2+imag(value);

distance_0=real(value+1)^2+imag(value);

    if distance_1>distance_0
        judgment_value=0;      
    else
        judgment_value=1;
    end

end