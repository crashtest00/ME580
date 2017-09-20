% RANSAC Main
clear all
close all
clc

dMax = 5; %distance threshold
t = 4; %subset size
raw = load('data_file4.csv'); %data file
A = xy_convert(raw);
goodPts = []; %empty array for good line vertices
solutions = []; %All solutions
p = .90;
w = .4;
k = log(1-p)/(log(1-w^2));

%Iterate until A is pretty much empty. What's left should be outliers/noise
while length(A) > t
    %Perform random sample consensus
    set = [];
    setMax = [];
    for i=1:k
        %Randomly select 2 different numbers between 1 and A.length
        SampleIndex = randperm(length(A),2);
        
        %Use SampleIndex results to read two points into memory
        x = [A(SampleIndex(1),1), A(SampleIndex(2),1)];
        y = [A(SampleIndex(1),2), A(SampleIndex(2),2)];
        
        %Get all points that are less than dMax from line
        set = getSetFromPoints(A,x,y,dMax);
        
        %Add set to list if set size is big enough & set size is > setMax
        if length(set) >= t && length(set) > length(setMax);
            setMax = set;
        end
    end
    
    %Add largest set to solutions
    if length(setMax) ~= 0
        solutions = vertcat(solutions,getGoodPts(setMax));
        
        %Delete points that are in this solution from the main set
        j=1;
        for i = 1:length(set)
            j=j+1;
            debug = setMax(j-i,4);
            A(setMax(j-i,4),:)=[];
        end
    end
end
        
%plot results
hold on
for i=1:length(solutions)
     plot([solutions(i,1) solutions(i,3)],[solutions(i,2) solutions(i,4)])
end

%plot original points
A = xy_convert(raw);
scatter(A(:,1),A(:,2))
%figure;plot(A(:,1),A(:,2),'*-r')
