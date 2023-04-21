        % this file taking a random image and giving output as Entropy, Intensity, 
        % Median Pixel Value, Mode Pixel Value.%
                      % created by dharmendra (BT20ECE074) %
                             % Date: 18 Feb 2023%


clc;
clear;
close all;

I = [1 2 3
     2 4 0
     3 5 3];

[row,col,layer] = size(I);

if layer ==3
    I = rgb2gray(I);     %if input image is  color image
end

I = double(I);

% Calculating the Frequency of pixel
Freq = zeros(1,8);
for i = 1:row
    for j = 1:col
        for k = 0:(2^(row)-1)
            if I(i,j)==k
                Freq(k+1)= Freq(k+1)+1;
            end
        end
    end
end

                                  % Calculating the Probablity of Each Pixel Value
Probability = (1/(row*col))*Freq;

                                          % Entropy = summation(-p*log2(p))
Entropy = 0;
for m = 1:(2^(row)-1)
    if(Probability(m)~=0)
        Entropy = Entropy + (Freq(m))*(Probability(m))*(log2(Probability(m)));
    end
end
Entropy = -(Entropy);

                                             % Calculating Average Pixel Intensity
Sum_of_Pixels = 0;
for S = 1:(row*col)
    Sum_of_Pixels = Sum_of_Pixels + I(S);
end
Avg_Pixel_Intensity = Sum_of_Pixels/(row*col);

                                                % Median Pixel Value
I_sort = sort(I(:));                          % Sorting pixels I in Ascending Order
S = size(I_sort);
Index_of_Median = round(S(1)/2);
Median_Pixel_Value = I_sort(Index_of_Median);

                                         % Calculating Mode Pixel Value
                                         % Intensity Levels ->  0   1  2  3  4  5  6  7
                                         % Frequency        ->  2   3  1  3  0  0  0  0
[Maximum_Frequency_Value,Max_Frequency_Index] = max(Freq);
Mode_Pixel_Value = (Max_Frequency_Index-1);