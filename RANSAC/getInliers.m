function [idx_In]= getInliers(line, A, dMax)

threshold = dMax^2;

pile = [A ones(length(A),1)];
d = abs(pile*line);
idx_In = find( d < dMax);

%distMax steps
%delta matrix is subset of A(idx_In) w/ change in x, change in y, and idx

% for i = 1:size(idx_In,1)
%     %Check distance from next point
%     gaps = diff(potentials,[],2)
%     checkDist = 
%     idx_In = find(sum of the squares of the elements in A < square dMax
    