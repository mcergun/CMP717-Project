function [ sigma_m1, sigma_m2, full_data ] = estimate_folder_variance( folder_path )
% full_data includes 3 members: 
% * Full mean array for method1, full_data.full_mean_m1
% * Full variance array for method1, full_data.full_var_m1
% * Full standard deviation array for method1, full_data.full_sigma_m1
[filenames, file_count] = read_file_list(folder_path);

imsize = size(imread(filenames{1}));

mn = double(zeros(imsize));
var = double(zeros(imsize));

sigma_m2 = 0.0;

for i=1:file_count
    cur_img = double(imread(filenames{i}));
    [mn, var] = estimate_var(mn, var, cur_img, i);
    sigma_m2 = sigma_m2 + (NoiseLevel(cur_img) - sigma_m2) / i;
end

sigma1 = sqrt(var);
sigma_m1 = mean2(sigma1);

full_data.full_mean_m1 = mn;
full_data.full_var_m1 = var;
full_data.full_sigma_m1 = sigma1;

end

