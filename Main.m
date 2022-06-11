clear all;
close all;
clc;
org=im2double(imread('A.png'));
%org=rgb2gray(org);
org=floor(org*255);
imshow(org);
z=org;
for rat=0.1:0.4:1
     org=padarray(z,[30 30],'symmetric','both');
     [m,n]=size(org);

     n_img=org;
     n_img1 = n_img;
     out1=RemovePeriodicNoise(n_img(:,:,1));
     Rst_Img1=out1;
     out2=RemovePeriodicNoise(n_img(:,:,2));
     Rst_Img2=out2;
     out3=RemovePeriodicNoise(n_img(:,:,3));
     Rst_Img3=out3;
     multi = cat(3,Rst_Img1/255,Rst_Img2/255,Rst_Img3/255);
     montage(multi);
     
end
