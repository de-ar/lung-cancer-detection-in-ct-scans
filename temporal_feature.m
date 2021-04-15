%%%%%% This funtion calculate  temporal feature for each nodule candiate
%%%%%% detected by segmentation function.
function  [images,centers,feature_set]  =  temporal_feature  
[images,centers,feature_set] = statistical_feature();
[nr,nc] = size(centers);
tf = [];
tf{1}= 0;
%feature_set{1} = [feature_set{1},tf{1}'];
q = 1;

for i =1:(nc-2)
center1 = centers{1,q};
center2 = centers{1,q+1};
center3 = centers{1,q+2};

center1 = floor(center1);
C1 = isempty(center1);
       
     if  (C1 == 1)
         center1 =[0,0];
     end
[rowc1,colc1] = size(center1);

center2 = floor(center2);
C2 = isempty(center2);
       
     if  (C2 == 1)
         center2 =[0,0];
     end
[rowc2,colc2] = size(center2);

center3 = floor(center3);
C3 = isempty(center3);
       
     if  (C3 == 1)
         center3 =[0,0];
     end
[rowc3,colc3] = size(center3);
r1=[];
r2=[];
r3=[];

for p = 1:rowc2
%    disp(r1);
%     disp(r2);
%     disp(r3);
    for n = 1:rowc1
        %          if (0<X) && (X<1)
        if (((center2(p,1)-15)<center1(n,1))&&(center1(n,1)<(center2(p,1)+15))) && (((center2(p,2)-15)<center1(n,2)) && (center1(n,2)<(center2(p,2)+15)))
            r1(p) = 1;
         break;   
        else
            r1(p) = 0;
        end
        
    end
    for m = 1:rowc3
        %          if (0<X) && (X<1)
        if ((center2(p,1)-15)<center3(m,1))&&(center3(m,1)<(center2(p,1)+15)) && ((center2(p,2)-15)<center3(m,2) && center3(m,2)<(center2(p,2)+15))
            r3(p) = 1;
            break;
        else
            r3(p) = 0;
        end
        
    end
    
end
for nm = 1:rowc2
    if r1(nm)|| r3(nm)
        r2(nm)=1;
    else
        r2(nm)=0;
    end




end
tf{i+1} = r2;
feature_set{i} = [feature_set{i},tf{i}'];

q = q+1;

end
feature_set{i+1} = [feature_set{i+1},tf{i+1}'];

end





