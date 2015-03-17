f = [0 0.002 0.005 0.010 0.020 1];
a = [0 1.0 1.0 1.0 1.0 0];

f1 = [0:0.0001:0.0009];
f2 = [0.001:.0001:.019];
f3 = [0.02:.0001:1];
f = [ f1 f2 f3];
a1 = zeros(1,10);
a2 = ones(1,size(f2,2));
a3 = zeros(1,size(f3,2));
a = [a1 a2 a3];




b = firpm(5,f,a);

[h,w] = freqz(b,1,512);
plot(f,a,w/pi,abs(h))
legend('Ideal','firpm Design')
xlabel 'Radian Frequency (\omega/\pi)', ylabel 'Magnitude'