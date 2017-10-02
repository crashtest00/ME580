function [Ax By C] = getLine_v2(A) 
% This function will return components of a line equation for a set 
%of points

%Create proper matrix format if input is in 2D
if size(A,2) == 2
    A = [A ones(size(A))];
end

%Fit line
[U, S, V] = svd(A);
line_eq = V(:,3);
%normalize the line equation
line_eq = line_eq/sqrt(sum(line_eq(1:2).^2));
Ax = line_eq(1);
By = line_eq(2);
C = line_eq(3);
