function [pos,conver,sayacon]=sopso_update(pos,parpos,vel,pbest,conver,y,c1,c2,dim,limofpar,sira,nofpar,sayacon)

for num1=1:length(pos)
    lbest(num1,:) = parpos(sira(num1),:);
end

%   conver=conver-conver/500000;

for num1=1:dim
    sayacon=sayacon+1;
    vel(y,num1)=c1*rand*(pbest(y,num1)-pos(y,num1))+...
        c2*rand*(lbest(y,num1)-pos(y,num1));
    pos(y,num1)=pos(y,num1)+vel(y,num1);
    
    
    if pos(y,num1)<limofpar(1,num1)
        pos(y,num1)=limofpar(1,num1)+rand*(limofpar(2,num1)-limofpar(1,num1));
    end
    
    if pos(y,num1)>limofpar(2,num1)
        pos(y,num1)=limofpar(1,num1)+rand*(limofpar(2,num1)-limofpar(1,num1));
    end
    
end
      
end









