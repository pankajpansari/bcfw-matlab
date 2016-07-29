function [patterns_train, labels_train] = loadCIFARdata(data_name, data_path)

data_length = 5000;
file_name = strcat('cifar_train_pattern_', num2str(data_length), '.data');
fname = fullfile(data_path, file_name);
if ~exist(fname, 'file')
	fprintf('File not found \n')
else
	fprintf('File found \n')
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
fname = fullfile(data_path, 'cifar_train_label_5000.data');
if ~exist(fname, 'file')
	fprintf('File not found \n')
else
	fprintf('File found \n')
end
fid = fopen(fname);
C = fscanf(fid, '%d', [1 data_length]);
fclose(fid);
C = C';
labels_train = num2cell(C, 2);

end
