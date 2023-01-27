% this file taking a random image and giving output as histogram equalization %
       % created by dharmendra (BT20ECE074) %
clc
clear all
close all
I=imread('a.jpg');   %taking image as input

[row, column, layer]=size(I)    % getting value of rows column and color

%now if our image has 3 layer then code will change it into gray image
% and if layer 1 then code will continue

if layer==1
   
    count=zeros(1,256);  % making count array to store count of pixel value
    for i=1:row
        for j=1:column
            count(I(i,j)+1)=count(I(i,j)+1)+1;
        end
    end
    countmin=0;   % here we are finding minimum  count using for loop
    for i=1:255
        if count(1,i)==0
            continue
        elseif count(i)<count(i+1)
                countmin=count(i);
        end
    end     
            
  
    histogram=uint8(zeros(row,column)); %this is grayscale matrix or image pixel value(everyelement is 0)
    sum=0;
    for i=1:256     % here we are adding count valur in previous values
        
        if count(1,i)==0
            continue        
        else
            sum=count(1,i)+sum;
            count(1,i)=sum;
        end
    end
    
    for i=1:row          % this is the formula for histogram pixel value
        for j=1:column
            histogram(i,j)=(count(I(i,j)+1)-countmin)*255/((row*column)-countmin);
            
        end
    end
    %final histogram image
    
    imshow(uint8(histogram))
     
      %else loop for finding color image histogram
else
    I=rgb2gray(I);
    count=zeros(1,256);
                       % after this same procedure
    for i=1:row
        for j=1:column
            count(I(i,j)+1)=count(I(i,j)+1)+1;
        end
    end
    countmin=0;
    for i=1:255
        if count(1,i)==0
            continue
        elseif count(i)<count(i+1)
                countmin=count(i);
        end
    end     
            
  
    histogram=uint8(zeros(row,column));
    sum=0;
    for i=1:256
        
        if count(1,i)==0
            continue
        else
            sum=count(1,i)+sum;
            count(1,i)=sum;
        end
    end
    
    for i=1:row
        for j=1:column
            histogram(i,j)=(count(I(i,j)+1)-countmin)*255/((row*column)-countmin);
            
        end
    end
    
    imshow(uint8(histogram))
end

                    
                    
            