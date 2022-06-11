function GaussFilter = GaussianFilter1(size, sigma)
    [x,y]=meshgrid(-size/2:size/2,-size/2:size/2);
    GaussFilter = exp(-(x.^2+y.^2)/(2*sigma*sigma))/(2*pi*sigma*sigma);
end

