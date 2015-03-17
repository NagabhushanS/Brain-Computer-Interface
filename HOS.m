function vec_hos = HOS(c)
 vec_hos = zeros(1,0);
 sk = skewness(c);
 ku = kurtosis(c);
 vec_hos = [vec_hos var(c) sk ku bandpower(c)];
%  skewness(c);
 %kurtosis(c);
 
end
