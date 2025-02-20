function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

parameter_list=[0.01 0.03 0.1 0.3 1 3 10 30]';
J=ones(8,8);
for i=1:size(parameter_list,1)
  C=parameter_list(i,1);
  for j=1:size(parameter_list,1)
    sigma=parameter_list(j,1);
    m=svmTrain(X,y,C,@(x1,x2)gaussianKernel(x1,x2,sigma));
	predictions=svmPredict(m,Xval);
	mean_pred_error=mean(double(predictions~=yval));
	J(i,j)=mean_pred_error;
  end;
end;
min_c=1;
min_s=1;
for i=1:size(parameter_list,1)
  for j=1:size(parameter_list,1)
    if J(i,j)<J(min_c,min_s)
	  min_c=i;
	  min_s=j;
	end;
  end;
end;
C=parameter_list(min_c,1);
sigma=parameter_list(min_s,1);





% =========================================================================

end
