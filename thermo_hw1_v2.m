close all; clear all; clc;

%% Variables
r     = linspace(5,20,10);
AFR   = linspace(5,20,10);
cv_percent = linspace(0,100,11);
result= zeros(length(r),length(AFR),length(cv_percent));
for i = 1:length(r)
    for j = 1:length(AFR)
        for k = 1:length(cv_percent)
            %r, AFR, cv_percent provided, 'cycle' function calculates and returns efficiency
            [result(i,j,k), ~,~]=cycle(r(i),AFR(j),cv_percent(k))
        end
    end
end
[X, Y] = meshgrid(r,AFR);

%% Graphs efficiency
max_0 = display_graph(X,Y,result,2,100) %Diesel Cycle (0%)
max_20 = display_graph(X,Y,result,3,20) %Dual Cycle 20%
max_40 = display_graph(X,Y,result,4,40) %Dual Cycle 40%
max_60 = display_graph(X,Y,result,5,60) %Dual Cycle 60%
max_80 = display_graph(X,Y,result,6,80) %Dual Cycle 80%
max_100 = display_graph(X,Y,result,1,0) %Otto Cycle (100%)