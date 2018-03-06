%图像进行平移、旋转、缩放
clear;
close all;

img1=imread('picture\mri2.png');
%图像尺寸调整
img1=imresize(img1,[512,512]);%调整图片的尺寸
img1=rgb2gray(img1);%真彩色图转换为灰度图
%figure,imshow(img1);
imwrite(img1,'picture\mri21.png');%保存图像
%I1=double(img1);
%img1=(I1-min(I1(:)))/(max(I1(:))-min(I1(:)))*255;
%平移 
se=translate(strel(1),[30 40]);%大小不变，进行Y,X方向平移(向下和向右分别平移了30和40个像素)
img2=imdilate(img1,se);
imwrite(img2,'picture\mri22.png');
%旋转
img3=imrotate(img2,-40,'bilinear','crop');
     %B = imrotate(A,angle)将图像A围绕其中心点以逆时针方向旋转角度。 要顺时针旋转图像，请指定角度的负值。
     %B = imrotate（A，angle，method）旋转图像A，使用方法指定的插值方法。
     %bilinear双线性插值   %crop使输出图像B具有与输入图像A相同的尺寸，裁剪旋转后的图像以适合其尺寸
     % Nearest最近邻居插值                                       
imwrite(img3,'picture\mri23.png');
figure;
subplot(2,2,1), imshow(img1); title('原图');
subplot(2,2,2), imshow(img2); title('平移');
subplot(2,2,3), imshow(img3); title('平移+旋转');
%i=imread('C:\Users\Administrator\Desktop\DaiMa\ct.BMP');
%save('ct.txt','i','-ascii');
%缩放
%img4=imresize(img1,2);
%figure,imshow(img4);
%imwrite(img4,'ct4.jpg');