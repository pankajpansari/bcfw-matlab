function maxy = cifar_oracle(param, model, xi, yi)
	w = model.w;
	maxVal = -Inf(1);
	maxy = -1;
	
%	classes = 0:9;
%	a = cifar_loss([], yi, classes);
%	b = cifar_featuremap([], xi, classes);
%	a = arrayfun(@(x) cifar_loss([], yi, x), classes);
%	b = arrayfun(@(x) cifar_featuremap([], xi, x), classes, 'UniformOutput', 0);

%	b = reshape(b, [3072, 10]);
%	size(a)
%	size(b)
%	size(w)
%	c = dot(w, b);
%	t = a + c;
%	size(t);
%	dummy_indices = find(t == max(t));
%	maxy = dummy_indices(1) - 1;
	for i = 0:9
		temp = cifar_loss([], yi, i) + dot(w, cifar_featuremap([], xi, i));
		if temp > maxVal
			maxy = i;
			maxVal = temp; 
		end
	end
%	assert(maxy == maxy2, 'maxy = %g maxy2 = %g', maxy, maxy2)
%	assert(maxVal == max(t), 'maxVal = %g max(t) = %g', maxVal, max(t))
end

