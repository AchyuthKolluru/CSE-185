function [img_merged1, img_merged2] = hybrid_image(img1, img2, ratio)

    [low_pass_img1, high_pass_img1] = separate_frequency(img1, ratio);
    [low_pass_img2, high_pass_img2] = separate_frequency(img2, ratio);
    img_merged1 = low_pass_img1 + high_pass_img2;
    img_merged2 = high_pass_img1 + low_pass_img2;
    
end