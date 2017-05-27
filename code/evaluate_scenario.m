function output_vals = evaluate_scenario(input_path, guidance_path, filter_params)

addpath fileio
addpath noiselevel
addpath SDFilter/algorithms
addpath SDFilter/graphAnalysisToolbox-1.0

guidance_loc = strfind(guidance_path, 'ch')

output_path = [input_path sprintf('/filter_out__%s__L_%d__M_%d__N_%d', ...
    guidance_path(guidance_loc:guidance_loc+2), filter_params.lambda, filter_params.mu, filter_params.nu)];

tic;

sd_denoise_folder(input_path, guidance_path, output_path, filter_params);

[sigma_m11, sigma_m12] = estimate_folder_variance(input_path, 0);
[sigma_m21, sigma_m22] = estimate_folder_variance(output_path, 0);

toc;

output_vals.input_m1 = sigma_m11;
output_vals.input_m2 = sigma_m12;
output_vals.output_m1 = sigma_m21;
output_vals.output_m2 = sigma_m22;
end