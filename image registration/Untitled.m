%ͼ�����ƽ�ơ���ת������
clear;
close all;

img1=imread('picture\mri2.png');
%ͼ��ߴ����
img1=imresize(img1,[512,512]);%����ͼƬ�ĳߴ�
img1=rgb2gray(img1);%���ɫͼת��Ϊ�Ҷ�ͼ
%figure,imshow(img1);
imwrite(img1,'picture\mri21.png');%����ͼ��
%I1=double(img1);
%img1=(I1-min(I1(:)))/(max(I1(:))-min(I1(:)))*255;
%ƽ�� 
se=translate(strel(1),[30 40]);%��С���䣬����Y,X����ƽ��(���º����ҷֱ�ƽ����30��40������)
img2=imdilate(img1,se);
imwrite(img2,'picture\mri22.png');
%��ת
img3=imrotate(img2,-40,'bilinear','crop');
     %B = imrotate(A,angle)��ͼ��AΧ�������ĵ�����ʱ�뷽����ת�Ƕȡ� Ҫ˳ʱ����תͼ����ָ���Ƕȵĸ�ֵ��
     %B = imrotate��A��angle��method����תͼ��A��ʹ�÷���ָ���Ĳ�ֵ������
     %bilinear˫���Բ�ֵ   %cropʹ���ͼ��B����������ͼ��A��ͬ�ĳߴ磬�ü���ת���ͼ�����ʺ���ߴ�
     % Nearest����ھӲ�ֵ                                       
imwrite(img3,'picture\mri23.png');
figure;
subplot(2,2,1), imshow(img1); title('ԭͼ');
subplot(2,2,2), imshow(img2); title('ƽ��');
subplot(2,2,3), imshow(img3); title('ƽ��+��ת');
%i=imread('C:\Users\Administrator\Desktop\DaiMa\ct.BMP');
%save('ct.txt','i','-ascii');
%����
%img4=imresize(img1,2);
%figure,imshow(img4);
%imwrite(img4,'ct4.jpg');