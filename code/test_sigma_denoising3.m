addpath fileio
addpath noiselevel
addpath SDFilter/algorithms
addpath SDFilter/graphAnalysisToolbox-1.0

input_folder = '../data/TRI_A1/ch1';
guidance_folder = '../data/TRI_A1/ch2';
output_folder = [input_folder '/filter_out'];

% SD Denoising Parameters
nei = 0;
lambda = 7;
mu = 6000;
nu = 300;
step = 10;
issparse = false;

tic;

[input_paths, input_count, input_names] = read_image_list(input_folder);
[guidance_paths, guidance_count, guidance_names] = read_image_list(guidance_folder);

imsize = size(imread(input_paths{1}));
imsize = imsize([1 2]);
u0 = ones(imsize);

if input_count > guidance_count
    count = guidance_count;
else
    count = input_count;
end

mkdir_w_check(output_folder);

for i=1:count
    fprintf('Calculating for %s\n', input_names{i});
    
    cur_img = im2double(imread(input_paths{i}));
    f = im2double(imread(input_paths{i}));
    g = im2double(imread(guidance_paths{i}));
    
    u = sdfilter(g, u0, f, 0, lambda, mu, nu, step, issparse);
    
    imwrite(u, fullfile(output_folder, input_names{i}));
end

[sigma_m11, sigma_m12] = estimate_folder_variance(input_folder, 0);
[sigma_m21, sigma_m22] = estimate_folder_variance(output_folder, 0);

toc;

fprintf('Estimated sigma value for input image is %0.4f and %0.4f\n', ... 
    sigma_m11, sigma_m12);
fprintf('Estimated sigma value for output image is %0.4f and %0.4f\n', ... 
    sigma_m21, sigma_m22);