folder_path = '../data/sigma';
base_file = 'lena.jpg';
noise_sigma = 20;
image_count = 100;

generate_noisy_image(folder_path, base_file, noise_sigma, image_count);

[filenames, file_count] = read_file_list(folder_path);

imsize = size(imread(filenames{1}));

mn = double(zeros(imsize));
var = double(zeros(imsize));

for i=1:file_count
    cur_img = double(imread(filenames{i}));
    [mn, var] = estimate_var(mn, var, cur_img, i);
end

sigma = sqrt(var);

mean_sigma = mean2(sigma);
mean_mn = mean2(mn);
error = abs((mean_sigma - noise_sigma) / noise_sigma);

fprintf('Estimated sigma value is %f, while original value is %f\n', ...
    mean_sigma, noise_sigma);
fprintf('Error margin is %.2f%%\n', error * 100);

