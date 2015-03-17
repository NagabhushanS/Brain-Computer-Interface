function raw_vec = Filterdesignusinginbuiltoolbox(raw_vec)

	N      = 10;    % Order
	Fstop1 = 1;     % First Stopband Frequency
	Fstop2 = 40;    % Second Stopband Frequency
	Astop  = 40;    % Stopband Attenuation (dB)
	Fs     = 1000;  % Sampling Frequency

    h = fdesign.bandpass('n,fst1,fst2,ast', N, Fstop1, Fstop2, Astop, Fs);

    Hd = design(h, 'cheby2', ...
       'SystemObject', false);
    size(raw_vec)
    loop = size(raw_vec,1); % size 1400 = 20*7*10;
    temp = zeros(1,1000);
 	for i=1:loop
     temp = reshape(raw_vec(i,1,:),[1 1000]); 
     raw_vec(i,1,:)= filter(Hd,temp);
%      temp = reshape(raw_vec(i,2,:),[1 1000]);
%      raw_vec(i,2,:)= filter(Hd,temp);
    
 	end   
end
    
    





