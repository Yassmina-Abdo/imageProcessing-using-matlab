function [ output_Value] = ques1( Img )

GrayImg   = rgb2gray(Img);
binaryImg = imbinarize(GrayImg);
[rows,cols] = size(binaryImg);
numberOfWhitePixels = sum(binaryImg(:));
output_Value =  numberOfWhitePixels / (rows*cols) ;

end

