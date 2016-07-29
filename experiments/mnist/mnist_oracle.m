function maxy = mnist_oracle(param, model, xi, yi)
	w = model.w;
	maxVal = -10000;
	maxy = -1;
	for i = 0:9
		phi = mnist_featuremap([], xi, yi) - mnist_featuremap([], xi, i);
%		size(w)
%		size(phi)
		if mnist_loss([], yi, i) - dot(w, phi) > maxVal
			maxy = i;
			maxVal = mnist_loss([], yi, i) - dot(w, phi);
	end
end

