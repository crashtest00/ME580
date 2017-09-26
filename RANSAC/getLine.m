function goodPts = getGoodPts(set)
[x1, pt1] = min(set(:,1));
[x2, pt2] = max(set(:,1));
y1 = set(pt1,2);
y2 = set(pt2,2);
goodPts = [x1 y1 x2 y2 ];