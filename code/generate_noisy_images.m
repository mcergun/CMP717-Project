function generate_noisy_images(folder_path, base_file, sigma, image_count)

    im = imread(fullfile(folder_path, base_file));

    if(size(size(im), 2) > 2)
        im = rgb2gray(im);
    end

    im = double(im);
    if max(max(im)) <= 1
        im = im * 255;
    end

    fid = fopen(fullfile(folder_path, 'filelist.txt'),'wt');

    for i=1:image_count
        im_noisy = generate_noisy_image(im, sigma);
        filename = sprintf('%03d.png', i - 1);
        fprintf(fid, '%s\n', filename);
        imwrite(uint8(im_noisy), fullfile(folder_path, filename));
    end

    fclose(fid);

end