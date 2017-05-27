scenario_start = 1;
scenario_end = 6;
scene_start = 1;
scene_end = 3;
lambda_start = 1;
lambda_end = 3;
mu_start = 1;
mu_end = 3;
nu_start = 1;
nu_end = 3;

% SD Denoising Parameters
filter_params.nei = 0;
filter_params.lambda = 7;
filter_params.mu = 6000;
filter_params.nu = 300;
filter_params.step = 10;
filter_params.issparse = false;

input_est_vals_m1 = zeros(scenario_end - scenario_start + 1, ...
    scene_end - scene_start + 1, lambda_end - lambda_start + 1, ...
    mu_end - mu_start + 1, nu_end - nu_start + 1);
input_est_vals_m2 = zeros(scenario_end - scenario_start + 1, ...
    scene_end - scene_start + 1, lambda_end - lambda_start + 1, ...
    mu_end - mu_start + 1, nu_end - nu_start + 1);
output_est_vals_m1 = zeros(scenario_end - scenario_start + 1, ...
    scene_end - scene_start + 1, lambda_end - lambda_start + 1, ...
    mu_end - mu_start + 1, nu_end - nu_start + 1);
output_est_vals_m2 = zeros(scenario_end - scenario_start + 1, ...
    scene_end - scene_start + 1, lambda_end - lambda_start + 1, ...
    mu_end - mu_start + 1, nu_end - nu_start + 1);

lambda_vals = [3 7 15];
mu_vals = [3000 6000 9000];
nu_vals = [150 300 450];
scene_paths = {'TRI_A1', 'TRI_A2', 'TRI_A4'};
input_paths = {'ch1' 'ch1' 'ch2' 'ch2' 'ch3' 'ch3'};
guidance_paths = {'ch2' 'ch3' 'ch1' 'ch3' 'ch1' 'ch2'};

for scenario=scenario_start:scenario_end
    for scene=scene_start:scene_end
        scn_path = ['../data/' scene_paths{scene}];
        separate_channels(scn_path);
        full_input_path = ['../data/' scene_paths{scene} '/' input_paths{scenario}];
        full_guidance_path = ['../data/' scene_paths{scene} '/' guidance_paths{scenario}];
        for l=lambda_start:lambda_end
            filter_params.lambda = lambda_vals(l);
            for m=mu_start:mu_end
                filter_params.mu = mu_vals(m);
                for n=nu_start:nu_end
                    filter_params.nu = nu_vals(n);
                    output_vals = evaluate_scenario(full_input_path, full_guidance_path, filter_params);
                    input_est_vals_m1(scenario, scene, l, m, n) = output_vals.input_m1;
                    input_est_vals_m2(scenario, scene, l, m, n) = output_vals.input_m2;
                    output_est_vals_m1(scenario, scene, l, m, n) = output_vals.output_m1;
                    output_est_vals_m2(scenario, scene, l, m, n) = output_vals.output_m2;
                end
            end
        end
    end
end

% save('../data/input_est_vals_m1.mat','input_est_vals_m1');
% save('../data/input_est_vals_m2.mat','input_est_vals_m2');
% save('../data/output_est_vals_m1.mat','output_est_vals_m1');
% save('../data/output_est_vals_m2.mat','output_est_vals_m2');

save('../data/results.mat','input_est_vals_m1','input_est_vals_m2', ...
    'output_est_vals_m1','output_est_vals_m2');
