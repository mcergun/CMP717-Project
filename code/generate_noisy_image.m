function generate_noisy_image(folder_path, base_file, sigma, image_count)

    im = imread(fullfile(folder_path, base_file));

    if(size(size(im), 2) > 2)
        im = rgb2gray(im);
    end

    im = double(im);

    fid = fopen(fullfile(folder_path, 'filelist.txt'),'wt');

    for i=1:image_count
        im_noisy = im + randn(size(im)) * sigma;
        filename = sprintf('%03d.png', i - 1);
        fprintf(fid, '%s\n', filename);
        imwrite(uint8(im_noisy), fullfile(folder_path, filename));
    end

    fclose(fid);

end