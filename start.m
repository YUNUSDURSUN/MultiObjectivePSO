clear all; close all ;clc;
format long
nofpar = 250;
ymax = 500;
conver=0;
sayacon=0;
% krs = load ('krsw.txt');

[post1,pos1,sayacon]=zr(nofpar,ymax,sayacon,conver);
[post2,pos2,sayacon]=zi(nofpar,ymax,sayacon,conver);
[post3,pos3,sayacon]=yr(nofpar,ymax,sayacon,conver);
[post4,pos4,sayacon]=yi(nofpar,ymax,sayacon,conver);

hold on
plot(post1(:,1),post1(:,2),'r*')
plot(post2(:,1),post2(:,2),'r*')
plot(post3(:,1),post3(:,2),'r*')
plot(post4(:,1),post4(:,2),'r*')
hold off

posttop=[post1;post2;post3;post4];    %bütün pareto elemanlarý
pozisyon =[pos1;pos2;pos3;pos4];      %bütün pareto elemanlarýnýn pozisyonlarý


dom = [];
num5=size(posttop);

for num1=1:num5(1)
    for num2=1:num5(1)
        
        if    posttop(num1,1)<=posttop(num2,1)&&posttop(num1,2)<posttop(num2,2) ...
                || posttop(num1,1)<posttop(num2,1)&&posttop(num1,2)<=posttop(num2,2)
            [d,f]=find(dom==num2);
            if d==1;
                continue;
            else
                dom =[dom num2];
            end
        end
        
    end
end

post = posttop;

dom = sort(dom);
sayac = 0;

for num1 = 1:length(dom)
    post(dom(1,num1)-sayac,:)=[];
    sayac = sayac+1;
end

sayac2=0;
yem1=[];
for num3=1:num5(1)
    for num4=1:length(dom)
   
        if num3~=dom(num4)
         
            sayac2 = sayac2 + 1;
         
        end

    end
        
    if sayac2==length(dom)
        yem1=[yem1 num3];
    end
    sayac2=0;
end

for num7 = 1:length(yem1)
    parposon(num7,:) = pozisyon(yem1(num7),:);
end
clf;
plot(post(:,1),post(:,2),'r*');
xlabel('Objective Function-I');
ylabel('Objective Function-II');
% axis([-20.1 -14.1 -12.1 2.1])
