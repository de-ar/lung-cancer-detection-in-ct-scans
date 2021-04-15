
function  [images,centers,feature_set]  =  statistical_feature
[images,centers] = segmentation();
[y,z]= size(centers);

for ii=1:z
 [rowc colc] = size(centers{ii});

 center = centers{ii};
 center = floor (center);

variance1 = [];
standard_dev1=[];
median11=[];
mean11=[];
rms11 = [];
  N = [];
    N_var1= [];
    N_sd1 =[];
    N_med1 = [];
    N_mean1 = [];
    N_rms1 = [];
 
  for l = 1:rowc
     im = im2double(images{ii});
     A = regiongrowing(im,center(l,2),center(l,1),0.15);
     N{l} = A;
    N_var1{l}= var(A(:));
    N_sd1{l} = std(A(:));
    N_med1{l} = median(A(:));
    N_mean1{l} = mean(A(:));
    N_rms1{l} = rms(A(:));
 end
          variance1=N_var1';
          standard_dev1 = N_sd1';
          median11 = N_med1';
          mean11 = N_mean1';
          rms11 = N_rms1';
          
       feature=[variance1 standard_dev1 median11 mean11 rms11];
       feature = cell2mat(feature);
       feature_set{ii} = feature;
        TF = isempty(feature_set{ii});
       
     if  (TF == 1)
         feature_set{ii} = [0,0,0,0,0];
     end
       %[rowc1 colc1] = size(feature_set{ii});
       
       
      %disp(rowc);
      %disp(rowc1);
   
end   
end
    


