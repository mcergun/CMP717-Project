addpath 'noiselevel'
addpath 'fileio'
addpath 'SDFilter/algorithms'
addpath 'SDFilter/graphAnalysisToolbox-1.0'

% Script Parameters
input_index = 3;
static_guidance_index = 2;

img_dir = '../data/TRI_A1/';
result_dir = '../results/sigma_denoising';
single_image_name = 'TRI_A1_001.png';
multi_image_testing = 1;

% SD Denoising Parameters
nei = 0;
lambda = 7;
mu = 6000;
nu = 300;
step = 10;
issparse = false;

[img_list, image_count] = read_file_list(img_dir);

imsize = size(imread(img_list{1}));
imsize = imsize([1 2]);

mn = double(zeros(imsize));
var = double(zeros(imsize));
mn2 = double(zeros(imsize));
var2 = double(zeros(imsize));

sigma1 = 0;
sigma2 = 0;

u0 = ones(imsize);

if(multi_image_testing)
    for i=1:image_count
        cur_img = im2double(imread(img_list{1}));
        f = cur_img(:, :, input_index);
        g = cur_img(:, :, static_guidance_index);

        u = sdfilter(g, u0, f, 0, lambda, mu, nu, step, issparse);

    %     figure, subplot(2, 1, 1)
    %     imshow(f)
    %     subplot(2, 1, 2)
    %     imshow(u)

        if max(max(cur_img)) <= 1
            cur_img = cur_img * 255; 
        end
    
        [mn, var] = estimate_var(mn, var, f, i);
        [mn2, var2] = estimate_var(mn2, var2, u, i);

        sigma1 = sigma1 + (NoiseLevel(f) - sigma1) / i;
        sigma2 = sigma2 + (NoiseLevel(u) - sigma2) / i;
    end
    
    disp(mean2(var));
    disp(mean2(var2));
    disp(sigma1);
    disp(sigma2);
else
        cur_img = im2double(imread(fullfile(img_dir, single_image_name)));
        f = cur_img(:, :, input_index);
        g = cur_img(:, :, static_guidance_index);

        u = sdfilter(g, u0, f, 0, lambda, mu, nu, step, issparse);

        figure, subplot(2, 1, 1)
        imshow(f)
        subplot(2, 1, 2)
        imshow(u)
end


mkdir_w_check(result_dir);