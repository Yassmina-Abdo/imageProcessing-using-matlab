function output = EdgeMagnit(I)
    X = LinearFilter(I,Sobel('H'),"absolute");
    Y = LinearFilter(I,Sobel('V'),"absolute");
    output = abs(X+Y);

end

