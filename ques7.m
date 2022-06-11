function  circles = ques7( Img )

GrayImg   = rgb2gray(Img);
L = bwlabel(GrayImg);

stats = regionprops (logical(GrayImg) , 'Area' , 'Perimeter' );

circularity = ([stats.Perimeter] .^ 2) ./ (4 * pi * [stats.Area]);
withoutHoles = circularity < 1; %Circles
indx = find(withoutHoles);
circles=ismember(L,indx);            
                      
end

