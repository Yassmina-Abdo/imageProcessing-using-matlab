function [ NumOfObjHoles ] = ques4( Img )

GrayImg   = rgb2gray(Img);
binaryImg = imbinarize(GrayImg);

STATS = regionprops( binaryImg, 'EulerNumber');
holeIndices = find( [STATS.EulerNumber] < 1 ); 
[~,NumOfObjHoles] = size(holeIndices);


end

