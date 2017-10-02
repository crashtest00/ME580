% This function will check the dMax distance of the points left in A to the 
% line defined by the points in x and y arguments. It will also check the 
% dMax distance between points to ensure no jumps

function [set, index] = getSetFromPoints(xy, line, dMax)
index = [];
set = [];
workingSet = [];

Ax = line(1);
By = line(2);
C = line(3);

%Compare points in array to line
for i = 1:size(xy,1)
    d = abs(Ax*xy(i,1)+By*xy(i,2)+C);
    if d <= dMax && size(workingSet,1) < 1
       pt = [xy(i,1), xy(i,2),d];
       workingSet = pt;
       index = vertcat(index,i);
   elseif d <= dMax &&... %Check distances
           (abs(workingSet(size(workingSet,1),1) - xy(i,1)) <dMax*10) &&... 
           (abs(workingSet(size(workingSet,1),2) - xy(i,2)) <dMax*10)
       pt = [xy(i,1), xy(i,2), d];
       workingSet = vertcat(workingSet,pt);
       index = vertcat(index, i);
   end
end
set = workingSet;