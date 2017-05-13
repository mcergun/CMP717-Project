function [ im_noisy ] = generate_noisy_image( im, sigma )
im_noisy = im + randn(size(im)) * sigma;
im_noisy(im_noisy < 0) = 0;
im_noisy(im_noisy > 255) = 255;
end

