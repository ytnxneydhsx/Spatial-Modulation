clc;
clear;
E_b_N0_list=[0:15];

E_b_N0_list = 10.^(E_b_N0_list / 10);
ber_analysis_list_1=zeros(1,size( E_b_N0_list,1 ) );
N_t=2;
for i=1:size(E_b_N0_list,2)
    ber=get_ber_analysis(N_t,E_b_N0_list(1,i));
    ber_analysis_list_1(1,i)=ber;
    
    
end

plot_log10_y(ber_analysis_list_1)
function plot_log10_y(data)
    % 检查输入是否为行向量
    if size(data, 1) ~= 1
        error('输入必须是行矩阵（即 1×n 的向量）');
    end

    % 确保数据为正数（10 的指数次方仅适用于正值）
    if any(data <= 0)
        error('输入数据必须为正数，因为 10 的指数次方无法表示零或负值');
    end

    % 生成横坐标
    x = 1:length(data);

    % 绘制图像
    figure;
    semilogy(x, data, '-o', 'LineWidth', 1.5); % semilogy 用于以 10 为底的对数刻度
    grid on;

    % 设置轴标签和标题
    xlabel('Index');
    ylabel('Value (Logarithmic Scale)');
    title('Plot with Logarithmic Y-Axis (Base 10)');

    % 设置字体大小
    set(gca, 'FontSize', 12);
end