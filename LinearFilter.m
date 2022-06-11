function final_img = LinearFilter(I, Filter, Postproc)
    function result = one_channel_filter(I, Filter,Postproc) 
        ih = size(I, 1);
        iw = size(I, 2);
        fh = size(Filter, 1);
        fw = size(Filter, 2);
        ph = (fh - 1)/2;
        pw = (fw - 1)/2;

        result = zeros(ih, iw);%output image
        padded = zeros(ih + 2 * ph, iw + 2 * pw);
        padded(1 + ph: ih + ph, 1 + pw: iw + pw) = I; %image after padding

         for i = 1 : ih
            for j = 1 : iw
                X = padded(i : i + 2 * ph, j : j + 2 * pw); % get the submatrix surrounding this pixel      
                result(i, j) = sum(sum(X .* Filter));
                if (Postproc == "cutoff")
                    if (result(i, j) > 255.0)
                        result(i, j) = 255.0;
                    end
                elseif (Postproc == "absolute")
                    if (result(i, j) < 0)
                        result(i, j) = abs(result(i, j));
                    end
                end
            end
        end
    end
    final_img = zeros(size(I));
    dim = length(size(I)); %2 if gray scale, 3 if colored
    if (dim == 2)
        final_img = one_channel_filter(I, Filter,Postproc);
    elseif (dim == 3)
        for d = 1: 3
            final_img(:, :, d) = one_channel_filter(I(:, :, d), Filter, Postproc);
        end
    end
end

