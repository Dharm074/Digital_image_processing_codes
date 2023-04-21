% this file performing airthmatic comprassion technique  %
       % created by dharmendra (BT20ECE074) %
       % date - 28/02/2023 %

close all;
clear all;
clc;

str = 'ABBAS';
fprintf('The entered string is : %s\n', str);

len = length(str);
fprintf('The length of the string is : %d\n', len);

% % % get unique characters from the string
u = unique(str)
% disp('the unique symbols/characters are');
% disp(u);
fprintf('The unique characters are : %s\n', u);
len_unique = length(u);
fprintf('The length of unique character string is : %d\n', len_unique);
% % % General lookup table
% % % get zeros of length of unique characters
z = zeros(1, len_unique);
p = zeros(1, len_unique);

for i = 1 : len_unique

% % % in 'z' variable we find the occurrence of each characters from 'str'
z(i) = length(findstr(str, u(i)));

% % % in 'p' variable we will get probability of those occurrences
p(i) = z(i) / len;
end
display(z);
display(p);

% % % in 'cpr' variable we will get the cumulative
cpr = cumsum(p);
% % % in 'newcpr'  'cpr' from '0' till last value of 'p'
newcpr = [0 cpr];

display(cpr);
display(newcpr);

% % % make table upto size of 'len_unique'
for i = 1 : len_unique

% % % in first column we are placing 'newcpr' values
table(i, 1) = newcpr(i);

% % % in second column we are placing 'cpr' values
table(i, 2) = cpr(i);
end

% % % Displaying the lookup table
display('The lookup table is : ')
display(table);

% % % Encoder Table

LL = 0;
HL = 1;
for i = 1 : len
for j = 1 : len_unique

% % % if the value from 'str' matches with 'u' then
if str(i) == u(j);
pos = j; 
j = j + 1;

% % % displaying position of symbol in unique string
display(pos);

% % % getting the tag value of the matched character
diff_range = HL - LL
HL = LL + (diff_range .* table(pos, 2))
LL = LL + (diff_range .* table(pos, 1))
i = i + 1;
break
end
end
end
% % % displaying tag value
tag = LL;
display(tag);
