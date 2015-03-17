function [y0 y2 v] = LDA (c1,c2)
    
% 	c1 = wavelet(1:size(wavelet,1)/2,:);
% 	c2 = wavelet(size(wavelet,1)/2+1:end,:);


% Number of observations of each class
n1=size(c1,1);
n2=size(c2,1);

%Mean of each class
mu1=mean(c1);
mu2=mean(c2);

% Average of the mean of all classes
mu=(mu1+mu2)/2;

% Center the data (data-mean)
d1=c1-repmat(mu1,size(c1,1),1);
d2=c2-repmat(mu2,size(c2,1),1);


% Calculate the within class variance (SW)
s1=d1'*d1;
s2=d2'*d2;
sw=s1+s2;
invsw=inv(sw);

% in case of two classes only use v
v=invsw*(mu1-mu2)';

% if more than 2 classes calculate between class variance (SB)
% sb1=n1*(mu1-mu)'*(mu1-mu);
% sb2=n2*(mu2-mu)'*(mu2-mu);
% SB=sb1+sb2;
% v=invsw*SB;



% find eigne values and eigen vectors of the (v)

%[evec,eval]=eig(v);


% Sort eigen vectors according to eigen values (descending order) and
% neglect eigen vectors according to small eigen values
% v=evec(greater eigen value)
% or use all the eigen vectors

% project the data of the first and second class respectively
y2=c2*v;
y0=c1*v;
end