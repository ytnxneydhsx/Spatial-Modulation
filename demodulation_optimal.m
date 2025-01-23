
function x=demodulation_optimal(N_t,H,receive,snr_linear)
%寻找偏差最小组合 即出错概率最小点
q=[1,-1];
M=2;
temp_min=100000000;
i_min=0;
j_min=0;
for j=1:N_t
    for i=1:M
    h_j=H(:,j);    
    g=h_j*q(1,i);
    k1= sqrt( snr_linear )*( norm(g).^2);
    k2=2*real( (receive') *g)  ;%%这里为共轭转置
    temp=k1-k2;
    if temp<temp_min
        temp_min=temp;
       i_min=i;
       j_min=j;
    end
    end
end
    
bin_matrix = dec2bin_matrix(j_min-1,log2(N_t));  %十进制转二进制矩阵  编码从0开始 索引需减1
    if i_min==1
         x=[bin_matrix,1];
    else
         x=[bin_matrix,0];
    end  
end

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
