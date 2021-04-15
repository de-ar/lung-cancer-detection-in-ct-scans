%%
% Permission to use, copy, or modify this software and its documentation
% for educational and research purposes only and without fee is here
% granted, provided that this copyright notice and the original authors'
% names appear on all copies and supporting documentation. This program
% shall not be used, rewritten, or adapted as the basis of a commercial
% software or hardware product without first obtaining permission of the
% authors. The authors make no representations about the suitability of
% this software for any purpose. It is provided "as is" without express
% or implied warranty.
%
% Version 1.0, May 28, 2018.
% For any errors/sugesttions send an email to noor.khehrah@pucit.edu.pk or farid@di.unito.it
% For more details, visit http://www.di.unito.it/~farid/Research/hls.html
%
%% This software is an implementation of the following paper:
%
%   - N. Khehrah, M.S. Farid, S. Bilal, "Automatic Lung Nodule Detection in CT Scans,"
%     submitted to International Journal of Medical Informatics.
%
% If you use the this code in your research, kindly reference the above
% paper.
%%
%
% The code is not optimized for execution and for coding point of view. 
% An optimized version of the code will be released soon at the project webpage: 
% http://www.di.unito.it/~farid/Research/hls.html
%
%%
%

load('svmStruct.mat','SVMStruct');
% [label_train,scoretrain]= predict(SVMStruct,Training);
[images,centers,feature_set]  =  temporal_feature();
[r,c] = size(feature_set);

% 
for i = 1:(c-1)%% replace it with c
    feature = feature_set{i};
    [r1 c1] =  size(feature);
    
    [label,score] = predict(SVMStruct,feature);
    
    label_set{i} = label;
end

%
for i = 1:(c-1)
    label = label_set{i};
    [r1,c1] =  size(label);
    
    for j =1:r1
        if (label(j) == 1)
            center = centers{i};
            target_x = floor(center(j));
            target_y = floor(center(j,2));
            
            s =  im2double(images{i});
            J = regiongrowing1(s,target_y,target_x,0.2);
            figure, imshow(s+J),title(['Noduel is detected in slice num ',num2str(i),'shown as brightest region']);
            
            %%%%%%%%%highlight the region%%%%%%%%%
        end 
    end       
end