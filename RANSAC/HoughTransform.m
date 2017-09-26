    % Hough Transform Main
    clear all
    close all
    clc

%    dMax = 50; %distance threshold
%    t = 2; %subset size (Minimum number of pts required for line)
    raw = load('data_file4.csv'); %data file
    A = xy_convert(raw);
%    goodPts = []; %empty array for good line vertices
%    solutions = []; %All solutions
%    p = .99;
%    w = .50;
%    k = log(1-p)/(log(1-w^2))*2;

    %Define the hough space
    %theImage = flipud(theImage);
    height =  
    width = 
 
    rhoLimit = norm([width height]); %How to define this? Could do xMax-xMin for width and yMax-yMin for height
    rho = (-rhoLimit:1:rhoLimit);          
    theta = (0:thetaSampleFrequency:pi); %increments through 180 degrees
 
    numThetas = numel(theta);
    houghSpace = zeros(numel(rho),numThetas); 
 
    %Find the "edge" pixels
    [xIndicies,yIndicies] = find(theImage); %This is just the x,y coordinates of the points. We have this
 
    %Preallocate space for the accumulator array
    numEdgePixels = numel(xIndicies);
    accumulator = zeros(numEdgePixels,numThetas);
 
    %Preallocate cosine and sine calculations to increase speed. In
    %addition to precallculating sine and cosine we are also multiplying
    %them by the proper pixel weights such that the rows will be indexed by 
    %the pixel number and the columns will be indexed by the thetas.
    %Example: cosine(3,:) is 2*cosine(0 to pi)
    %         cosine(:,1) is (0 to width of image)*cosine(0)
    cosine = (0:width-1)'*cos(theta); %Matrix Outerproduct  %Need to redefine width
    sine = (0:height-1)'*sin(theta); %Matrix Outerproduct  %Need to redefine height
 
    accumulator((1:numEdgePixels),:) = cosine(xIndicies,:) + sine(yIndicies,:);
 
    %Scan over the thetas and bin the rhos 
    for i = (1:numThetas)
        houghSpace(:,i) = hist(accumulator(:,i),rho);
    end
 
    pcolor(theta,rho,houghSpace);
    shading flat;
    title('Hough Transform');
    xlabel('Theta (radians)');
    ylabel('Rho (pixels)');
    colormap('gray');