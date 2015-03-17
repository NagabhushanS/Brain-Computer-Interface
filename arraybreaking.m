cd('C:\Users\Perceptron\Desktop\Brian_Computer_Interface\DSP\Genres');
listing = dir('C:\Users\Perceptron\Desktop\Brian_Computer_Interface\DSP\Genres');
Features = zeros(1000,36,265);
cd('C:\Users\Perceptron\Desktop\Music_Recommendation\Audio_Signal_Directory\library');
files = listing(i:end);
for i=[3:end]

[signal fs]= audioread(files(i).name);
Features(i,:,:) = stFeatureExtraction(signal, fs, .025, .010);
end











