function [ file_paths, listsize, file_names ] = read_image_list( folder_path )
dir_details = dir(folder_path);
file_paths = cell(1,10000);
file_names = cell(1,10000);
listsize = 0;
for i=1:length(dir_details)
	file_details = dir_details(i);
    file_path = fullfile(folder_path, file_details.name);
    if ~file_details.isdir && is_image_file(file_path)
        listsize = listsize + 1;
        file_paths(listsize) = {file_path};
        file_names(listsize) = {file_details.name};
    end
    file_paths = file_paths(1:listsize);
    file_names = file_names(1:listsize);
end
end

