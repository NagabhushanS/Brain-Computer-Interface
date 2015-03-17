load leleccum; 
s = leleccum(1:3920); 
l_s = length(s);
[cA1,cD1] = dwt(s,'db1');
A1 = upcoef('a',cA1,'db1',1,l_s); 
D1 = upcoef('d',cD1,'db1',1,l_s);
subplot(3,3,1); plot(A1); title('Approximation A1')

subplot(3,3,2); plot(D1); title('Detail D1');

subplot(3,3,3); plot(s); title('original signal ');
subplot(3,3,4); plot(f); title('reconstructed signal')

subplot(3,3,5); plot(cA1); title('cA1');
subplot(3,3,6); plot(cD1); title('cD1')





load leleccum; 
s = leleccum(1:3920); 
l_s = length(s);
segments = 8;
[C,L] = wavedec(s,segments,'db1');

cA3 = appcoef(C,L,'db1',8);
cA2 = appcoef(C,L,'db1',7);
cA1 = appcoef(C,L,'db1',6);
[cD1,cD2,cD3] = detcoef(C,L,[8, 7, 6]);
subplot(3,3,1); plot(cD1);
subplot(3,3,2); plot(cD2);
subplot(3,3,3); plot(cD3);
subplot(3,3,4); plot(cA1);
subplot(3,3,5); plot(cA2);
subplot(3,3,6); plot(cA3);




