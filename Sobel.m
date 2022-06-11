function Filter = Sobel(Mask)
    if(Mask == 'H')
        Filter = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
    elseif(Mask == 'V')
        Filter = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
    end

end

