% clear
close all
clc
load('../data/results.mat');

% index         1       2       3       4       5       6
% ------------------------------------------------------------
% scenarios     1-2     1-3     2-1     2-3     3-1     3-2
% scenes        TRI_A1	TRI_A2	TRI_A4
% lambda        3       7       15
% mu            3000	6000	9000
% nu            150     300     450

scenarios = {'CH1-CH2', 'CH1-CH3', 'CH2-CH1', 'CH2-CH3', 'CH3-CH1', 'CH3-CH2'};
scenes = {'TRI_A1', 'TRI_A2', 'TRI_A4'};
lambdas = [3 7 15];
mus = [3000, 6000, 9000];
nus = [150, 300, 450];

sz = size(input_est_vals_m1);

disp('---------------------');
disp('---METHOD1 Results---');
disp('---------------------');
for scr=1:sz(1)
    for sce=1:sz(2)
        for lm=1:sz(3)
            wnd = reshape(output_est_vals_m1(scr, sce, lm, :, :), sz(4:5));
            [val, val_row, val_col] = find_smallest_index2(wnd);
            params = sprintf('lambda=%2d, mu=%4d, nu=%4d, val=%f', lambdas(lm), ...
                mus(val_row), nus(val_col), val);
            sentence = sprintf('Best value for scene %s, %s is %s', ...
                scenes{sce}, scenarios{scr}, params);
            disp(sentence);
        end
    end
end

disp('---------------------');
disp('---METHOD2 Results---');
disp('---------------------');
for scr=1:sz(1)
    for sce=1:sz(2)
        for lm=1:sz(3)
            wnd = reshape(output_est_vals_m2(scr, sce, lm, :, :), sz(4:5));
            [val, val_row, val_col] = find_smallest_index2(wnd);
            params = sprintf('lambda=%2d, mu=%4d, nu=%4d, val=%f', lambdas(lm), ...
                mus(val_row), nus(val_col), val);
            sentence = sprintf('Best value for scene %s, %s is %s', ...
                scenes{sce}, scenarios{scr}, params);
            disp(sentence);
        end
    end
end

% mu_axis = meshgrid(1:3);
% [a,nu_axis] = meshgrid(1:3);
% 
% val_axis = reshape(output_est_vals_m1(1, 1, 2, :, :), 3, 3);
% 
% surf(mu_axis, nu_axis, val_axis);