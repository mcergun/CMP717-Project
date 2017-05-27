% clear
close all
clc
% load('../data/results.mat');

sz = [6 3 3 3 3]
input_est_vals_m1 = rand(sz);
input_est_vals_m2 = rand(sz);
output_est_vals_m1 = rand(sz);
output_est_vals_m2 = rand(sz);

scenario_cnt = 6;
scene_cnt = 3;

mu_axis = meshgrid(1:3);
[a,nu_axis] = meshgrid(1:3);

val_axis = reshape(output_est_vals_m1(1, 1, 2, :, :), 3, 3);

surf(mu_axis, nu_axis, val_axis);