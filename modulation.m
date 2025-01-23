function x=modulation(N_t,code)
code(1,end)=2*code(1,end)-1;
x=zeros(1,N_t);
index=bin2dec_matrix( code(1,1:log2(N_t) ) );
x(1,index+1)=code(1,end);
end 

%二进制向量转为十进制
function decimal_values = bin2dec_matrix(bin_matrix)
    % 输入：二进制矩阵 bin_matrix，形状为 m x n
    % 输出：十进制数的向量 decimal_values，长度为 m
    
    % 获取矩阵的行数
    [rows, ~] = size(bin_matrix);
    
    % 初始化存储十进制值的数组
    decimal_values = zeros(1, rows);
    
    for i = 1:rows
        % 将每行的二进制矩阵转换为字符向量
        binary_str = num2str(bin_matrix(i, :));
        
        % 移除字符串中的空格
        binary_str = strrep(binary_str, ' ', '');
        
        % 使用 bin2dec 函数将二进制字符串转换为十进制数
        decimal_values(i) = bin2dec(binary_str);
    end
end