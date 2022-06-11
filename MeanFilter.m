function mean_filter = MeanFilter(W, H)
    size = W*H;
    mean_filter = ones(W,H)./size;

end

