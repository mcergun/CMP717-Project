function [ is_image ] = is_image_file( file_path )
is_image = 0;
try
    imfinfo(file_path);
    is_image = 1;
catch
    is_image = 0;
end
end

