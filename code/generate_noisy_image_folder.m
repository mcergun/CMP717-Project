function generate_noisy_image_folder( folder_path, sigma )

[img_list, image_count] = read_image_list(folder_path);

new_folder_path = [folder_path '/noisy'];

mkdir_w_check(new_folder_path);

for i=1:image_count
    file_path = img_list{i};
    im = imread(file_path);
    im_noisy = generate_noisy_image(im, sigma);
    extension = file_path(strlength(file_path)-3:strlength(file_path));
    new_file_name = sprintf('sigma%02d_%02d%s', sigma, (i - 1), extension);
    imwrite(uint8(im_noisy), fullfile(new_folder_path, new_file_name));
end
end

