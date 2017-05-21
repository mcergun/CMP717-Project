function convert_images_extension(folder_path, new_extension)

[ file_paths, listsize, file_names ] = read_image_list(folder_path);

for i=1:listsize
  cur_name = file_names{i};
  cur_im = imread(file_paths{i});
  cur_extension = cur_name(end-3:end);
  if ~strcmp(cur_extension, new_extension)
      new_name = strrep(cur_name, cur_extension, new_extension); 
      disp(new_name);
      imwrite(cur_im, fullfile(folder_path, new_name));
      delete(fullfile(folder_path, cur_name));
  end
end

end
