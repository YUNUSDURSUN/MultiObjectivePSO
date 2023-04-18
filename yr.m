function [post,parpos,sayacon]=yr(nofpar,ymax,sayacon,conver)

limofpar = [-4 -4 -4 -4 -4 -4 -4 -4 -4 -4 ;4 4 4 4 4 4 4 4 4 4 ];
dim = 10;

c1=2;
c2=2;
% krs = load ('krsw.txt');

[pos,vel,pbest,pperf] = sopso_init(nofpar,dim,limofpar);

for  d=1:ymax
    for  y=1:nofpar
        [pperf,pbest] = sopso_eval(pos,pperf,pbest,y);
        
%         [z,~] = TP_KUR_objfun(pos(y,:));
 [z,~] = FonsecaAndFleaming(pos(y,:));
        fx=z;
        f1x=fx(1);
        f2x=fx(2);
        fonk(y,:) = [f1x f2x];
        
        
    end
    
    [parpos,post,dom,yem] = parfind(fonk,nofpar,pos,dim);
    
    [zreelfonk,zimajfonk,yreelfonk,yimajfonk]= smithc(fonk);
    
    [zreelpost,zimajpost,yreelpost,yimajpost]= smithc(post);

      [sira3] = lbestimaj(yreelfonk,yreelpost);

    
    
    for y=1:nofpar
         
            [pos, conver,sayacon ] =sopso_update(pos,parpos,vel,pbest,conver,y,c1,c2,dim,limofpar,sira3,nofpar,sayacon);

        

    end

    clf;
   plot(post(:,1),post(:,2),'bo',fonk(:,1),fonk(:,2),'r.');
    xlabel('Objective Function-I' );
    ylabel('Objective Function-II');
%     axis([-20 -14 -12 2]);
    pause(0.001)
    
end
parpos=parpos(1:length(yem),:);
end
