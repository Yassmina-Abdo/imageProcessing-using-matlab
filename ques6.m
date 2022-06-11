function  HolesMatrix  = ques6( Img )

GrayImg   = rgb2gray(Img);
binaryImg = imbinarize(GrayImg);

[Rows ,Cols]=size(binaryImg);
HolesMatrix=zeros(Rows,Cols);

[L, num]=bwlabel(binaryImg);
stats = regionprops (L, 'ConvexArea', 'Perimeter');

for i=1:num
   [r ,c]=find(L==i);
   rmin=min(r);
   rmax=max(r);
   cmin=min(c);
   cmax=max(c);
   
   output=binaryImg(rmin-1:rmax+1,cmin-1:cmax+1);
   m=~output;
   
   [~, l]=bwlabel(m);
   holes=l-1; 
   
   circularity = (stats(i).Perimeter .^ 2) / (4 * pi * stats(i).ConvexArea);
   if (circularity >1) %Circles
     if(1-holes==-1)
       HolesMatrix(rmin-1:rmax+1,cmin-1:cmax+1)= output;
     end
   end     
end

end

