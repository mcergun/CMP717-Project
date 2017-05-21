function separate_channels(folder_path)

[image_paths, image_count, image_names] = read_image_list(folder_path);

if image_count > 0
    mkdir_w_check([folder_path '/ch1']);
    mkdir_w_check([folder_path '/ch2']);
    mkdir_w_check([folder_path '/ch3']);
    
    for i=1:image_count
        file_name = image_names{i};
        file_path = image_paths{i};
        im = imread(file_path);
        path1 = fullfile(folder_path, 'ch1', file_name);
        path2 = fullfile(folder_path, 'ch2', file_name);
        path3 = fullfile(folder_path, 'ch3', file_name);
        imwrite(im(:, :, 1), path1);
        imwrite(im(:, :, 2), path2);
        imwrite(im(:, :, 3), path3);
    end
end
end