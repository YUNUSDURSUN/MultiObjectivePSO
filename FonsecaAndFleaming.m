function [z,cons] = FonsecaAndFleaming(data)
% Objective function : Test problem 'KUR'.
%*************************************************************************

z = [0, 0];
cons = [];

for i=1:10
    z(1) =z(1)+(data(i)-1/sqrt(10))^2; 
end
    z(1)=1-exp(-z(1));
for i=1:10
    z(2) =z(2)+(data(i)+1/sqrt(10))^2;
end 
    z(2)=1-exp(-z(2));