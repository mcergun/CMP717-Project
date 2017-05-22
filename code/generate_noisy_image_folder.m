function generate_noisy_image_folder( input_folder, output_folder, sigma )

[img_list, image_count, name_list] = read_image_list(input_folder);

mkdir_w_check(output_folder);

for i=1:image_count
    file_path = img_list{i};
    im = imread(file_path);
    im_noisy = generate_noisy_image(im, sigma);
    imwrite(uint8(im_noisy), fullfile(output_folder, name_list{i}));
end
end

