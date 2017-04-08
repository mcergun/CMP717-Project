function [ sigma ] = test_sigma_calculator( folder_path )

    filenames = read_file_list(folder_path);
    file_count = size(filenames, 2);
    
    imsize = size(imread(filenames{1}));
    
    mn = double(zeros(imsize));
    var = double(zeros(imsize));
    
    for i=1:file_count
        cur_img = double(imread(filenames{i}));
        [mn, var] = estimate_sigma(mn, var, cur_img, i);
    end
    
    sigma = sqrt(var);
    
    mean_sigma = mean2(sigma)
    mean_mn = mean2(mn)
end

