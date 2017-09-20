function xy = xy_convert(raw)
raw = raw';
depth = raw(1:6:end);
theta = linspace(120,-120,length(depth))';
xy = [cosd(theta).*depth, sind(theta).*depth];