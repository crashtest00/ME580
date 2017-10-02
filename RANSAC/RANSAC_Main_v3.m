% RANSAC Main
clear all
close all
clc

dMax = 10; %distance threshold
t = 6; %subset size (Minimum number of pts required for line)
raw = load('data_file4.csv'); %data file
hasDups = xy_convert(raw);
A = unique(hasDups(:,1:2),'rows','stable'); %Remove duplicates
Original = A;
goodPts = []; %empty array for good line vertices
solutions = []; %All solutions
p = .99;
w = .50;
k = log(1-p)/(log(1-w^2));
limit = 0; %Counter to prevent an endless loop

%Iterate until A is pretty much empty. What's left should be outliers/noise
while (size(A,1) > 30) && (limit <= 300)
    %Perform random sample consensus
    set = [];
    setMax = [];
    for i=1:k
        %Randomly select 2 different numbers between 1 and A.size
        SampleIndex = randperm(size(A,1),2);
        
        %Use SampleIndex results to get two randomw points
        x = [A(SampleIndex(1),1); A(SampleIndex(2),1)];
        y = [A(SampleIndex(1),2); A(SampleIndex(2),2)];
        ranPts = [x y ones(size(x))];

        %Fit a line to the random points
        line = getLine_v2(ranPts);
        plot(line)
        
        %Get all points that are less than dMax from line & their index
        [idx_In] = getInliers(line, A, dMax)
        scatter(A(idx_In,1), A(idx_In,2))
        axis([-500 1500 -3000 1500])

        %Add set to list if set size is big enough & set size is > setMax
        if size(idx_In,1) >= t && size(idx_In,1) > size(setMax,1);
            %refit line to points in setMax
            setMax = [A(idx_In,:) ones(size(idx_In))];
            goodLine = setMax;
            index = idx_In;
        end
    end
    
    %Add setMax to solution
    solutions = vertcat(solutions,getGoodPts(setMax))
    for i=1:size(solutions,1)
        hold on
        %plot(solutions(:,1), solutions(:,2))
        axis([-500 1500 -3000 1500])
    end
    %figure;scatter(A(:,1),A(:,2))      
    
    %Delete points that are in setMax from the main set
    for i = 0:(size(setMax,1)-1)
        A(index(size(setMax,1)-i),:)=[];
    end
    
    %if no solutions are found, increment the limit counter
    if size(setMax) == 0 
        limit = limit + 1;
    end
end

hold on
for i=1:size(solutions,1)
    %consolidate(solutions)
    plot(solutions(:,1), solutions(:,2))
    axis([-500 1500 -3000 1500])
end
%plot original points
figure;scatter(Original(:,1),Original(:,2))
hold off
