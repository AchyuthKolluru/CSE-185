 %% Function
function output = median_filter(img, patch_size)
    [row, col] = size(img);
    %need to create a matrix that has padding based on the patchsize
    %enstated
    patchMatrix = padarray(img, [(patch_size - 1)/2,(patch_size - 1)/2]);
    output = zeros(row, col);

    for i = 1:row
        for j = 1:col
            filter = patchMatrix(i:i+patch_size-1, j:j + patch_size - 1);
            output(i,j) = median(filter(:));
        end
    end
    output = uint8(output);
end