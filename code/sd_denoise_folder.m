function sd_denoise_folder( input_folder, guidance_folder, output_folder, filter_params )
[inp_paths, inp_cnt, inp_names] = read_image_list(input_folder);
[gui_paths, gui_cnt, gui_names] = read_image_list(guidance_folder);

imsize = size(imread(inp_paths{1}));
imsize = imsize([1 2]);
u0 = ones(imsize);

if inp_cnt > gui_cnt
    count = gui_cnt;
else
    count = inp_cnt;
end

mkdir_w_check(output_folder);

for i=1:count
    fprintf('Calculating for %s\n', inp_names{i});
    
    f = im2double(imread(inp_paths{i}));
    g = im2double(imread(gui_paths{i}));
    
    u = sdfilter(g, u0, f, 0, filter_params.lambda, filter_params.mu, ...
        filter_params.nu, filter_params.step, filter_params.issparse);
    
    imwrite(u, fullfile(output_folder, inp_names{i}));
end
end

