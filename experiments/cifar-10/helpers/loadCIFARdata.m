function [patterns_train, labels_train] = loadCIFARdata(data_name, data_path, data_length)

if strcmp(data_name, 'original cifar') == 1
	fprintf('Using cifar RGB features')
	file_name = strcat('cifar_train_pattern_', num2str(data_length), '.data');
	fname = fullfile(data_path, file_name);
	if ~exist(fname, 'file')
		fprintf('Pattern file not found \n')
	else
		fprintf('Pattern file found \n')
	end

	s = '';
	for i = 1:32*32*3
		s = strcat(s, '%d');
	end

	fid = fopen(fname);
	C = fscanf(fid, s, [3*32*32 data_length]);
	fclose(fid);
	C = C';
	patterns_train = num2cell(C, 2);

	file_name = strcat('cifar_train_label_', num2str(data_length), '.data');
	fname = fullfile(data_path, file_name);
	if ~exist(fname, 'file')
		fprintf('Label file not found \n')
	else
		fprintf('Label file found \n')
	end
	fid = fopen(fname);
	C = fscanf(fid, '%d', [1 data_length]);
	fclose(fid);
	C = C';
	labels_train = num2cell(C, 2);

elseif strcmp(data_name, 'pritish cifar') == 1

	featureSize = 4096;

	fprintf('Using Pritish features \n')
	file_name = strcat('cifar_pritish_train_pattern_', num2str(data_length), '.data');
	fname = fullfile(data_path, file_name);
 	if ~exist(fname, 'file')
		fprintf('Pattern file not found \n')
	else
		fprintf('Pattern file found \n')
	end

	s = '';
	for i = 1:featureSize
		s = strcat(s, '%f');
	end

	fid = fopen(fname);
	C = fscanf(fid, s, [featureSize data_length]);
	fclose(fid);
	C = C';
	patterns_train = num2cell(C, 2);

	file_name = strcat('cifar_pritish_train_label_', num2str(data_length), '.data');
	fname = fullfile(data_path, file_name);
	if ~exist(fname, 'file')
		fprintf('Label file not found \n')
	else
		fprintf('Label file found \n')
	end
	fid = fopen(fname);
	C = fscanf(fid, '%d', [1 data_length]);
	fclose(fid);
	C = C';
	labels_train = num2cell(C, 2);
end

end
