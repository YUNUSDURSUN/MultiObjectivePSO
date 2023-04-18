
function [zreel,zimaj,yreel,yimaj]= smithc(pare)
% 
% C1 = max(pare(:,1));
% C2 = max(pare(:,2));
% C=max(C1,C2);

[ax,~] = size(pare);

for num1=1:1:ax

norz(num1,:) = pare(num1,1)+1j*pare(num1,2);
nory(num1,:) = 1/(norz(num1,:));

end

yreel=real(nory);
yimaj=imag(nory);
zreel=real(norz);
zimaj=imag(norz);

end