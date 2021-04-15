
Permission to use, copy, or modify this software and its documentation for educational and research purposes only and without fee is here granted, provided that this copyright notice and the original authors' names appear on all copies and supporting documentation. This program shall not be used, rewritten, or adapted as the basis of a commercial software or hardware product without first obtaining permission of the authors. The authors make no representations about the suitability of this software for any purpose. It is provided "as is" without express or implied warranty.

 Version 1.0, May 28, 2018.

For any errors/sugesttions send an email to noor.khehrah@pucit.edu.pk  or farid@di.unito.it
For more details, visit 
http://www.di.unito.it/~farid/Research/hls.html


This software is an implementation of the following paper:

- N. Khehrah, M.S. Farid, S. Bilal, "Automatic Lung Nodule Detection in CT Scans," submitted to International Journal of Medical Informatics.

If you use the this code in your research, kindly reference the above paper.

--------------------------------------------------------------


This folder "demo" contains following files

1)main.m
2)segmentation.m
3)temporal_feature.m
4)statistical_feature
5)svmStruct
6)regiongrowing.m
7)regiongrowing1.m

Along with these files this folder contains some sample images of Lung Ct scans which are processed as demo.

segmentation.m performs lung segmentation,and nodule candidate detection.

temporal_feature.m calculates the temporal feature for each nodule candidate.

statistical_feature.m calculates the statistical features for each nodule candidate.

svmStruct is a classifier which classify each nodule candidate.

regiongrowing.m and regiongrowing1.m are used for extraction of nodules.

How to run this demo code 

1. Matlab must be insalled on the system.

2. The test images and all files must be in the same folder. 

3. Only main.m file must be called in order to run the whole program.

The problematic slice is shown as output and the nodule is shown in that slice as a bright white region.

Few slices show false positive (non-nodule tagged as nodule). 

-----------------------------------------------------------------

The code is not optimized for execution and for coding point of view. An optimized version of the code will be released soon at the project webpage: 
http://www.di.unito.it/~farid/Research/hls.html



