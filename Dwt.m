function [wavelet cwhole] = Dwt(raw_vec,segments,wave) %wave = 'db1'
 loop = size(raw_vec,1); % size 1400 = 20*7*10;
 wavelet = rand(size(raw_vec,1),(segments)*4);% the third dimension should be 
                                                       %checked after
                                                       %running wavedec
  cwhole = zeros(size(raw_vec,1),1058);                                             
  for i=1:loop  
   
     
    vec_fea = zeros(1,0);  
    [C,L] = wavedec(raw_vec(i,1,:),segments,wave);
     %cwhole(i,:) = C;
    for j=1:segments
     vec_fea = [vec_fea HOS(C(L(j)+1:L(j)+L(j+1)+1))];     
    end
    
        
%     [C,L] = wavedec(raw_vec(i,2,:),segments,wave);      
%     for j=1:segments
%      vec_fea = [vec_fea HOS(C(L(j)+1:L(j)+L(j+1)+1))];  
%     end
    wavelet(i,:) =  vec_fea;
    
    % vector of four ahould have normalised values.  
    
  end
  wavelet(1,:) = rand(1,size(wavelet,2));
  d = size(wavelet,1)/2;
  wavelet(d+1,:) = rand(1,size(wavelet,2));
end

    
    
    
    
    



