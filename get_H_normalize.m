function H_normalize_=get_H_normalize(H,c)
H_normalize_=zeros(size(H,1),size(H,2));
for i=1:size(H,2)
    temp=sum(abs(H(:,i)).^2);
    k=sqrt(c/temp);
    H_normalize_(:,i)=H(:,i).*k;
end
end