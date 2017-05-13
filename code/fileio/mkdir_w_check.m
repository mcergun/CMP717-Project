function [ result ] = mkdir_w_check( folder_path )
    if ~exist(folder_path, 'dir')
        result = mkdir(folder_path);
    else
        result = 1;
    end
end

