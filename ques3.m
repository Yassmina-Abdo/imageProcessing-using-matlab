function [ numHoles ] = ques3( Img)

GrayImg   = rgb2gray(Img);
binaryImg =~ imbinarize(GrayImg);


[~, numHoles] = bwlabel(binaryImg);
numHoles = numHoles-1;
end

