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