function [B] = DetectUselessBitsInImage2(original_image)


grayI  = rgb2gray(original_image);


[rows,cols] = size(grayI);
mask=1;
B=[];
counter=0;
rate = ( rows*cols)*10/100;
%----------------------------------------------------
for bit= 1:8        % loop for each bit in pixel
  %----------------------------------------------------
  for i=1:rows      % loop for rows 
     for j=1:cols   % loop for cols     
         mypixel= grayI(i,j);        
         andres = bitand(mypixel,mask);
         if( andres ~= 0)
             counter=counter+1;
         end
     end
  end
  %----------------------------------------------------
  if rate>counter
      B=[B, bit];
  end
  counter=0;
  mask =mask*2;
end



end

