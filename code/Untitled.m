vals = zeros(6, 3, 3);
sce = [[3 1 1]; [3 1 1]; [3 1 1]];
vals(1, :, :) = sce;
sce = [[3 1 1]; [3 1 1]; [3 1 1]];
vals(2, :, :) = sce;
sce = [[3 1 1]; [3 1 1]; [3 1 1]];
vals(3, :, :) = sce;
sce = [[3 1 1]; [3 1 1]; [3 1 1]];
vals(4, :, :) = sce;
sce = [[1 1 3]; [1 1 1]; [1 1 3]];
vals(5, :, :) = sce;
sce = [[1 1 3]; [1 1 1]; [1 1 3]];
vals(6, :, :) = sce;

load('../data/results.mat');

for i=1:6
    for j=1:3
        lambda = vals(i, j, 1);
        mu = vals(i, j, 2);
        nu = vals(i, j, 3);
        input_noise = input_est_vals_m1(i, j, lambda, mu, nu);
        output_noise = output_est_vals_m1(i, j, lambda, mu, nu);
        diff = input_noise - output_noise;
%         fprintf('vals are %d %d %d\n', lambda, mu, nu);
        fprintf('input noise = %f , output noise = %f , diff = %f\n', input_noise, output_noise, diff); 
    end
end