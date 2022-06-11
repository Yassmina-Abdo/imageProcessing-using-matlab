function [B] = DetectUselessBitsInImage(original_image)


image  = rgb2gray(original_image);

[H, W] = size(image) ;
bit1=0;
bit2=0;
bit3=0;
bit4=0;
bit5=0;
bit6=0;
bit7=0;
bit8=0;


for	y=1:H
	for x=1:W
        mybin=image(y,x);             
        for a=1:8
            if(a==1)
                mymask=1;
                newbin=bitand(mybin, mymask);             
                 if(newbin~=0)
                     bit1=bit1+1;
                 end
                continue
            end
            if(a==2)
                mymask=2;
                newbin=bitand(mybin, mymask);
                 if(newbin~=0)
                     bit2=bit2+1;
                 end
                 continue
            end
            if(a==3)
                mymask=4;
                newbin=bitand(mybin, mymask);
                 if(newbin~=0)
                     bit3=bit3+1;
                 end
                 continue
            end
            if(a==4)
                mymask=8;
                newbin=bitand(mybin, mymask);
                 if(newbin~=0)
                     bit4=bit4+1;
                 end
                 continue
            end
            if(a==5)
                mymask=16;
                newbin=bitand(mybin, mymask);
                 if(newbin~=0)
                     bit5=bit5+1;
                 end
                 continue
            end
            if(a==6)
                mymask=32;
                newbin=bitand(mybin, mymask);
                 if(newbin~=0)
                     bit6=bit6+1;
                 end
                 continue
            end
            if(a==7)
                mymask=64;
                newbin=bitand(mybin, mymask);
                 if(newbin~=0)
                     bit7=bit7+1;
                 end
                 continue
            end
             if(a==8)
                mymask=128;
                newbin=bitand(mybin, mymask);
                 if(newbin~=0)
                     bit8=bit8+1;
                 end
                 
            end
                 
            
        end
  end
end
 


useless=W*H*10/100;

if(bit1<useless)
    B=1;
end

if(bit2<useless)
    B=[B,2];
end

if(bit3<useless)
    B=[B,3];
end

if(bit4<useless)
    B=[B,4];
end

if(bit5<useless)
    B=[B,5];
end

if(bit6<useless)
     B=[B,6];
end

if(bit7<useless)
     B=[B,7];
end

if(bit8<useless)
     B=[B,8];
end


end


