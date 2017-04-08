function [ filelist, listsize ] = read_file_list( folder_path )
    filelist = fullfile(folder_path, 'filelist.txt');
    fprintf('Reading file list from "%s"\n', filelist);
    
    fid = fopen(filelist);
    
    filelist = cell(1,100);
    i = 0;
    
    tline = fgetl(fid);
    while ischar(tline)
        i = i + 1;
        im_path = fullfile(folder_path, tline);
        filelist(i) = {im_path};
        tline = fgetl(fid);
    end
    fclose(fid);
    
    filelist = filelist(1:i);
    listsize = i;
end

