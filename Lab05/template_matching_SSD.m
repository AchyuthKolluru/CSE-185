function [output, matched] = template_matching_SSD(img, template)

    shift_u = floor(size(template, 2)/2);
    shift_v = floor(size(template, 1)/2);

    output = zeros(size(img));

    %u is the column index
    for u = 1 + shift_u : size(img, 2) - shift_u
    %v is the row index
        for v = 1 + shift_v : size(img, 1) - shift_v
    
            x1 = u-shift_u;
            x2 = u+shift_u;
            y1 = v-shift_v;
            y2 = v+shift_v;
    
            patch = img(y1:y2, x1:x2);
    
            % SSD
            value = sum((template(:)-patch(:)).^2);
            output(v, u) = value;
        end 
    end

    matched = (output < 25);