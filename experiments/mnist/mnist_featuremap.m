function phi = mnist_featuremap(param, x, y)
	phi = zeros(28 * 28 * 10, 1);
	offset = y * 28 * 28;
	for j = 1:28
		for k = 1:28
			phi(offset + (j - 1) * 28 + k) = x((j - 1)*28 + k);
		end
	end
%	size(x)
	size(phi);
%	display(y(1))
%	display(reshape(phi(offset + 1: offset + 784), [28, 28])')
%	display(x);
end
