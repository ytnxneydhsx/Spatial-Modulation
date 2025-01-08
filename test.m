


clc;
clear;
% x=[-1-1i;0];
H=[ -0.537700000000000 - 0.122920000000000i	-0.617500000000000 + 0.151600000000000i
    -0.545000000000000 - 0.0964000000000000i	-0.327100000000000 - 0.000600000000000000i
    0.462400000000000 - 0.268000000000000i	0.205800000000000 + 0.317100000000000i
    0.285400000000000 - 0.149300000000000i	-0.519000000000000 + 0.276700000000000i];
% 
% 
H=rayleigh_channel(2,4,1);
% 
% y=H*x;
% g=H'*y;
% % 
% % g1=H(:,1)'*y;
% % g2=H(:,2)'*y;
% % g=[g1,g2];
% % x=[-1;0];
% % 
% % % y=H'*H*x;
% % b=H'*H
% % % a=abs(y-x);
% % a=1
% H = randn(4, 2) + 1i * randn(4, 2); % 随机生成 4x2 信道矩阵
% c = 10; % 设置归一化常数
% H_normalized = normalizeColumnsToFixedNorm(H, c);

H_normalize_=get_H_normalize(H,10);

a=(H_normalize_(:,1));
b=(H_normalize_(:,2));

a1=sum(abs(a).^2)
b1=sum(abs(b).^2)

function H_normalize_=get_H_normalize(H,c)
H_normalize_=zeros(size(H,1),size(H,2));
for i=1:size(H,2)
    temp=sum(abs(H(:,i)).^2);
    k=sqrt(c/temp);
    H_normalize_(:,i)=H(:,i).*k;
end
end
