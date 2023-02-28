function output = gaussian_filter(img, hsize, sigma)

    guassian_filt = fspecial('gaussian', hsize, sigma);

    [row, col] = size(img);

    shift_u = floor(size(guassian_filt, 2)/2);
    shift_v = floor(size(guassian_filt, 1)/2);
    
    for u = 1 + shift_u: col - shift_u
        for v = 1 + shift_v : row - shift_v
            y1 = v - shift_v;
            y2 = v + shift_v;
            x1 = u - shift_u;
            x2 = u + shift_u;
            patch = img(y1:y2, x1:x2);
            value = patch .* guassian_filt;
            value = sum(value(:));
            output(v, u) = value;
        end
    
    end
end