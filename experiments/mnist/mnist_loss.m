function loss = mnist_loss(param, ytruth, ypredict)
loss = sum(ypredict~=ytruth) / numel(ytruth);
