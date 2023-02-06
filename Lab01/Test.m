clc;clear;close all;
I = imread('/Users/achyuth/Desktop/a.png');
figure;
imshow(I)
red = I(:,:,1);
figure;
imshow(red)
blue = I(:,:,2);
figure;
imshow(blue)
green = I(:,:,3);
figure;
imshow(green)