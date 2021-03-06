%% Support vector machine test

clear;close all;clc;

% load data
fprintf('Load and visualize data');
load('ex6data1.mat');

% plot data
pos=find(y==1);neg=find(y==0);
plot(X(pos,1),X(pos,2),'k+','LineWidth',1);
hold on
plot(X(neg,1),X(neg,2),'ko','MarkerFaceColor','y');
hold off

% linear svm
C=1
model=svmTrain(X,y