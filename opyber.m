clc;
clear;


% N_t=2;   %发送天线数量
% N_r=4;   %接受天线数量
% N0=1;
% 
% 
% map_length=log2(N_t);%索引长度
% 
% SNR_list=[1:15];     %信噪比
% code_length=1e5*(map_length+1); %比特总数量
% 
% recyale_list=[1:1];
% % 
% ber_opt_list_2=zeros(size(recyale_list,2),size(SNR_list,2)); %最优检测
% ber_analytical_list_2=zeros(size(recyale_list,2),size(SNR_list,2)); %数值理论分析
% 
% for recycle=1:size(recyale_list,2)
%     for SNR_recycle=1:size(SNR_list,2)
% 
%         num_differences_sum_opt_2=0;   %最优检测算法错误比特总数
%         snr_linear = 10.^(SNR_list(1,SNR_recycle)./ 10); %信噪比db转为线性
% 
% 
%        for  i=1:code_length/((map_length+1))
%            
%         
%         code=bpsk_code(map_length+1);   %生成码元
%         x=modulation(N_t,code);          %进行调制
%         H=rayleigh_channel(N_t,N_r,N0); %生成瑞利信道矩阵
%                 noise=get_complex_noise(N_r,N0);  %生成噪音
%         receive_data=sqrt(snr_linear)*H*(x')+noise;  %这里x普通转置
%                 %%opt
%         %解调
%         x_demodulation_opt=demodulation_optimal(N_t,H,receive_data,snr_linear);
%         
%         %统计出错总个数
%         difference_matrix = x_demodulation_opt ~= code;  
%         num_differences = sum(difference_matrix(:));
%         num_differences_sum_opt_2=num_differences+num_differences_sum_opt_2;
%        end
%               %统计误码率
%        ber_opt_list_2(recycle,SNR_recycle)=num_differences_sum_opt_2/code_length;
%        ber_analytical_list_2(recycle,SNR_recycle)=get_ber_analysis(N_r,N_t,snr_linear);
%      end
% end
% 
% 
% plot_with_log_y(SNR_list, ber_opt_list_2,ber_analytical_list_2);
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% N_t=4;   %发送天线数量
% N_r=4;   %接受天线数量
% N0=1;
% 
% 
% map_length=log2(N_t);%索引长度
% 
% SNR_list=[1:15];     %信噪比
% code_length=1e5*(map_length+1); %比特总数量
% 
% recyale_list=[1:1];
% % 
% ber_opt_list_4=zeros(size(recyale_list,2),size(SNR_list,2)); %最优检测
% ber_analytical_list_4=zeros(size(recyale_list,2),size(SNR_list,2)); %数值理论分析
% 
% for recycle=1:size(recyale_list,2)
%     for SNR_recycle=1:size(SNR_list,2)
% 
%         num_differences_sum_opt_4=0;   %最优检测算法错误比特总数
%         snr_linear = 10.^(SNR_list(1,SNR_recycle)./ 10); %信噪比db转为线性
% 
% 
%        for  i=1:code_length/((map_length+1))
%            
%         
%         code=bpsk_code(map_length+1);   %生成码元
%         x=modulation(N_t,code);          %进行调制
%         H=rayleigh_channel(N_t,N_r,N0); %生成瑞利信道矩阵
%                 noise=get_complex_noise(N_r,N0);  %生成噪音
%         receive_data=sqrt(snr_linear)*H*(x')+noise;  %这里x普通转置
%                 %%opt
%         %解调
%         x_demodulation_opt=demodulation_optimal(N_t,H,receive_data,snr_linear);
%         
%         %统计出错总个数
%         difference_matrix = x_demodulation_opt ~= code;  
%         num_differences = sum(difference_matrix(:));
%         num_differences_sum_opt_4=num_differences+num_differences_sum_opt_4;
%        end
%               %统计误码率
%        ber_opt_list_4(recycle,SNR_recycle)=num_differences_sum_opt_4/code_length;
%        ber_analytical_list_4(recycle,SNR_recycle)=get_ber_analysis(N_r,N_t,snr_linear);
%      end
% end
% 
% plot_with_log_y(SNR_list, ber_opt_list_4,ber_analytical_list_4);




N_t=4;   %发送天线数量
N_r=8;   %接受天线数量
N0=1;


map_length=log2(N_t);%索引长度

SNR_list=[1:15];     %信噪比
code_length=1e5*(map_length+1); %比特总数量

recyale_list=[1:1];
% 
ber_opt_list_Nr_8=zeros(size(recyale_list,2),size(SNR_list,2)); %最优检测
ber_analytical_list_Nr_8=zeros(size(recyale_list,2),size(SNR_list,2)); %数值理论分析

for recycle=1:size(recyale_list,2)
    for SNR_recycle=1:size(SNR_list,2)

        num_differences_sum_opt_2=0;   %最优检测算法错误比特总数
        snr_linear = 10.^(SNR_list(1,SNR_recycle)./ 10); %信噪比db转为线性


       for  i=1:code_length/((map_length+1))
           
        
        code=bpsk_code(map_length+1);   %生成码元
        x=modulation(N_t,code);          %进行调制
        H=rayleigh_channel(N_t,N_r,N0); %生成瑞利信道矩阵
                noise=get_complex_noise(N_r,N0);  %生成噪音
        receive_data=sqrt(snr_linear)*H*(x')+noise;  %这里x普通转置
                %%opt
        %解调
        x_demodulation_opt=demodulation_optimal(N_t,H,receive_data,snr_linear);
        
        %统计出错总个数
        difference_matrix = x_demodulation_opt ~= code;  
        num_differences = sum(difference_matrix(:));
        num_differences_sum_opt_2=num_differences+num_differences_sum_opt_2;
       end
              %统计误码率
       ber_opt_list_Nr_8(recycle,SNR_recycle)=num_differences_sum_opt_2/code_length;
       ber_analytical_list_Nr_8(recycle,SNR_recycle)=get_ber_analysis(N_r,N_t,snr_linear);
     end
end

plot_with_log_y(SNR_list, ber_opt_list_Nr_8,ber_analytical_list_Nr_8);







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
 