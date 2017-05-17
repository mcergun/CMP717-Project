% Clear workspace and command screen
clear all;clc;
% Get image from user
I = im2double(imread(GetFilePath()));
% I = rgb2gray(im2double(imread('football.jpg')));
% I = im2double(imread('football.jpg'));
OENL = NLEstimate(I);
% Noise level to be estimated
TNL = [5,10,20,40];   % True Noise Level
% Number of channel in image ch = 3 for RGB and ch = 1 for grayscale
ch = size(I,3);
% Preallocating memory for noise level results
ENL = zeros(length(TNL),ch);
tic;
% Start estimating noise
for k = 1:length(TNL)
    % Adding Noise
    NI = I + randn(size(I)) * TNL(k);
    % Estimate Noise Level
    ENL(k,:) = NLEstimate(NI);
end
t = toc;
fprintf('Calculation time: %5.2f [sec]\n\n', t );

% Plot results
if ch == 3 % for RGB image
    
    subplot(1,3,1);
    plot(1:length(TNL),TNL,'-dr');hold on;
    plot(1:length(TNL),ENL(:,1),'-dm');
    grid on;
    title('True Vs Estimated Noise in Red Channel');
    xlabel('Number of Noise Level');
    ylabel('Noise Level');
    legend('True','Estimated','Location','North');
    subplot(1,3,2);
    plot(1:length(TNL),TNL,'-dg');hold on;
    plot(1:length(TNL),ENL(:,2),'-dm');
    title('True Vs Estimated Noise in Green Channel');
    xlabel('Number of Noise Level');
    ylabel('Noise Level');
    legend('True','Estimated','Location','North');
    grid on;
    subplot(1,3,3);
    plot(1:length(TNL),TNL,'-d');hold on;
    plot(1:length(TNL),ENL(:,3),'-dm');
    grid on;
    title('True Vs Estimated Noise in Blue Channel');
    xlabel('Number of Noise Level');
    ylabel('Noise Level');
    legend('True','Estimated','Location','North');
    
else % for gray scale image
    
    figure(1);
    plot(1:length(TNL),TNL,'-d');hold on;
    plot(1:length(TNL),ENL,'-dm');
    grid on;
    title('True Vs Estimated Noise');
    xlabel('Number of Noise Level');
    ylabel('Noise Level');
    legend('True','Estimated','Location','North');
end
