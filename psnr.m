function val = psnr(est,obs)
mse = mean((est-obs).^2);
val = 10*log10(255^2/mse);
end