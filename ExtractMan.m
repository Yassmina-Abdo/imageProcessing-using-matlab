function [ d ] = ExtractMan(M)
[h, w, c] = size(M);
I = zeros(h,w,c);

for i=1:h
    for j = 1:w
        I(i,j,:) = M(i,j,:);
    end
end

[h, w, c] = size(I);
s = zeros(h,w,c);
for i=1:h
    for j = 1:w
        if I(i,j,3)>I(i,j,2)&& I(i,j,2)> I(i,j,1) &&  (I(i,j,2)-I(i,j,1))>=1 && I(i,j,3)-I(i,j,2 ) >= 10 && I(i,j,1)-I(i,j,2)<=5
            I(i,j,:) = s(i,j,:);
        end
        
    end
end

I = medfilt3(I);


gr = rgb2gray(I);
s = im2bw(gr,0.001);
BW = edge(s,'canny');
se = strel('square', 5);
BW = imdilate(BW,se);
BW = ~BW;
[L, num] = bwlabel(BW);
RGB = label2rgb(L);
%figure,imshow(RGB);

[h, w, ~] = size(M);
smallRatio = h*w*0.002;
for i=1:num
    x = uint8(L==i);
    f = sum(sum(x==1));
    if(f < smallRatio)
        continue;
    end
    d = zeros(size(M));
    d(:,:,1) = uint8(x).*M(:,:,1);
    d(:,:,2) = uint8(x).*M(:,:,2);
    d(:,:,3) = uint8(x).*M(:,:,3);

    
end
d= uint8(d);
figure,imshow(d);
img2 = imread('jump2.jpg');
[a, b, c] = size(img2);
d = imresize(d,[a b]);
result = Addman(d,img2);
figure,imshow(result);
end

