% RANSAC Main
clear all
close all
clc

dMax = 25; %distance threshold
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
        
        %Use SampleIndex results to get two random points
        x = [A(SampleIndex(1),1); A(SampleIndex(2),1)];
        y = [A(SampleIndex(1),2); A(SampleIndex(2),2)];
        
        %Get line from random points
        [line(1) line(2) line(3)] = getLine_v2([x y]);
        
        %Get all points that are less than dMax from line & their index
        [set, setI] = getSetFromPoints(A,line,dMax);
        
        %Add set to list if set size is big enough & set size is > setMax
        if size(set,1) >= t && size(set,1) > size(setMax,1);
            setMax = set;
            index = setI;
        end
    end
    
    %Add largest set to solutions
    if size(setMax,1) >= t
        solutions = vertcat(solutions,getGoodPts(setMax));
        
        %Delete points that are in this solution from the main set
        for i = 2:(size(setMax,1)-1)
            A(index(size(setMax,1)-i),:)=[];
        end
    else
        limit = limit + 1;
    end
end

hold on
for i=1:size(solutions,1)
    plot([solutions(i,1) solutions(i,3)],[solutions(i,2) solutions(i,4)])
    axis([-500 1500 -3000 1500])
end
%plot original points
figure;scatter(Original(:,1),Original(:,2))
hold off