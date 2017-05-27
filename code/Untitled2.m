input_folder = '../data/TRI_A1/ch1';
guidance_folder = '../data/TRI_A1/ch2';

% SD Denoising Parameters
filter_params.nei = 0;
filter_params.lambda = 7;
filter_params.mu = 6000;
filter_params.nu = 300;
filter_params.step = 10;
filter_params.issparse = false;

output_vals = evaluate_scenario(input_folder, guidance_folder, filter_params);

sigma_m11 = output_vals.input_m1;
sigma_m12 = output_vals.input_m2;
sigma_m21 = output_vals.output_m1;
sigma_m22 = output_vals.output_m2;

fprintf('Estimated sigma value for input image is %0.4f and %0.4f\n', ... 
    sigma_m11, sigma_m12);
fprintf('Estimated sigma value for output image is %0.4f and %0.4f\n', ... 
    sigma_m21, sigma_m22);