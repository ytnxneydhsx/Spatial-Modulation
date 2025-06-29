clc;
clear;

%%Mesleh参数配置
%%%%
% N_t=4;
% N_r=4;
% N0=1;
% 
% %%%
% H=rayleigh_channel(N_t,N_r,N0);
% 
% map_length=log2(N_t);
% code_length=1e4*(map_length+1);
% ber_analysis_list=zeros(1,size( E_b_N0_list,1 ) );
% num_differences_sum=0;
% for ber_analysis_list=1
%     for code_recycle=1:code_length/(map_length+1)
%         code=bpsk_code(map_length+1); 
%         H=rayleigh_channel(N_t,N_r,N0);
%         H_normalize=get_H_normalize(H,0.5);
%         H=H_normalize;
% 
% 
%         x=modulation(N_t,code);
%         noise=get_complex_noise(N_r,0);
%         receive_data=H*(x')+noise;  %这里x普通转置
%         x_demodulation_mesleh=demodulation_mesleh(N_t,receive_data,H);
% 
%         difference_matrix = x_demodulation_mesleh ~= code;
%         num_differences = sum(difference_matrix(:));
% 
%         x_demodulation_mesleh=demodulation_mesleh(N_t,receive_data,H);
%         num_differences_sum=num_differences+num_differences_sum;
% 
% 
%     end
% end
% E_b_N0_list=[0:15];
% 
% E_b_N0_list = 10.^(E_b_N0_list / 10);
% ber_analysis_list=zeros(1,size( E_b_N0_list,1 ) );
% N_t=4;
% for i=1:size(E_b_N0_list,2)
%     ber=get_ber_analysis(N_r,N_t,E_b_N0_list(1,i));
%     ber_analysis_list(1,i)=ber;
%     
%     
% end
% plot_log10_y(ber_analysis_list)



% x=demodulation_optimal(N_t,E_b_N0,H,receive);


N_t=4;   %发送天线数量
N_r=4;   %接受天线数量
N0=1;

map_length=log2(N_t);%索引长度

SNR_list=[1:15];     %信噪比
code_length=1e4*(map_length+1); %比特总数量


recyale_list=[1:1];
% 
ber_opt_list=zeros(size(recyale_list,2),size(SNR_list,2)); %最优检测
ber_analytical_list=zeros(size(recyale_list,2),size(SNR_list,2)); %数值理论分析
ber_mesleh_list=zeros(size(recyale_list,2),size(SNR_list,2));    %mesleh检测

for recycle=1:size(recyale_list,2)
    for SNR_recycle=1:size(SNR_list,2)

        num_differences_sum_opt=0;   %最优检测算法错误比特总数
        num_differences_sum__mesleh=0;%mesleh检测错误比特总数
        snr_linear = 10.^(SNR_list(1,SNR_recycle)./ 10); %信噪比db转为线性


       for  i=1:code_length/((map_length+1))
           
        
        code=bpsk_code(map_length+1);   %生成码元
        x=modulation(N_t,code);          %进行调制
        H=rayleigh_channel(N_t,N_r,N0); %生成瑞利信道矩阵


        noise=get_complex_noise(N_r,N0);  %生成噪音
        receive_data=sqrt(snr_linear)*H*(x')+noise;  %这里x普通转置

        %%
        %%opt
        %解调
        x_demodulation_opt=demodulation_optimal(N_t,H,receive_data,snr_linear);
        
        %统计出错总个数
        difference_matrix = x_demodulation_opt ~= code;  
        num_differences = sum(difference_matrix(:));
        num_differences_sum_opt=num_differences+num_differences_sum_opt;
        
        %%
%         %%sub
%         %解调
%         x_demodulation_mesleh=demodulation_mesleh(N_t,H,receive_data);
%         %统计出错总个数
%         difference_matrix = x_demodulation_mesleh ~= code;
%         num_differences = sum(difference_matrix(:));
%         num_differences_sum__mesleh=num_differences+num_differences_sum__mesleh;
        
        %%
       end
       %统计误码率
       ber_opt_list(recycle,SNR_recycle)=num_differences_sum_opt/code_length;
       ber_analytical_list(recycle,SNR_recycle)=get_ber_analysis(N_r,N_t,snr_linear);
%        ber_mesleh_list(recycle,SNR_recycle)=num_differences_sum__mesleh/code_length;
       
    end
end
 
% %%约束信道
% ber_opt_list_normalize=zeros(size(recyale_list,2),size(SNR_list,2));
% ber_analytical_list_normalize=zeros(size(recyale_list,2),size(SNR_list,2));
% ber_mesleh_list_normalize=zeros(size(recyale_list,2),size(SNR_list,2));
% 
% for recycle=1:size(recyale_list,2)
%     for SNR_recycle=1:size(SNR_list,2)
% 
%         num_differences_sum_opt=0;
%         num_differences_sum__mesleh=0;
%         snr_linear = 10^(SNR_list(1,SNR_recycle) / 10);
% 
% 
% 
%        for  i=1:code_length/((map_length+1))
%         H=rayleigh_channel(N_t,N_r,N0);
%         %将H规则化
%         H_normalize_=get_H_normalize(H,1);
%         
%         H=sqrt(snr_linear)*H_normalize_;
%         %s生成码元
%         code=bpsk_code(map_length+1); 
%         %调制
%         x=modulation(N_t,code);
% 
% 
%         noise=get_complex_noise(N_r,N0);
%         
%         receive_data=sqrt(snr_linear)*H*(x')+noise;  %这里x普通转置
% 
%         %%
%         %%opt
%         x_demodulation_opt=demodulation_optimal(N_t,H,receive_data,snr_linear);
%         
%         difference_matrix = x_demodulation_opt ~= code;
%         num_differences = sum(difference_matrix(:));
%         num_differences_sum_opt=num_differences+num_differences_sum_opt;
%         
%         %%
%         %%sub
%         x_demodulation_mesleh=demodulation_mesleh(N_t,receive_data,H);
%         
%         difference_matrix = x_demodulation_mesleh ~= code;
%         num_differences = sum(difference_matrix(:));
%         num_differences_sum__mesleh=num_differences+num_differences_sum__mesleh;
%         
%         %%
%        end
%        ber_opt_list_normalize(recycle,SNR_recycle)=num_differences_sum_opt/code_length;
%        ber_analytical_list_normalize(recycle,SNR_recycle)=get_ber_analysis(N_r,N_t,snr_linear);
%        ber_mesleh_list_normalize(recycle,SNR_recycle)=num_differences_sum__mesleh/code_length;
%     end
% end


% plot_with_log_y(SNR_list, ber_analytical_list, ber_mesleh_list, ber_mesleh_list_normalize, ber_opt_list, ber_opt_list_normalize);




% function plot_with_log_y(x, y1, y2, y3, y4, y5)
%     % 输入: x 为x轴向量, y1, y2, y3, y4, y5, y6 为六个y轴数据行向量
%     
%     
%     % 创建一个新的图像
%     figure;
%     
%     % 使用10为底的幂函数绘制每一个y数据
%     semilogy(x, y1, 'DisplayName', 'ber analytical list');
%     hold on;
%     semilogy(x, y2, 'DisplayName', 'ber mesleh list');
%     semilogy(x, y3, 'DisplayName', 'ber mesleh list_normalize');
%     semilogy(x, y4, 'DisplayName', 'ber opt list');
%     semilogy(x, y5, 'DisplayName', 'ber opt list normalize');
% 
%     
%     % 设置图像标签
%     xlabel('x轴');
%     ylabel('y轴 (以10为底的幂函数)');
% 
%     set(gca, 'YScale', 'log');
%     % 添加图例
%     legend;
%     
%     % 开启网格
%     grid on;
%     
%     % 显示图像
%     hold off;
% end
plot_with_log_y(SNR_list, ber_analytical_list, ber_opt_list)
function plot_with_log_y(x, y1, y2)
    % 输入: x 为x轴向量, y1, y2, y3, y4, y5, y6 为六个y轴数据行向量
    
    
    % 创建一个新的图像
    figure;
    
    % 使用10为底的幂函数绘制每一个y数据
    semilogy(x, y1, 'DisplayName', 'ber analytical list');
    hold on;
    semilogy(x, y2, 'DisplayName', 'ber  list');
    
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



