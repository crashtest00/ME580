function d = getSet(pt,line, dMax)
 d = abs(line(1)*pt(1)-pt(2)+line(2))/sqrt(line(1)^2+1)

%The code below is only need for R3 and isn't finished. The function would
% need two more arguments xLim and yLim
% v1 = [line(1)*xLim(1)+line(2) xLim(1)]
% v2 = [line(1)*xLim(2)+line(2) xLim(2)]
%     
% a = v1 - v2
% b = pt - v2
% d = norm(cross(a,b))/norm(a)