function [pperf,pbest] = sopso_eval(pos,pperf,pbest,y)


%       [z,con]=  TP_KUR_objfun(pos(y,:));
       [z,~] = FonsecaAndFleaming(pos(y,:));

    nx=z(1);
    mx=z(2);
    if (nx<=pperf(y,1)) && (mx<pperf(y,2)) 
        pperf(y,1) = nx;
        pperf(y,2) = mx;
        pbest(y,:) = pos(y,:);
    end
    
end       


