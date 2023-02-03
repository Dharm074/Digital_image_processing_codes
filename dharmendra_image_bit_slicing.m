% this file converting image pixel value into binary (bit plane slicing)from color image %
                 % created by dharmendra (BT20ECE074) %
    
clc;
clear all;
close all;
           %first we are taking a color image as a input
I=imread('imsge.jpeg');
               %changing image into grayscale imagee
a=rgb2gray(I);
             %calculating size of image
[row,column]=size(a);
b=double(a);
         %changing decimal pixel value to binary
c=de2bi(b);
c1=c(:,1);  %  all rows and 1st column 
             %we are using reshape beacuse it will give all bits in only 1
             %column we have to make it row*column matrix
r1=reshape(c1,row,column);
c2=c(:,2);
r2=reshape(c2,row,column);
c3=c(:,3);
r3=reshape(c3,row,column);
c4=c(:,4);
r4=reshape(c4,row,column);
c5=c(:,5);
r5=reshape(c5,row,column);
c6=c(:,6);
r6=reshape(c6,row,column);
c7=c(:,7);
r7=reshape(c7,row,column);
c8=c(:,8);
r8=reshape(c8,row,column);
       %ploting all graphs on 1 page
subplot(2,4,1);
imshow(r1);title('LSB Bit Plane');  %this is lsb bit matrix image
subplot(2,4,2);
imshow(r2);title('2nd Bit Plane');    %this is image of 2nd bit pixel values
subplot(2,4,3);
imshow(r3);title('3rd Bit Plane');    %this is image of 3rd bit pixel values
subplot(2,4,4);
imshow(r4);title('4th Bit Plane');
subplot(2,4,5);
imshow(r5);title('5th Bit Plane');
subplot(2,4,6);
imshow(r6);title('6th Bit Plane');
subplot(2,4,7);
imshow(r7);title('7th Bit Plane');
subplot(2,4,8);
imshow(r8);title('MSB Bit Plane');   %this is image of last bit pixel values


