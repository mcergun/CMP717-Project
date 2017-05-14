addpath 'fileio'

folder_path = '../data/sigma';
base_file = 'lena.jpg';
noise_sigma = 30;
image_count = 10;

addpath 'noiselevel'

generate_noisy_images(folder_path, base_file, noise_sigma, image_count);

[ mean_sigma, sigma2 ] = estimate_folder_variance( folder_path, 1);
error1 = 100 * abs((mean_sigma - noise_sigma) / noise_sigma);
error2 = 100 * abs((sigma2 - noise_sigma) / noise_sigma);

fprintf('Original sigma value = %0.2f\n', noise_sigma);
fprintf('Estimated sigma with 1st method = %0.2f, Error Rate = %0.2f\n', ...
    mean_sigma, error1);
fprintf('Estimated sigma with 2nd method = %0.2f, Error Rate = %0.2f\n', ...
    sigma2, error2);
