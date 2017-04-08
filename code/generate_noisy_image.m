sigma = 10;

folder_path = '../data/sigma';

im = imread(fullfile(folder_path, 'lena.jpg'));

if(size(size(im), 2) > 2)
    im = rgb2gray(im);
end

im = double(im);

image_count = 100;

fid = fopen(fullfile(folder_path, 'filelist.txt'),'wt');

for i=1:image_count
    im_noisy = im + randn(size(im)) * sigma;
    filename = sprintf('%02d.png', i - 1);
    fprintf(fid, '%s\n', filename);
    imwrite(uint8(im_noisy), fullfile(folder_path, filename));
end

fclose(fid);


close all;