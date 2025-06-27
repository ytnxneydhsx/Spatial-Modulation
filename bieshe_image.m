

plotCustomLinesLogY([0:7], ber_analytical_list_Nr_2, ber_analytical_list_Nr_4, ber_analytical_list_Nr_8, ber_opt_list_Nr_2, ber_opt_list_Nr_4,  ber_opt_list_Nr_8);

function plotCustomLinesLogY(x, data1, data2, data3, data4, data5, data6)
    % 检查数据长度并截断（确保数据长度不超过x的长度）
    minLen = length(x);
    data1 = data1(1:minLen);
    data2 = data2(1:minLen);
    data3 = data3(1:minLen);
    data4 = data4(1:minLen);
    data5 = data5(1:minLen);
    data6 = data6(1:minLen);
    
    % 创建图形并设置纵坐标为对数坐标
    figure;
    set(gca, 'YScale', 'log');  % 纵坐标设为对数刻度
    
    % 绘制实线（数据1-3）
    semilogy(x, data1, 'r-', 'LineWidth', 1.5); hold on;  % 红色实线
    semilogy(x, data2, 'b-', 'LineWidth', 1.5);           % 蓝色实线
    semilogy(x, data3, 'y-', 'LineWidth', 1.5);           % 黄色实线
    
    % 绘制虚线（数据4-6）
    semilogy(x, data4, 'r--', 'LineWidth', 1.5);          % 红色虚线
    semilogy(x, data5, 'b--', 'LineWidth', 1.5);          % 蓝色虚线
    semilogy(x, data6, 'y--', 'LineWidth', 1.5);          % 黄色虚线
    
    hold off;
    grid on;
    
    % 强制限制x轴范围（避免显示超出x定义的值）
    xlim([min(x), max(x)]);  % 严格匹配x的最小值和最大值
    
    % 添加自定义图例和标签
    legend('analy,N_r=2', 'analy,N_r=4', 'analy,N_r=8', ...
           'sim,N_r=2', 'sim,N_r=4', 'sim,N_r=8');
    xlabel('信噪比 db');
    ylabel('误码率');
    title('仿真结果');
    
    % 可选：优化坐标轴显示
    ax = gca;
    ax.YMinorGrid = 'off';  % 关闭次要网格线
end

