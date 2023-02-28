%% Sobel filter

img = im2double(imread("lena.jpg"));
%H = [1,2,1; 0,0,0; -1,-2,-1];
H = [1, 0, -1; 2, 0, -2; 1, 0, -1];

img_sobel = sobel_filter(img, H);
figure, imshow(img_sobel);
imwrite(img_sobel, 'sobel_v.jpg');

%%
img = im2double(imread("lena.jpg"));
hsize = 9; sigma = 4;
%hsize = 5; sigma = 2;
img_guassian = gaussian_filter(img, hsize, sigma);

figure; imshow(img_guassian);
imwrite(img_guassian, 'gusassian_9.jpg')