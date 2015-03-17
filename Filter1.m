[b a] = butter(5,[.002 .040],'bandpass');
 H = freqz(b,a, floor(1000));
 stem([1:1:1000], abs(H),'r');