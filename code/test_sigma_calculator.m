folder_path = '../data/sigma';
base_file = 'lena.jpg';
noise_sigma = 30;
image_count = 10;

addpath 'noiselevel'

generate_noisy_image(folder_path, base_file, noise_sigma, image_count);

[filenames, file_count] = read_file_list(folder_path);

imsize = size(imread(filenames{1}));

mn = double(zeros(imsize));
var = double(zeros(imsize));

sigma2 = 0.0;

for i=1:file_count
    cur_img = double(imread(filenames{i}));
    [mn, var] = estimate_var(mn, var, cur_img, i);
    sigma2 = sigma2 + (NoiseLevel(cur_img) - sigma2) / i;
end

sigma = sqrt(var);

mean_sigma = mean2(sigma);
mean_mn = mean2(mn);
error1 = 100 * abs((mean_sigma - noise_sigma) / noise_sigma);
error2 = 100 * abs((sigma2 - noise_sigma) / noise_sigma);

fprintf('Original sigma value = %0.2f\n', noise_sigma);
fprintf('Estimated sigma with 1st method = %0.2f, Error Rate = %0.2f\n', ...
    mean_sigma, error1);
fprintf('Estimated sigma with 2nd method = %0.2f, Error Rate = %0.2f\n', ...
    sigma2, error2);
