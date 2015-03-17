function [accuracy model]= SVM (X,y,C,sigma)


% We set the tolerance and max_passes lower here so that the code will run
% faster. However, in practice, you will want to run the training to
% convergence.
%model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 

model = svmtrain(X,y,'kernel_function','rbf', 'boxconstraint',C,'rbf_sigma',sigma);
% pred = svmPredict(model, X);
pred = svmclassify(model,X);

accuracy = mean(double(pred == y));


end
