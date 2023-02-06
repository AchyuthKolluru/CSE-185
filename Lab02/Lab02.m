%% Rotate 01.jpg by 45 degrees using forward warping, and save as rotate_0.jpg

img = imread("01.jpg");
[rows, columns, channels] = size(img);
%make sure image is of uint8, or else it wont save properly
newImg = uint8(zeros(rows, columns, channels));  
center = [rows/2, columns/2];

for i = (1:rows)
    for j = (1:columns)
%       disp(([i,j] - center)')
        transform = Rotate(([i, j] - center)', 45) + center';
%         disp(transform)
        nRow = round(transform(1));
        nCol = round(transform(2));
        if (nRow >= 1 && nRow <= rows) && (nCol >= 1 && nCol <= columns)
            newImg(nRow, nCol, :) = img(i, j, :);
        end
       
    end
end

imwrite(newImg, "rotate_0.jpg")



%% Rotate 01.jpg by 45 degrees using backward warping and save as rotate_1.jpg
img = imread("01.jpg");
[rows, columns, channels] = size(img);
%make sure image is of uint8, or else it wont save properly
newImg = uint8(zeros(rows, columns, channels));  
center = [rows/2, columns/2];

for i = (1:rows)
    for j = (1:columns)
%       disp(([i,j] - center)')
        transform = InvRotate(([i, j] - center)', 45) + center';
%         disp(transform)
        nRow = round(transform(1));
        nCol = round(transform(2));
        if (nRow >= 1 && nRow <= rows) && (nCol >= 1 && nCol <= columns)
            newImg(i, j, :) = img(nRow, nCol, :);
        end
       
    end
end

imwrite(newImg, "rotate_1.jpg")

%% Implement median_filter.m for lena_noisy.jpg, use patch size = 3 and save the image as median_0.jpg
img = imread('lena_noisy.jpg');

patch_size = 3;

img_median = median_filter(img, patch_size);

imwrite(img_median, 'median_0.jpg')


%% Use patch size = 5, and save the image as median_1.jpg
img = imread('lena_noisy.jpg');

patch_size = 5;

img_median = median_filter(img, patch_size);

imwrite(img_median, 'median_1.jpg')


%% Rotate Function

function vec = Rotate(x, theta)
    %cosd and sind take in degrees
    mat = [cosd(theta) -sind(theta); sind(theta) cosd(theta)];
    vec = mat * x;
end

%% Inverse Rotate Function

function vec = InvRotate(x, theta)
    %cosd and sind take in degrees
    mat = [cosd(theta) sind(theta); -sind(theta) cosd(theta)];
    vec = mat * x;
end