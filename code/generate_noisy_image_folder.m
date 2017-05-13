function generate_noisy_image_folder( folder_path, sigma )

[img_list, image_count] = read_file_list(folder_path);

for i=1:image_count
    file_path = img_list{i};
    im = imread(file_path);
    im_noisy = generate_noisy_image(im, sigma);
    extension = file_path(strlength(file_path)-3:strlength(file_path));
    new_file_name = strrep(img_list{i}, extension, sprintf('_%d%s', sigma, extension));
    imwrite(uint8(im_noisy), new_file_name);
end
end

