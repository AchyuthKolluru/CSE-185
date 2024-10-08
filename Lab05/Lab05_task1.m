img = im2double(imread('lena.jpg'));
sigma = 2.0;
hsize = 7;
scale = 5;

I = img;

for s = 1 : scale
    % Gaussian filter
    H = fspecial('gaussian', hsize, sigma);
    org_res = imresize(img, 1/s);
    %imresize takes in the scale FACTOR
    img_resize = imresize(I, 1/s);
    filtered_g = imfilter(img_resize, H);
    % Down-sampling
    % Save or show image
    laplace = org_res - filtered_g;
    imwrite(filtered_g, sprintf('Gaussian_scale%d.jpg', s));
    imwrite(laplace + 0.5, sprintf('Laplacian_scale%d.jpg', s));
end
