function [ N_objects ] = ques2( Img )

GrayImg   = rgb2gray(Img);
binaryImg = imbinarize(GrayImg);


[~, N_objects] = bwlabel(binaryImg);

end

