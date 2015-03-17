listing = dir('C:\Users\Perceptron\Desktop\Brian_Computer_Interface\BCI_DATA\Gopal sharma')
files = listing(1:end);
big_data = zeros(0,13);
for i=1:13
    arr = load(files(i).name);
    arr = arr.data;
    big_data = [big_data ; arr(500:5500,:)]; 
end



  big_data = zeros(0,13);  
  
file = load('Untitled4.mat')    
arr = file.data;    
   big_data = [big_data ; arr(500:5500,:)];   
   file = load('Untitled5.mat')    
arr = file.data;    
   big_data = [big_data ; arr(500:5500,:)]; 
   file = load('Untitled6.mat')    
arr = file.data;    
   big_data = [big_data ; arr(500:5500,:)]; 
   file = load('Untitled7.mat')    
arr = file.data;    
   big_data = [big_data ; arr(500:5500,:)]; 
   file = load('Untitled8.mat')    
arr = file.data;    
   big_data = [big_data ; arr(500:5500,:)]; 
   file = load('Untitled9.mat')    
arr = file.data;    
   big_data = [big_data ; arr(500:5500,:)]; file = load('Untitled9.mat')    
arr = file.data;    
   big_data = [big_data ; arr(500:5500,:)]; 
   file = load('Untitled10.mat')    
arr = file.data;    
   big_data = [big_data ; arr(500:5500,:)]; 
   file = load('Untitled11.mat')    
arr = file.data;    
   big_data = [big_data ; arr(500:5500,:)]; file = load('Untitled12.mat')    
arr = file.data;    
   big_data = [big_data ; arr(500:5500,:)]; file = load('Untitled13.mat')    
arr = file.data;    
   big_data = [big_data ; arr(500:5500,:)]; 
   