clc;
clear all;

% sdfilter(static_guidance, dynamic_guidance, orig_img, neighbor_selection, 
% lambda, static_bw, dynamic_bw, num_steps, is_sparse)

addpath 'SDFilter/algorithms'
addpath 'SDFilter/graphAnalysisToolbox-1.0'

img_name = 'RGB_noise.png';
static_img_name = 'NIR.png';
img_dir = '../data/SDFilter/denoising/';
f = im2double(imread(fullfile(img_dir, img_name))); %input image
g = im2double(rgb2gray(imread(fullfile(img_dir, static_img_name)))); %static guidance image
[m,n,c] = size(f);

%scale-space filtering using joint static and dynamic guidance 
nei = 1;                   % 0: 4-neighbor 1: 8-neighbor
lambda = 15;   % regularization parameter
mu = 60;                  % bw for static guidance
nu = 30;                 % bw for dymadic guidance
step = 5;                % num of steps
issparse = false;

u0=ones(m,n,c); %dynamic guidance image (constant initialization, u0 = 1)

disp('===========================================');
disp('joint static and dynamic guidance filtering');
disp('===========================================');
disp('*configuration for multi-spectral denoising*');
St = sprintf(' img: %s \n u^0: costant \n mu: %d \n nu: %d \n isSparse: %d', img_name, mu, nu, issparse);
disp(St);fprintf('\n');

folder_name = '../results/SDFilter/denoising/';
if ~exist(folder_name, 'dir')
    mkdir(folder_name);
end

result_name = ['denoise_' int2str(lambda) '.png'];

%% joint static and dynamic guidance filtering 
tic;
u = sdfilter(g,u0,f,nei,lambda,mu,nu,step,issparse);
toc;
fprintf('\n');

figure, subplot(1, 2, 1)
imshow(f);
subplot(1, 2, 2)
imshow(u);

imwrite(u,fullfile(folder_name,result_name));   
