% This function is to calculate the advective flux along 
% the street which produce the channeling of pollutant 
% along directions to the external wind direction

function Matrix = advectiveFlux(Q, alpha, beta, MP1, MP2, axis)

if axis == 0
    % Matrix = 1;
    Matrix = (0.5 * Q) + (alpha * MP1) + (beta * MP2);
else
    Matrix = (0.5 * Q) + ((1 - alpha) * MP1) + ((1 - beta) * MP2);
end


end