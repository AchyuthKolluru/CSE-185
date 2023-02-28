function [low_pass_img, high_pass_img] = separate_frequency(img, ratio)
    % first step fft

    frequency_map = fft2(img);
%     figure, imshow(log(abs(frequency_map) + 1), []);

    %second rearrange the frequency map
    frequency_map_shifted = fftshift(frequency_map);
%     figure, imshow(log(abs(frequency_map_shifted) + 1), []);

    %third compute the low-frequency mask
    [H,W, ~] = size(img);
    y1 = round(H/2) - round(ratio*H/2);
    y2 = round(H/2) + round(ratio*H/2) + 1;
    x1 = round(W/2) - round(ratio*W/2);
    x2 = round(W/2) + round(ratio*W/2) + 1;
    mask = zeros(size(img));
    mask(y1 : y2, x1 : x2, :) = 1;
%     figure, (imshow(mask));

    %part 4
    low_shifted = frequency_map_shifted .* mask;
    high_shifted = frequency_map_shifted .* (1-mask);
%     figure, imshow(low_shifted);
%     figure, imshow(high_shifted);

    %part 5
    low_map = ifftshift(low_shifted);
    high_map = ifftshift(high_shifted);
%     figure, imshow(log(abs(low_map) + 1), []);
%     figure, imshow(log(abs(high_map) + 1), []);

    %part 6
    low_pass_img = real(ifft2(low_map));
    high_pass_img = real(ifft2(high_map));
%     figure, imshow(low_pass_img);
%     figure, imshow(high_pass_img + 0.5);


end