% Taking vector_raw_data  {raw_vec}  from acknowledge.
% Number of channel: nochannel
% Number of subjects: nosub
% Number of segments: noseg
% Number of trials: notri
% size of window: sizwin
%considering there is an array of labels, i.e label_vec so that the classified data can be compared with the labels.
nosub = 7;
nochannel = 2;
Notri = 10;
wave = 'db4';
segments = 9;
K = 2;
max_iter = 100;
raw_vec = raw_vec_initial(:,[3],:);
    
raw_vec = Filterdesignusinginbuiltoolbox(raw_vec); % wavelet is a 3D array having C and L,So 
                                                   %cD coefficients have to
                                                   %be extracted from it.
                                                   
                                                   
[wavelet cwhole] = Dwt(raw_vec,segments,wave);

[nor_wavelet MEAN STD] = normalisation(wavelet);





%idx = K_mean_clustering(nor_wavelet,K,max_iter);
%  idx = idx-1;
%    
     idx = zeros(size(raw_vec,1),1);
     idx(size(raw_vec,1)/2+1:end,1) = 1;
     
     ids = idx==0;
     x1 = nor_wavelet(ids,:);
     
     ids = idx==1;
     x2 = nor_wavelet(ids,:);
     
     
     x1_new = x1(101:end,:);
     x1_cross = x1(1:100,:);
     x2_new = x2(101:end,:);
     x2_cross = x2(1:100,:);
     
%       ids = idx==1;
%      idx(ids,:) = 0;
%       ids = idx==2;
%      idx(ids,:) = 1;
     svm_x = [x1_new; x2_new];
     svm_y = zeros(size(x1_new,1)+size(x2_new,1),1);
     svm_y(1:size(x1_new,1)) = 0;
     svm_y(size(x1_new,1)+1:end) = 1;
     
     
     
     svm_cross_x = [x1_cross; x2_cross];
     svm_cross_y = zeros(size(x1_cross,1)+size(x2_cross,1),1);
     svm_cross_y(1:size(x1_cross,1)) = 0;
     svm_cross_y(size(x1_cross,1)+1:end) = 1;
     
     display('accuracy on training data...');
      [accuray model] = SVM(svm_x,svm_y,.01,4)
% 
% 
%        [ accuracy1 model] = SVM(nor_wavelet,idx,.00001,.5);
%       
%      display('accuracy on test data...');     
%      
     pred = svmclassify(model,svm_cross_x);
     accuracy2 = mean(double(pred == svm_cross_y))
%      
%       display('accuracy on cross_validation data...');
%      pred = svmclassify(model,filtered_cross);
%      accuracy3 = mean(double(pred == cross_y));
%       %database(i,:) = [ C sigma accuracy1 accuracy2 accuracy3];
% 
%      
% 
% 
% % %     label_vec = [zeros(1,size(raw_vec,1)/2) ones(1,size(raw_vec,1)/2)];
% % % 	label_vec = leabel_vec';
% %     label_vec = ones(size(raw_vec,1),1);
% %     label_vec(size(raw_vec,1)/2+1:end,1) = 2;
% %     right_vec = idx==label_vec;
% % 	correct_classi_vec = sum(sum(right_vec));
% % 	percentage_vec = correct_classi_vec*100/(size(raw_vec,1)); 
% % 	disp(percentage_vec);
% %     idx2 = idx(1635:end,:);
% %     idx1 = idx(1:1634,:);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %     
% % [y0 y2 v] = LDA (x1_new,x2_new);
% % first_set = x1_cross*v;
% % second_set = x2_cross*v;
% % var1 = first_set - repmat(mean(y0),size(first_set,1),1);
% % var2 = first_set - repmat(mean(y2),size(second_set,1),1);
% % decision_var = var2>var1;
% % sum(dcision_var);



     















     
    
    
    