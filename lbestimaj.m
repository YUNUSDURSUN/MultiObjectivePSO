function [sira] = lbestimaj(a,b)

for num1=1:length(a)
    for num2=1:length(b)
    
          vari(num1,num2)=a(num1)-b(num2);
        
    end
end

vari=100*abs(vari);


for num3=1:length(a)

[~,sira(num3)] = min(vari(num3,:));

end
end

