function maxy = mnist_predicty(param, model, x)
	w = model.w;
	maxy = -1;
	maxVal = -10000;
	for i = 0:9
		feature = mnist_featuremap([], x, i);
		if dot(w, feature) > maxVal
			maxy = i;
			maxVal = dot(w, feature);
		end
	end
end
