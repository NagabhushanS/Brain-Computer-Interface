function nor_wavelet  = filtering (raw_vec_intial)   
    
nosub = 7;
nochannel = 2;
Notri = 10;
wave = 'db6';
segments = 9;
K = 2;
max_iter = 100;
raw_vec = raw_vec_intial(:,[1 2],:);
    
raw_vec = Filterdesignusinginbuiltoolbox(raw_vec); % wavelet is a 3D array having C and L,So 
                                                   %cD coefficients have to
                                                   %be extracted from it.
                                                   
                                                   
[wavelet cwhole] = Dwt(raw_vec,segments,wave);

[nor_wavelet MEAN STD] = normalisation(wavelet);

end