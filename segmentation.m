function [images,centers] = segmentation  %%%% this function performs lungs segmentation and detction of nodule candidates



%%%%%%%%%read all images present in the current directory%%%%
imagefiles = dir('*.png');      
nfiles = length(imagefiles);  
% Number of files found

for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   im = imread(currentfilename);
   images{ii} = im;
   %imshow(currentimage);
   
   
   %figure,imshow(im),title('Original Image');
    % to dump the circular area around lungs
    y = imhist(im);
    DataInv = 1.01*max(y) - y;
    [Minima,MinIdx] = findpeaks(DataInv,'MinPeakDistance',10);
    im1=im;
    im1(im<MinIdx(2))=0;
   % figure,imshow(im1),title('Initial Thresh(Min Peak)');
    im1= imgaussfilt(im1);
    im2= 255-im1;
    %binary image
    t = graythresh(im2);
    % figure,imshow(im2);
    im3 = im2bw(im2,t);
    % figure,imshow(im3);
    CC = bwconncomp(im3);
    im5=im3;
    numPixels = cellfun(@numel,CC.PixelIdxList);
    [biggest,idx] = max(numPixels);
    im5(CC.PixelIdxList{idx}) = 0;
   % figure,imshow(im5),title('Connected Components Result');
%     se = [1 1 1 1,1 1 1 1,1 1 1 1];
%      im5 = imdilate(im5,se);
    im5 = imfill(im5,'holes');
    %figure, imshow(im5),title('Dilated Components');
    [row,col]=size(im5);
    for i=1:row
        for j=1:col
            if im5(i,j)==0
                im(i,j)=0;
            end
        end
    end
   % figure, imshow(im),title('Extracted Lungs');
    % K = wiener2(im,[5 5]);
    % figure, imshow(K);
    im = imcrop(im,[67.5100  143.5100  392.9800  295.9800]);
    images{ii} =im;
    im6 = im;
    %figure,imshow(im6);
    im6(im<200) = 0 ;
    %figure,imshow(im6),title('internal structures');
  
    [centers{ii}, radii] = imfindcircles(im6,[1 25],'ObjectPolarity','bright', ...
        'Sensitivity',0.85, 'EdgeThreshold',0.7);
    
    
    
end 

end
 
 
   
   %%%%%%%%%%%%%%%%%%%  statistical features %%%%%%%%%%%
   








