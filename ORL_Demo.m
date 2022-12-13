% % % The code is written by Jie Wen, if you have any problems, 
% % % please don't hesitate to contact me: jiewen_pr@126.com
 
% % % If you find the code is useful, please cite the following reference:
% % % Jie Wen, Yong Xu, Hong Liu, Incomplete Multi-view Spectral Clustering with
% % % Adaptive Graph Learning, IEEE Transactions on Cybenetics, 2018.
% % % 
% % % Note: tune parapeters lambda1, lambda2, lambda3, to achieve the best results
% % % 
% % % Influneced by the initilzation of k-means or the matlab versions, 
% % % the clustering results may have little deviations to the reuslts reported in the paper.
clear;


Dataname = 'ORL_Per0_3';
Datafold = 'ORL_Folds';
load(Dataname);
load(Datafold);
ind_folds = folds{3};
truthF = truelabel{1};  
numClust = length(unique(truthF));
X = data;
lambda1  = 0.001;
lambda2  = 0.000001;
lambda3  = 0.01;

  


[preY] = SLESC(X,ind_folds,numClust,lambda1,lambda2,lambda3);
[~, preY] = max(preY, [], 2);
result = ClusteringMeasure(truthF, preY)    
