read_folder = '/home/mert/Downloads/TRI_A/TRI_A1/frames';
write_folder = '../data/TRI_A1';

image_list = dir(read_folder);
image_count = size(image_list, 1);

mkdir(write_folder);

for i=3:image_count
%  disp(image_list(i).name);
  cur_name = image_list(i).name;
  cur_im = imread(fullfile(read_folder, cur_name));
  cur_name = strrep(cur_name, '.bmp', '.png'); 
  imwrite(cur_im, fullfile(write_folder, cur_name));
end
