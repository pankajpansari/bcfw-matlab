addpath(genpath('../../solvers/'));
addpath('helpers');

tic
data_name = 'mnist';
%%[patterns_train, labels_train, patterns_test, labels_test] = loadMNISTdata(data_name, '../../data/');
[patterns_train, labels_train] = loadMNISTdata(data_name, '../../data/');
% create problem structure:
param = [];
param.patterns = patterns_train;
param.labels = labels_train;
param.lossFn = @mnist_loss;
param.oracleFn = @mnist_oracle;
param.featureFn = @mnist_featuremap;
param.predictFn = @mnist_predicty
param.featureFn(param, patterns_train{1}, labels_train{1});
% options structure:
options = [];
options.lambda = 1;
options.gap_threshold = 0.00001; % duality gap stopping criterion
options.num_passes = 100000; % max number of passes through data
options.do_line_search = 1;
options.debug = 1; % for displaying more info (makes code about 3x slower)
options.debug_multiplier = 0
%% run the solver
%[model, progress] = solverFW(param, options);
[model, progress] = solverBCFW(param, options);
%[model, progress] = solverSSG(param, options);

%% loss on train set
avg_loss = 0;
for i=1:numel(patterns_train)
    ypredict = mnist_predicty(param, model, patterns_train{i}); % standard prediction as don't give label as input
    avg_loss = avg_loss + mnist_loss(param, labels_train{i}, ypredict);
end
avg_loss = avg_loss / numel(patterns_train);
fprintf('average loss on the training set: %f.\n', avg_loss);
toc
%% plot the progress of the solver
plot(progress.eff_pass, progress.primal, 'r-'); % primal
hold on;
plot(progress.eff_pass, progress.dual, 'b--'); % dual
hold off;
xlabel('effective passes');


