folder_path = '../data/TRI_A1';
noisy_folder_path = '../data/TRI_A1/noisy';
sigma = 20;

generate_noisy_image_folder(folder_path, sigma);

[sigma_m1, sigma_m2] = estimate_folder_variance(folder_path, 0);
[sigma_m11, sigma_m21] = estimate_folder_variance(noisy_folder_path, 0);

% estimate_folder_variance