function phi = cifar_featuremap(param, x, y)
	nclasses = 10;
%	image_size = 32;
%	nchannel = 3;
	featureSize = 3072; %for Pritish features
%	featureSize = nchannel * image_size * image_size; %for original CIFAR
	phi = zeros(nclasses * featureSize, 1);
	offset = y * featureSize; 
	phi(offset + 1 : offset + featureSize) = x;

%	for j = 1:image_size
%		for k = 1:image_size
%			phi(offset + (j - 1) * image_size + k) = x((j - 1)*image_size + k);
%		end
%	end
%	size(x)
	size(phi);
%	display(y(1))
%	display(reshape(phi(offset + 1: offset + 1024), [32, 32]))
%	display(x);
end
