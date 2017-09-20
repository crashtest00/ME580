function set = getSetFromLine(xy,line, dMax)
set = []; %Array for x, y, d, and original index of good points
for i = 1:length(xy)
   d = abs(line(1)*xy(i,1)-xy(i,2)+line(2))/sqrt(line(1)^2+1);
   if d <= dMax
       pt = [xy(i,1), xy(i,2), d, i];
       set = vertcat(set,pt);
   end
end
        
 
%The code below is only needed for R3 and isn't done. The function would
% need two more arguments xLim and yLim along with unidentified work
% v1 = [line(1)*xLim(1)+line(2) xLim(1)]
% v2 = [line(1)*xLim(2)+line(2) xLim(2)]
%     
% a = v1 - v2
% b = pt - v2
% d = norm(cross(a,b))/norm(a)