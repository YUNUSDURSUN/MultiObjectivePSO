function [parpos,post,dom,yem] = parfind(fonk,nofpar,pos,dim)
[f1,f2] = size(fonk);
dom = [];
yem = [];
parpos =zeros([f1 dim]);


for num1=1:1:nofpar    
 for num2=1:1:nofpar   
           
     if    fonk(num1,1)<=fonk(num2,1)&&fonk(num1,2)<fonk(num2,2) || fonk(num1,1)<fonk(num2,1)&&fonk(num1,2)<=fonk(num2,2)      
           [d,~]=find(dom==num2);
           if d==1;  

           continue;
           else
           dom =[dom num2];
           end
     end
         
 end
end

post = fonk;
dom = sort(dom);
sayac = 0;
for num1 = 1:length(dom)
    post(dom(1,num1)-sayac,:)=[];
    sayac = sayac+1;
end

sayac2=0;
for num3=1:nofpar
    for num4=1:length(dom)
   
        if num3~=dom(num4)
         
            sayac2 = sayac2 + 1;
         
        end

    end
        
    if sayac2==length(dom)
        yem=[yem num3];
    end
    sayac2=0;
end

for num5 = 1:length(yem)
    parpos(num5,:) = pos(yem(num5),:);
end

end






    