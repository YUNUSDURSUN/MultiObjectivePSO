clear all;close all;clc;
nofpar = 50;
pos = 5*rand(nofpar,2);
dom = [];

for num1=1:1:nofpar    
 for num2=1:1:nofpar   
           
     if    pos(num1,1)<=pos(num2,1)&&pos(num1,2)<pos(num2,2) || pos(num1,1)<pos(num2,1)&&pos(num1,2)<=pos(num2,2)      
           [d,f]=find(dom==num2);
           if d==1;                     
           continue;
           else
           dom =[dom num2];
           end
     end
         
 end
end

post = pos;
dom = sort(dom);
sayac = 0;
for num1 = 1:length(dom)
    post(dom(1,num1)-sayac,:)=[];
    sayac = sayac+1;
end

plot(pos(:,1),pos(:,2),'bo');hold on;plot(post(:,1),post(:,2),'rs');grid on;
xlabel('Objective Function-I');
ylabel('Objective Function-II')
    