function loss = cifar_loss(param, ytruth, ypredict)
%loss = sum(ypredict~=ytruth) / numel(ytruth);
loss = (ypredict~=ytruth);
