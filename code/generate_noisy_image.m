function [ im_noisy ] = generate_noisy_image( im, sigma )
noise_data = randn(size(im)) .* sigma;
im_noisy = double(im) + noise_data;
im_noisy(im_noisy < 0) = 0;
im_noisy(im_noisy > 255) = 255;
end

