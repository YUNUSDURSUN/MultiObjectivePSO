function [pos,vel,pbest,pperf] = sopso_init(nofpar,dim,limofpar)

for num1 = 1:nofpar
    for num2 = 1:dim
        
        pos(num1,num2) = limofpar(1,num2)+rand*(limofpar(2,num2)-limofpar(1,num2));
        vel(num1,num2) = limofpar(1,num2)+rand*(limofpar(2,num2)-limofpar(1,num2));
        
    end
end

pbest = pos;
pperf = 10^9*ones(nofpar,2);

end