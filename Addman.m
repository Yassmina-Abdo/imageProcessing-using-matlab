function [ img2 ] = Addman(img1, img2)
[h, w, c] = size(img1);

for i=1:h
    for j = 1:w
        if img1(i,j,1) ~= 0 || img1(i,j,2) ~= 0 || img1(i,j,3) ~= 0
            img2(i,j,:) = img1(i,j,:);
        end
        
    end
end


end

