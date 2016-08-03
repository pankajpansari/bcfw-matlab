addpath(genpath('../../solvers/'));
addpath('helpers');

tic
data_name = 'original cifar';

[patterns_train, labels_train] = loadCIFARdata(data_name, '../../data/', 50);
%S = load('../../data/CIFAR-10_FeatureVec/trainData.mat');
%patterns_trainArr = S.trainFeatures;
%labels_trainArr = S.trainLabels;
%patters_train = num2cell(patterns_trainArr);
%labels_train = num2cell(labels_trainArr);

% create problem structure:
param = [];
param.patterns = patterns_train;
param.labels = labels_train;
param.lossFn = @cifar_loss;
param.oracleFn = @cifar_oracle;
param.featureFn = @cifar_featuremap;
param.predictFn = @cifar_predicty;

% options structure:

options = [];
options.lambda = 0.1;
options.gap_threshold = 0.1; % duality gap stopping criterion
options.num_passes = 1000; % max number of passes through data
options.do_line_search = 0;
options.debug = 1; % for displaying more info (makes code about 3x slower)
options.debug_multiplier = 0;
options.do_weighted_averaging = 1;

%% run the solver

%[model, progress] = solverFW(param, options);
[model, progress] = solverBCFW(param, options);
%[model, progress] = solverSSG(param, options);

%% loss on train set
avg_loss = 0;
for i=1:numel(patterns_train)
    ypredict = cifar_predicty(param, model, patterns_train{i}); % standard prediction as don't give label as input
    avg_loss = avg_loss + cifar_loss(param, labels_train{i}, ypredict);
end
avg_loss = avg_loss / numel(patterns_train);
fprintf('average loss on the training set: %f.\n', avg_loss);
toc

% plot the progress of the solver
%plot(progress.eff_pass, progress.primal, 'r-'); % primal
%hold on;
plot(progress.eff_pass, progress.dual, 'b--'); % dual
%hold off;
xlabel('effective passes');
