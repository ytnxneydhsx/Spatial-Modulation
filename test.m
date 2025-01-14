% 
% 
% 
% clc;
% clear;
% % 
% % % N_t=4;
% % % N_r=4;
% % % N0=1;
% % % E_b_N0=1000;
% % % 
% % % map_length=log2(N_t);
% % % code_length=1e4*(map_length+1);
% % % num_differences_sum=0;
% % % 
% % % for code_recycle=1:code_length/(map_length+1)
% % %     
% % %     code=bpsk_code(map_length+1); 
% % %     H=rayleigh_channel(N_t,N_r,N0);
% % % 
% % %  
% % %     
% % %     x=modulation(N_t,code);
% % % 
% % %     
% % %     noise=get_complex_noise(N_r,0);
% % %     receive_data=H*(x')+noise;  %这里x普通转置
% % %     
% % %     x_demodulation=demodulation_optimal(N_t,E_b_N0,H,receive_data,code);
% % %     difference_matrix = x_demodulation ~= code;
% % %     num_differences = sum(difference_matrix(:));
% % % 
% % % %     x_demodulationh=demodulation_mesleh(N_t,receive_data,H);
% % %     num_differences_sum=num_differences+num_differences_sum;
% % %     
% % %     
% % % end
% % % ber=num_differences_sum/code_length;
% % 
% % 
% % 
% % E_b_N0_list=[1:15];
% % E_b_N0_list = 10.^(E_b_N0_list / 10);
% % ber_analysis_list=zeros(1,size( E_b_N0_list,1 ) );
% % N_t=4;
% % for i=1:size(E_b_N0_list,2)
% %     ber=get_ber_analysis(N_t,E_b_N0_list(1,i));
% %     ber_analysis_list(1,i)=ber;
% %     
% %     
% % end
% % semilogy(mean_b);  % 以10为底的对数图，data1绘制
% % hold on;  % 保持当前图形，使得data2也能绘制在同一图上
% % semilogy(ber_analysis_list);  % 以10为底的对数图，data2绘制
% % legend('ber_now', 'ber_anay');  % 添加图例
% 
% N_t=4;
% N_r=4;
% map_length=log2(N_t);
% code_length=1e4*(map_length+1);
% num_differences_sum=0;
% N0=1;
% for code_recycle=1:code_length/(map_length+1)
%     code=bpsk_code(map_length+1); 
%     H=rayleigh_channel(N_t,N_r,N0);
%     H_normalize=get_H_normalize(H,1);
%     H=H_normalize;
% 
%     
%     x=modulation(N_t,code);
%     noise=get_complex_noise(N_r,0);
%     receive_data=H*(x')+noise;  %这里x普通转置
%     x_demodulation_mesleh=demodulation_mesleh(N_t,receive_data,H);
%     
%     difference_matrix = x_demodulation_mesleh ~= code;
%     num_differences = sum(difference_matrix(:));
% 
%     num_differences_sum=num_differences+num_differences_sum;
%     
%     
% end

plot_with_log_y([1:15], ber_analytical_list, ber_mesleh_list, ber_mesleh_list_normalize, ber_opt_list, ber_opt_list_normalize)

function plot_with_log_y(x, y1, y2, y3, y4, y5)
    % 输入: x 为x轴向量, y1, y2, y3, y4, y5, y6 为六个y轴数据行向量
    
    
    % 创建一个新的图像
    figure;
    
    % 使用10为底的幂函数绘制每一个y数据
    semilogy(x, y1, 'DisplayName', 'ber analytical list');
    hold on;
    semilogy(x, y2, 'DisplayName', 'ber mesleh list');
    semilogy(x, y3, 'DisplayName', 'ber mesleh list normalize');
    semilogy(x, y4, 'DisplayName', 'ber opt list');
    semilogy(x, y5, 'DisplayName', 'ber opt_list normalize');

    
    % 设置图像标签
    xlabel('x轴');
    ylabel('y轴 (以10为底的幂函数)');

    set(gca, 'YScale', 'log');
    % 添加图例
    legend;
    
    % 开启网格
    grid on;
    
    % 显示图像
    hold off;
end


