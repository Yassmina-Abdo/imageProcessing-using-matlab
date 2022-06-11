function [ numberOfsquares ] = ques5( Img )

GrayImg   = rgb2gray(Img);
binaryImg = imbinarize(GrayImg);

[L ,num] = bwlabel(binaryImg);
stats = regionprops (L ,'ConvexArea', 'Perimeter' );

numberOfsquares=0;
for R=1:num
    circularity = (stats(R).Perimeter .^ 2) / (4 * pi * stats(R).ConvexArea);
    if (circularity >1) %Circles       
            numberOfsquares = numberOfsquares + 1;                               
    end
end  
end

