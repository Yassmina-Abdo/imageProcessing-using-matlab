function GaussFilter = GaussianFilter2(sigma)
    size = ceil((3.7*sigma-0.5) * 2 + 1);
    [x,y]=meshgrid(-size/2:size/2,-size/2:size/2);
    GaussFilter = exp(-(x.^2+y.^2)/(2*sigma*sigma))/(2*pi*sigma*sigma);
end

