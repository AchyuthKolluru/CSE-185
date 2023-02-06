%% Set green channel to zero, and save as green.jpg

%Get the directory to the image
pic = imread("01.jpg");

figure;
imshow(pic)

%green channel
pic(:, :, 2) = 0;
figure;
imshow(pic)

%save the image
imwrite(pic, "Green.jpg")
%% Convert image from RGB to gray scale without usingbuilt-in functions, and save as gray.jpg
img = imread("01.jpg");

%get the RGB values
red = img(:, :, 1);
green = img(:, :, 2);
blue = img(:, :, 3);

% Use grey scale function
Grey = 0.299 * red + 0.587 * green + 0.114 * blue;

figure;
imshow(Grey)
imwrite(img, "gray.jpg")
%% Rotate 90 degrees, and save as rotate.jpg
img = imread("01.jpg");

rotate = imrotate(img, 90);
imshow(rotate)
imwrite(rotate, "rotate.jpg")
%% Crop the image given the upper left point (30, 100) and lower right point (270, 300)
% and save as crop.jpg
img = imread("01.jpg");

crop = img(30:270, 100:300,:);
imwrite(crop, "crop.jpg")

%% Horizontally flip the image, and save as flip.jpg
img = imread("01.jpg");

%The 2 signifies to flip across the y-axis, which is horizontal
flipImg = flip(img, 2);
imwrite(flipImg, "flip.jpg")

%% Combine 4 images (01.jpg ~ 04.jpg) into one matrix with 2 x 2 grid and 10 pixels separations, 
% and save as combine.jpg
img1 = imread("01.jpg");
canvas = zeros(300 * 2 + 10, 400 * 2 + 10, 3, 'uint8');
canvas(1:300, 1:400, :) = img1;
img2 = imread("02.jpg");
canvas(1:300, 411:810, :) = img2;
img3 = imread("03.jpg");
canvas(311:610, 1:400, :) = img3;
img4 = imread("04.jpg");
canvas(311:610, 411:810, :) = img4;
imshow(canvas)
imwrite(canvas, "combine.jpg")



%% Convert images (05.jpg and 06.jpg) to vectors, average them, and save as average.jpg
img5 = imread("05.jpg");
vec1 = img5(:);
img6 = imread("06.jpg");
vec2 = img6(:);
avg = (vec1 + vec2) / 2.;
avg = reshape(avg, 375, 1242, 3);
figure;
imshow(avg)
imwrite(avg, "average.jpg")

%% Upload all output images and your lab01.m





