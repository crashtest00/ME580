function goodPts = getGoodPts(set)
%Fit new line to points
[U, S, V] = svd(set);
line_eq = V(:,3);
%normalize the line equation
line_eq = line_eq/sqrt(sum(line_eq(1:2).^2))
Ax = line_eq(1);
By = line_eq(2);
C = line_eq(3);

if abs(Ax/By) < 1
    %If slope is less than one, x should be the independent variable
    x1 = min(set(:,1));
    x2 = max(set(:,1));
    y1 = -Ax/By*x1-C/By;
    y2 = -Ax/By*x2-C/By;
    
else
    %If slope is greater than one, y should be the independent variable
    y1 = min(set(:,2));
    y2 = max(set(:,2));
    x1 = -By/Ax*y1-C/Ax;
    x2 = -By/Ax*y2-C/Ax;
end

%Return results
goodPts = [x1 y1 x2 y2 ];
