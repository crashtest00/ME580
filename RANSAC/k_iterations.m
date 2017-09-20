%RANSAC Derivation
% N = number of points (length of data table)
% p = probability of no outliers
% w = probability of selecting inlier
% w = number of inliers/n
% pow(w,2) = probability that both points are inliers
% 1-pow(w,2) = probablity that at least one is an outlier
% k = iterations
% pow(1-pow(w,2),k) = probability that RANSAC never selects two points that 
% are both inliers
% 1-p = the above equation, thus:

% The following equation requires an estimate of the percentage of
% points that are inliers (w) and the probability of success (p)
function [k] = k_iterations(p,w)
k = log(1-p)/(log(1-pow(w,2)

% w could be improved by iteratively updating this estimate

% When you find a line, add to the output and remove those points 
% from the data set